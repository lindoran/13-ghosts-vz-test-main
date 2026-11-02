#!/usr/bin/env python3
"""Run the real vz_boot (from ghost13_ram.bin + ghost13_hal.map) in a Z80 emulator
with the ROM font region deliberately poisoned, and check that the 1 KB font tile
cache comes out equal to an independent Python conversion of corrected_table.asm.
Needs: pip install z80 ; outputs of `make` (ghost13_ram.bin, ghost13_hal.map)."""
import re, sys, z80

ROM = bytearray(open('VZ200_basic_ROM_listing/refrence_rom.bin', 'rb').read())
RAM = open('ghost13_ram.bin', 'rb').read()
SYM = {m.group(1): int(m.group(2), 16)
       for m in re.finditer(r'^(\w+)\s+= \$([0-9A-F]+)', open('ghost13_hal.map').read(), re.M)}
TILE = int(re.search(r'TILE_CACHE EQU 0([0-9A-F]+)h', open('ghost13_hal.asm').read()).group(1), 16)
rows = re.findall(r'DEFB\s+((?:0x[0-9A-Fa-f]{2},?){5})', open('VZ200_basic_ROM_listing/corrected_table.asm').read())
tab = bytes(int(x, 16) for r in rows for x in r.split(','))

def ref_cache(t):
    out = bytearray()
    for g in range(64):
        cols = t[g * 5:g * 5 + 5]
        for r in range(8):
            px = [3 if not (c >> r) & 1 else 0 for c in cols] + [0, 0, 0]
            out.append(px[0] << 6 | px[1] << 4 | px[2] << 2 | px[3])
            out.append(px[4] << 6 | px[5] << 4 | px[6] << 2 | px[7])
    return bytes(out)

def run(poison):
    m = z80.Z80Machine()
    r = bytearray(ROM)
    if poison:
        r[0x3B94:0x3B94 + 320] = bytes([0x55]) * 320          # trash the ROM's own font
    mem = bytearray(RAM); mem[0:0x4000] = r
    m.set_memory_block(0, bytes(mem))
    m.pc = SYM['vz_boot']; m.sp = 0xFFFF
    m.set_breakpoint(0x535A)                                    # game entry
    for _ in range(300):
        m.ticks_to_stop = 2_000_000; m.run()
        if m.pc == 0x535A: break
    else:
        sys.exit("vz_boot did not reach the game entry")
    return bytes(m.get_state_view())[0x2C + TILE:0x2C + TILE + 1024]

ok = True
for poison in (False, True):
    c = run(poison)
    good = c == ref_cache(tab)
    ok &= good
    print(f"ROM font poisoned={poison}: tile cache == corrected-table reference: {good}")
sys.exit(0 if ok else 1)
