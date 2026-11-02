#!/usr/bin/env python3
"""Compare the table-driven vz_blit_frame (current build) against the original bit-twiddling
routine (baseline build kept in BASE_DIR) on identical source buffers, and time both in T-states.
Needs: pip install z80 ; outputs of `make` for the new build in cwd; baseline ghost13_ram.bin +
ghost13_hal.map in BASE_DIR (default /home/claude/base).
Usage from the repository root: python3 tools/verify_blit.py [BASE_DIR]"""
import os, random, re, sys, z80

BASE = sys.argv[1] if len(sys.argv) > 1 else '/home/claude/base'
ROM = open('VZ200_basic_ROM_listing/refrence_rom.bin', 'rb').read()

def load(d):
    ram = bytearray(open(os.path.join(d, 'ghost13_ram.bin'), 'rb').read())
    ram[0:0x4000] = ROM
    sym = {m.group(1): int(m.group(2), 16)
           for m in re.finditer(r'^(\w+)\s+= \$([0-9A-F]+)', open(os.path.join(d, 'ghost13_hal.map')).read(), re.M)}
    return ram, sym

SRC = 0xA000          # scratch source buffer (inside game area; harness only)
SENT = 0xFFF0         # return sentinel

def run_blit(ram, sym, buf, setup=None):
    m = z80.Z80Machine()
    mem = bytearray(ram)
    mem[SRC:SRC + 1024] = buf
    mem[0x7000:0x7800] = bytes([0xAA]) * 0x800      # poison VRAM so unwritten bytes show up
    m.set_memory_block(0, bytes(mem))
    if setup:
        # run boot-time table builder (new build only)
        m.pc = sym[setup]; m.sp = 0xFF00
        m.set_memory_block(0xFF00 - 2, bytes([SENT & 255, SENT >> 8]))
        m.sp = 0xFF00 - 2
        m.set_breakpoint(SENT)
        for _ in range(300):
            m.ticks_to_stop = 1_000_000; m.run()
            if m.pc == SENT: break
        assert m.pc == SENT, f"table builder did not return (pc={m.pc:04X})"
        m.clear_breakpoint(SENT)
    m.set_memory_block(0xFF00 - 2, bytes([SENT & 255, SENT >> 8]))
    m.sp = 0xFF00 - 2
    m.hl, m.bc, m.de, m.ix, m.a = SRC, 0x1234, 0x5678, 0x9ABC, 0x42
    m.pc = sym['vz_blit_frame']
    m.set_breakpoint(SENT)
    # count T-states by running in slices
    total = 0
    while m.pc != SENT and total < 3_000_000:
        m.ticks_to_stop = 1000; m.run(); total += 1000
    assert m.pc == SENT, "blit did not return"
    state = bytes(m.get_state_view())
    vram = state[0x2C + 0x7000:0x2C + 0x7800]
    regs = (m.hl, m.bc, m.de, m.ix, m.a, m.sp)
    return vram, regs, m

old_ram, old_sym = load(BASE)
new_ram, new_sym = load('.')
random.seed(13)
bufs = []
bufs.append(bytes(range(256)) * 4)                                   # every char value, 4 times
bufs.append(bytes(0x80 | (i & 0x3F) for i in range(1024)))          # all 64 graphics chars
bufs.append(bytes(1024))                                             # all blank
bufs.append(bytes([0xBF]) * 1024)                                    # all solid
bufs.append(bytes([0x20 + (i % 96) for i in range(1024)]))          # plain text codes
for _ in range(6):
    bufs.append(bytes(random.randrange(256) for _ in range(1024)))
for _ in range(4):
    bufs.append(bytes(random.choice((0x80, 0xBF, 0x8A, 0xB5, 0x20, 0x95)) for _ in range(1024)))
ok = True
for i, b in enumerate(bufs):
    v0, r0, _ = run_blit(old_ram, old_sym, b)
    v1, r1, _ = run_blit(new_ram, new_sym, b, setup='vz_build_blit_tables')
    same = v0 == v1
    ok &= same
    exp = (SRC, 0x1234, 0x5678, 0x9ABC, 0x42, 0xFF00 - 2 + 2)
    regs_ok = r1[:5] == exp[:5] and r0[:5] == exp[:5]
    ok &= regs_ok
    bad = sum(1 for x, y in zip(v0, v1) if x != y)
    print(f"buffer {i:2d}: VRAM identical={same} (diff bytes={bad}), regs preserved={regs_ok}")
print("ALL OK" if ok else "MISMATCH")
sys.exit(0 if ok else 1)
