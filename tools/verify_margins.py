#!/usr/bin/env python3
"""Check the HUD / credits margin cleanup in the Z80 emulator (real HAL code, assets/ build outputs).
 1. gameplay path (vz_blit_site1) must NOT wipe the HUD margins (no per-frame flicker);
 2. any other blit (game over, demo end, other screens) must wipe BOTH margins and clear the flag;
 3. a pending title-credits wipe must still happen on the first gameplay blit.
usage: python3 tools/verify_margins.py   (after `make parts`; pip install z80)"""
import re, z80
ROM=open('VZ200_basic_ROM_listing/refrence_rom.bin','rb').read()
RAM=open('assets/ghost13_ram.bin','rb').read()
S={m.group(1):int(m.group(2),16) for m in re.finditer(r'^(\w+)\s+= \$([0-9A-F]+)',open('assets/ghost13_hal.map').read(),re.M)}
E={k:int(v,16) for k,v in re.findall(r'^(\w+) EQU 0([0-9A-F]+)h',open('assets/ghost13_hal.asm').read(),re.M)}
m=z80.Z80Machine(); m.set_memory_block(0,ROM); m.set_memory_block(0x4000,RAM[0x4000:])
jp=S['vz_boot']; k=RAM.find(bytes([0x31,0xFF,0xFF,0xCD]),jp); jp_at=k+6
m.pc=jp; m.sp=0xFFFF; m.set_breakpoint(jp_at)
for _ in range(300):
    m.ticks_to_stop=2_000_000; m.run()
    if m.pc==jp_at: break
m.clear_breakpoint(jp_at)
mem=lambda a,n=1: bytes(m.get_state_view())[0x2C+a:0x2C+a+n]
flag=lambda: mem(S['vz_margin_dirty'])[0]
def call(addr,hl=None):
    ret=0x0100; m.set_memory_block(ret,b'\x00'); m.sp=0xFFF0; m.set_memory_block(0xFFF0,bytes([ret&255,ret>>8]))
    if hl is not None: m.hl=hl
    m.pc=addr; m.set_breakpoint(ret)
    for _ in range(300):
        m.ticks_to_stop=2_000_000; m.run()
        if m.pc==ret: break
    else: raise SystemExit("did not return")
    m.clear_breakpoint(ret)
BUF=0xE000; m.set_memory_block(BUF,bytes(0x400))
def hud(): 
    for a,c in ((E['HUD_SCORE'],b'     1230'),(E['HUD_LEVELNAME'],b'  Dead of Night  '),(E['HUD_LEVEL10'],b'0'),(E['HUD_LEVEL1'],b'3'),(E['HUD_GHOST10'],b'0'),(E['HUD_GHOST1'],b'7')):
        m.set_memory_block(a,c)
    call(S['vz_draw_hud_row'])
margins=lambda: mem(0x7000,256)+mem(0x7700,256)
ok=True
def check(name,cond):
    global ok; ok&=bool(cond); print(("PASS " if cond else "FAIL ")+name)
m.set_memory_block(0x7000,bytes(0x800)); hud()
check("HUD drawn: both margins non-empty, flag bit1 set", any(mem(0x7000,256)) and any(mem(0x7700,256)) and flag()==2)
# markers on cells the HUD never writes (row 0 cell 0, row 56 cell 0): show whether a wipe happened
m.set_memory_block(0x7000,b'\xaa'); m.set_memory_block(0x7700,b'\xaa')
call(S['vz_blit_site1'],BUF)
check("gameplay blit (vz_blit_site1) does not wipe the margins", mem(0x7000)==b'\xaa' and mem(0x7700)==b'\xaa')
hud()
check("flag is HUD-only (2) after a gameplay frame", flag()==2)
call(S['vz_blit_frame'],BUF)
check("any other blit wipes the top margin", not any(mem(0x7000,256)))
check("any other blit wipes the bottom margin", not any(mem(0x7700,256)))
check("flag cleared", flag()==0)
m.set_memory_block(0x7000,b'\xaa'); call(S['vz_blit_frame'],BUF)
check("a second blit does not wipe again (flag stays 0)", mem(0x7000)==b'\xaa')
# pending title credits must be wiped by the first gameplay blit
m.set_memory_block(0x7000,bytes(0x800)); m.set_memory_block(0x7700,b'\xaa'); m.set_memory_block(S['vz_margin_dirty'],b'\x01')
call(S['vz_blit_site1'],BUF)
check("credits pending + gameplay blit: margin wiped, credits bit gone, HUD redrawn (flag = 2)", mem(0x7700)==b'\x00' and flag()==2 and any(mem(0x7700,256)))
print("ALL OK" if ok else "FAILED")
