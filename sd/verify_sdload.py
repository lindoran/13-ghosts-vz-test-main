#!/usr/bin/env python3
"""Verify the SD card files by running the REAL VZDOS firmware in the Java VZ200
emulator (SD loader model): LOAD"13GHOSTS" from a folder card, wait for the game
entry point (vz_boot, E420), and compare RAM with every card file at its address.
Also enforces the 31,200-byte file limit on everything on the card.

  python3 sd/verify_sdload.py EMU_DIR ROM.bin VZDOS.VZ [prod/sd]

EMU_DIR = VZ200-Emulator-master (built into EMU_DIR/build; test class from
EMU_DIR/test/emulator/vz200/GhostLoadTest.java is compiled here on demand).
Runs both RAM maps (VZ200 $9000+ and VZ300 $B800+), each with VZDOS.VZ on the card (DOS runs from SRAM)
and without it (DOS runs from the EPROM).
What this does NOT prove: behaviour of a real card / real SD Loader hardware.
"""
import os, re, shutil, subprocess, sys, tempfile
FILE_LIMIT = 31200
emu, rom, dos = (os.path.abspath(a) for a in sys.argv[1:4])
root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
card_src = os.path.abspath(sys.argv[4]) if len(sys.argv) > 4 else os.path.join(root, 'prod/sd')
tmp = tempfile.mkdtemp()
tb = os.path.join(tmp, 'tb'); os.makedirs(tb)
cp = f'{emu}/build'
subprocess.run(['javac', '-nowarn', '-d', tb, '-cp', cp] + [f'{emu}/test/emulator/vz200/{n}' for n in ('HeadlessVZ.java', 'GhostLoadTest.java', 'BootCheck.java')],
               check=True, capture_output=True)
ok = True
if not os.path.exists(os.path.join(card_src, 'VZDOS.VZ')):
    ok = False
    print('FAIL  VZDOS.VZ is not on the card: the loader prints "LOOKING FOR VZDOS.VZ / NOT FOUND" at boot (make sd SD_DOS=...)')
for f in sorted(os.listdir(card_src)):
    size = os.path.getsize(os.path.join(card_src, f))
    good = size <= FILE_LIMIT; ok &= good
    print(f'{"PASS" if good else "FAIL"}  {f} {size} bytes <= {FILE_LIMIT}')
inc = open(os.path.join(root, 'sd/sd_segments.inc')).read()
ents = re.findall(r'defw 0([0-9A-F]{4})h, (\d+)\s+defb (\d)\s+defb 22h, "(\w+)"', inc)
for label, vz300 in (('VZ200 RAM map', 'false'), ('VZ300 RAM map', 'true')):
  for variant in ('VZDOS.VZ on card (DOS in SRAM)', 'no VZDOS.VZ (DOS in EPROM)'):
    on_card = variant.startswith('VZDOS')
    card = os.path.join(tmp, f'card_{vz300}_{int(on_card)}'); shutil.copytree(card_src, card)
    tag = f'[{label}, {variant}]'
    if on_card:
        b = subprocess.run(['java', '-cp', f'{cp}:{tb}', 'emulator.vz200.BootCheck', rom, dos, card, vz300], capture_output=True, text=True)
        clean = b.returncode == 0; ok &= clean
        print(f'{"PASS" if clean else "FAIL"}  {tag} DOS boot screen clean (no NOT FOUND / ERROR)')
        if not clean: print(b.stdout[-600:])
        if not os.path.exists(os.path.join(card, 'VZDOS.VZ')): shutil.copy(dos, card)   # keep checking the load itself
    elif os.path.exists(os.path.join(card, 'VZDOS.VZ')):
        os.remove(os.path.join(card, 'VZDOS.VZ'))   # the stub must also work when the DOS runs from the EPROM
    r = subprocess.run(['java', '-cp', f'{cp}:{tb}', 'emulator.vz200.GhostLoadTest', rom, dos, card, '13GHOSTS', 'E420', '3000', vz300],
                       capture_output=True, text=True)
    reached = 'reached entry E420: true' in r.stdout
    ok &= reached; print(f'{"PASS" if reached else "FAIL"}  {tag} LOAD"13GHOSTS" reaches vz_boot (E420)')
    if not reached: print(r.stdout[-800:]); continue
    ram = bytes.fromhex(open(os.path.join(tmp, 'ram_at_entry.hex')).read())
    for a, l, w, n in ents:
        a, l = int(a, 16), int(l)
        body = open(os.path.join(card, n + '.DAT'), 'rb').read()
        same = ram[a:a + l] == body[:l]; ok &= same
        print(f'{"PASS" if same else "FAIL"}  {tag} {n}.DAT -> {a:04X}-{a + l - 1:04X} identical in RAM')
shutil.rmtree(tmp)
print('\nALL PASS' if ok else '\nFAILED'); sys.exit(0 if ok else 1)
