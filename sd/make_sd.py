#!/usr/bin/env python3
"""Build the Benn Venn SD Loader card files for 13 Ghosts.

Writes (default out dir prod/sd/):
  13GHOSTS.VZ     the sdload.asm stub as an F1 .VZ (start = load = 0xD000)
  13GHOST1.DAT .. one file per game part (split further if a part would exceed
                  MAX_CHUNK); every file is checked against FILE_LIMIT.

HARD LIMIT: the real loader cannot load a file larger than FILE_LIMIT (31,200)
bytes from the SD.  Files are cut on sector boundaries at MAX_CHUNK (60 sectors
= 30,720 bytes), and the build FAILS if any card file would exceed FILE_LIMIT.

Inputs: assets/ghost13_p{1,2,3}.bin and their load addresses from prod/*.vz.
If those are not present (e.g. only the sd/ folder was uploaded) pass
  --from-dat OLD/13GHOSTS.DAT
to rebuild from a previous single-file card image (old segment table is read
from the segments given in OLD_SEGS below).
"""
import os, shutil, struct, subprocess, sys
root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(root)

FILE_LIMIT = 31200
SEC        = 512
MAX_CHUNK  = min(60, int(os.environ.get('GHOST_CHUNK_SECTORS', 60))) * SEC   # 30,720 < 31,200 (env override is for testing the splitter only, can only go lower)
NAME_BASE  = '13GHOST'           # 13GHOST1.DAT, 13GHOST2.DAT ...
OLD_SEGS   = [(0x4000, 10240), (0x7AE8, 20254), (0xE420, 2953)]   # v1 single-file layout

args = sys.argv[1:]
from_dat = None
if '--from-dat' in args:
    i = args.index('--from-dat'); from_dat = args[i + 1]; del args[i:i + 2]
out = args[0] if args else 'prod/sd'
os.makedirs(out, exist_ok=True)

# ---- gather the parts: (start address, bytes)
parts = []
if from_dat:
    dat = open(from_dat, 'rb').read(); off = 0
    for start, ln in OLD_SEGS:
        parts.append((start, dat[off:off + ln])); off += -(-ln // SEC) * SEC
else:
    for n in (1, 2, 3):
        vz = open(f'prod/ghost13_p{n}.vz', 'rb').read()
        start = vz[22] | vz[23] << 8
        body = vz[24:]
        assert body == open(f'assets/ghost13_p{n}.bin', 'rb').read(), f'p{n} bin/vz mismatch'
        parts.append((start, body))
assert parts[0][0] == 0x4000 and parts[-1][0] == 0xE420

# ---- cut into card files
files = []                         # (name8, dest, bytes, window)
for start, body in parts:
    window = 1 if start < 0x6800 else 0
    pos = 0
    while pos < len(body):
        chunk = body[pos:pos + MAX_CHUNK]
        files.append((f'{NAME_BASE}{len(files) + 1}', start + pos, chunk, window))
        pos += len(chunk)
for name, dest, data, w in files:
    assert len(name) <= 8 and len(data) <= FILE_LIMIT, f'{name}.DAT is {len(data)} bytes > {FILE_LIMIT}'

# remove stale card files from earlier builds (old single 13GHOSTS.DAT or more chunks than now)
for f in os.listdir(out):
    if f.upper().endswith('.DAT') and (f.upper().startswith(NAME_BASE) or f.upper() == '13GHOSTS.DAT'):
        os.remove(os.path.join(out, f))

with open('sd/sd_segments.inc', 'w') as f:
    f.write('segtab:\n')
    for name, dest, data, w in files:
        f.write(f'            defw 0{dest:04X}h, {len(data)}\n            defb {w}\n'
                f'            defb 22h, "{name}", 22h\n')
    f.write('            defw 0, 0\n            defb 0\n')

asm = os.environ.get('ASM', 'vz-toolbox/bin/z88dk-z80asm')   # NOT Z80ASM: z88dk-z80asm reads that variable itself
if os.path.basename(asm).startswith('pasmo'):
    subprocess.run([asm, '-I', 'sd', 'sd/sdload.asm', 'sd/sdload.bin'], check=True)
else:
    subprocess.run([asm, '-b', '-Isd', 'sd/sdload.asm'], check=True)
code = open('sd/sdload.bin', 'rb').read()
assert 0xD000 + len(code) <= 0xD200, 'stub overruns staging buffer'
hdr = b'VZF0' + b'13GHOSTS'.ljust(17, b'\0') + b'\xF1' + struct.pack('<H', 0xD000)
open(f'{out}/13GHOSTS.VZ', 'wb').write(hdr + code)
for name, dest, data, w in files:
    open(f'{out}/{name}.DAT', 'wb').write(data)
print(f'13GHOSTS.VZ  {len(hdr)+len(code)} bytes (stub {len(code)} bytes at D000)')
for name, dest, data, w in files:
    print(f'{name}.DAT {len(data):6d} bytes ({-(-len(data)//SEC)} sectors)  -> {dest:04X}-{dest+len(data)-1:04X}{"  [SRAM window]" if w else ""}')
print(f'largest card file: {max(len(d) for _,_,d,_ in files)} bytes (limit {FILE_LIMIT})')
