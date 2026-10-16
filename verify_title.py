#!/usr/bin/env python3
"""Run the REAL game from its entry point in the Z80 emulator until the title screen's final draw
(0x5396, patched to vz_title_draw) has returned, then check the 128x64 VRAM: credits text against an
independent render from font_3x5.asm, logo against the decoded screen, bottom margin clear after the
next blit.  usage: verify_title.py  (after `make`; needs pip z80 pillow)"""
import re, sys, time, z80
from PIL import Image
ROM=open('VZ200_basic_ROM_listing/refrence_rom.bin','rb').read()
RAM=open('ghost13_ram.bin','rb').read()
S={m.group(1):int(m.group(2),16) for m in re.finditer(r'^(\w+)\s+= \$([0-9A-F]+)',open('ghost13_hal.map').read(),re.M)}
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
m.clear_breakpoint(jp_at); m.set_breakpoint(0x5399)      # first instruction after the patched title call
t0=time.time(); hit=0
for i in range(3000):
    m.ticks_to_stop=2_000_000; m.run()
    if m.pc==0x5399: hit=1; break
    if time.time()-t0>240: break
print("reached title final draw:",bool(hit),"after %.0fs"%(time.time()-t0))
if not hit: sys.exit("FAILED: did not reach 0x5399")
vram=lambda: bytes(m.get_state_view())[0x2C+0x7000:0x2C+0x7800]
v=vram()
lines=[("(C) 1983 BRYAN EGGERS AND",41),("LARRY PAYNE",47),("MUSIC AND SOUND BY FANFARE",53),("(C) 1982 JON BOKELMAN.",59)]
exp=bytearray(0x800); ok=True
for t,y in lines:
    cell=(32-len(t))//2
    for c,ch in enumerate(t):
        for r,b in enumerate(ref_glyph(ch)): exp[(y+r)*32+cell+c]=b
# credit area (rows 41-63) must equal the reference; rows 8-40 = logo (non-empty, nothing from credits)
print("credit rows 41-63 match independent render:", v[41*32:]==bytes(exp[41*32:]))
print("margin above logo rows 0-14 empty:", not any(v[0:15*32]), "| logo rows 15-39 non-empty:", any(v[15*32:40*32]))
ok=(v[41*32:]==bytes(exp[41*32:])) and not any(v[0:15*32]) and any(v[15*32:40*32])
PAL={0:(0,60,0),1:(230,230,60),2:(60,60,230),3:(255,255,255)}
S5=5; img=Image.new("RGB",(128*S5,64*S5))
for y in range(64):
    for x in range(128):
        c=PAL[(v[y*32+x//4]>>(6-2*(x%4)))&3]
        for dx in range(S5):
            for dy in range(S5): img.putpixel((x*S5+dx,y*S5+dy),c)
img.save('title_render.png')
# clear-on-next-blit: flag set, call the real vz_blit_frame on a blank buffer (HL = buffer), margin rows must clear
flag=bytes(m.get_state_view())[0x2C+S['vz_cred_on']]
print("vz_cred_on after title draw:",flag)
m.clear_breakpoint(0x5399); ret=0x0100; m.set_memory_block(ret,b'\x00')
m.set_memory_block(0xE000,bytes(0x400))            # blank 1K screen buffer
m.sp=0xFFF0; m.set_memory_block(0xFFF0,bytes([ret&255,ret>>8])); m.hl=0xE000; m.pc=S['vz_blit_frame']; m.set_breakpoint(ret)
for _ in range(50):
    m.ticks_to_stop=2_000_000; m.run()
    if m.pc==ret: break
v2=vram(); flag2=bytes(m.get_state_view())[0x2C+S['vz_cred_on']]
print("after next blit: bottom margin rows 56-63 clear:", not any(v2[56*32:]), "| flag cleared:", flag2==0, "| playfield rows 8-55 clear:", not any(v2[8*32:56*32]))
ok&=(not any(v2[56*32:])) and flag2==0 and flag==1
print("ALL OK" if ok else "FAILED")
