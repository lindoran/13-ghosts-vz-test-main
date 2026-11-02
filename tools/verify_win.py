#!/usr/bin/env python3
"""Win screen: run the game's REAL win path (0x568B: draw screen 39, build the HUD row template with the level name
and the '*' winner marker) up to the patched copy at 0x56A7, and check the 3x5 status row against an independent
render of the template the game just built.  Music (sub_c793) is stubbed.
usage: python3 tools/verify_win.py   (after `make parts`; pip install z80 pillow)"""
import re, sys, z80
from PIL import Image
ROM=open('VZ200_basic_ROM_listing/refrence_rom.bin','rb').read()
RAM=open('assets/ghost13_ram.bin','rb').read()
S={m.group(1):int(m.group(2),16) for m in re.finditer(r'^(\w+)\s+= \$([0-9A-F]+)',open('assets/ghost13_hal.map').read(),re.M)}
FONT=[(int(a,16)<<8)|int(b,16) for a,b in re.findall(r'DEFB\s+0x(..),0x(..)\s*;\s*ordinal',open('font-asset-research/font_3x5.asm').read())]
def ref_glyph(ch):
    o=ord(ch); o-=0x20 if o>=0x60 else 0
    g=FONT[o&0x3F]; return [sum(3<<(6-2*i) for i in range(3) if ((g>>(12-3*r))&7)&(4>>i)) for r in range(5)]
m=z80.Z80Machine(); m.set_memory_block(0,ROM); m.set_memory_block(0x4000,RAM[0x4000:])
jp=S['vz_boot']; k=RAM.find(bytes([0x31,0xFF,0xFF,0xCD]),jp); jp_at=k+6
m.pc=jp; m.sp=0xFFFF; m.set_breakpoint(jp_at)
for _ in range(300):
    m.ticks_to_stop=2_000_000; m.run()
    if m.pc==jp_at: break
m.clear_breakpoint(jp_at); m.set_breakpoint(0x5399)
for _ in range(3000):
    m.ticks_to_stop=2_000_000; m.run()
    if m.pc==0x5399: break
else: sys.exit("FAILED: never reached the title")
m.clear_breakpoint(0x5399)
mem=lambda a,n=1: bytes(m.get_state_view())[0x2C+a:0x2C+a+n]
m.set_memory_block(0xC793,b'\xC9')                                  # music stub
# state the game would have when the last level is beaten
m.set_memory_block(0x61DD,b'    12340'); m.set_memory_block(0x61D5+50,b'12'); m.set_memory_block(0x61D5+61,b' 0')
m.set_memory_block(0x7000,bytes(0x800))
m.sp=0xFFF0; m.set_memory_block(0xFFF0,b'\x00\x01'); m.pc=0x568B; m.set_breakpoint(0x56AF)   # 56AF = first instruction after the patched copy
for _ in range(400):
    m.ticks_to_stop=2_000_000; m.run()
    if m.pc==0x56AF: break
else: sys.exit("FAILED: win path did not reach 0x56AF")
v=mem(0x7000,0x800); tpl=mem(0x61D5,64)
print("template the game built:",tpl)
name=tpl[22:39].decode(); score=tpl[8:17].decode(); lv=tpl[50:52].decode(); gh=tpl[61:63].decode()
exp=bytearray(0x800)
for t,y,cell in ((name,2,7),("SCORE "+score+" LEVEL "+lv+" GH "+gh,57,1)):
    for c,ch in enumerate(t):
        for r,b in enumerate(ref_glyph(ch)): exp[(y+r)*32+cell+c]=b
ok=True
def check(n,c):
    global ok; ok&=bool(c); print(("PASS " if c else "FAIL ")+n)
check("score field starts with the winner marker '*'", score[0]=='*')
check("level name is the first string, '    13 GHOSTS    '", name=='    13 GHOSTS    ')
check("top margin (level name) matches independent render", v[2*32:7*32]==bytes(exp[2*32:7*32]))
check("bottom margin (status row, '*' score) matches independent render", v[57*32:62*32]==bytes(exp[57*32:62*32]))
check("screen 39 graphics drawn in the playfield (rows 10-46)", any(v[10*32:47*32]))
check("margin wipe flag bit 0 set (persists past the gameplay blit)", mem(S['vz_margin_dirty'])[0]&1==1)
PAL={0:(0,60,0),3:(255,255,255),1:(230,230,60),2:(60,60,230)}
S5=5; img=Image.new("RGB",(128*S5,64*S5))
for y in range(64):
    for x in range(128):
        c=PAL[(v[y*32+x//4]>>(6-2*(x%4)))&3]
        for dx in range(S5):
            for dy in range(S5): img.putpixel((x*S5+dx,y*S5+dy),c)
img.save('win_render.png'); print("ALL OK" if ok else "FAILED")
