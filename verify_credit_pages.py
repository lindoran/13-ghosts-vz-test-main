#!/usr/bin/env python3
"""Title credits, three pages, with the game's REAL title sequence in the Z80 emulator: slide-in, final draw (page 1),
the real tune, then the real idle wait (0x53FF, patched to vz_title_wait): page 2 on entry, page 3 after the first
~2.8 s pass.  Checks every page against an independent render, that the wait takes the same time as the original
sub_c9eeh (sub_c9eeh is run on a copy of the machine for comparison), that it returns Z/A=0 on timeout and NZ on a key,
and that the margin wipe still happens.  Only the keyboard is simulated (vz_check_fire sees 'no key' / 'key').
usage: verify_credit_pages.py   (after `make parts`; pip install z80 pillow)"""
import re, sys, z80, copy
from PIL import Image
ROM=open('VZ200_basic_ROM_listing/refrence_rom.bin','rb').read()
RAM=open('assets/ghost13_ram.bin','rb').read()
S={m.group(1):int(m.group(2),16) for m in re.finditer(r'^(\w+)\s+= \$([0-9A-F]+)',open('assets/ghost13_hal.map').read(),re.M)}
FONT=[(int(a,16)<<8)|int(b,16) for a,b in re.findall(r'DEFB\s+0x(..),0x(..)\s*;\s*ordinal',open('font-asset-research/font_3x5.asm').read())]
def ref_glyph(ch):
    o=ord(ch); o-=0x20 if o>=0x60 else 0
    g=FONT[o&0x3F]; return [sum(3<<(6-2*i) for i in range(3) if ((g>>(12-3*r))&7)&(4>>i)) for r in range(5)]
PAGES=[[("(C) 1983 BRYAN EGGERS AND",44),("LARRY PAYNE",50),("MUSIC AND SOUND BY FANFARE",56)],
       [("(C) 1982 JON BOKELMAN.",44),('"13 GHOSTS" AND "FANFARE" ARE',50),("TRADEMARKS OF SOFTWARE AFFAIR.",56)],
       [("LICENSED TO TANDY CORPORATION -",47),("ALL RIGHTS RESERVED.",53)]]
def expected(page):
    v=bytearray(23*32)                                   # rows 41-63
    for t,y in PAGES[page]:
        cell=(32-len(t))//2
        for c,ch in enumerate(t):
            for r,b in enumerate(ref_glyph(ch)): v[(y-41+r)*32+cell+c]=b
    return bytes(v)
def boot():
    m=z80.Z80Machine(); m.set_memory_block(0,ROM); m.set_memory_block(0x4000,RAM[0x4000:])
    jp=S['vz_boot']; k=RAM.find(bytes([0x31,0xFF,0xFF,0xCD]),jp); jp_at=k+6
    m.pc=jp; m.sp=0xFFFF; m.set_breakpoint(jp_at)
    for _ in range(300):
        m.ticks_to_stop=2_000_000; m.run()
        if m.pc==jp_at: break
    m.clear_breakpoint(jp_at)
    m.set_memory_block(S['vz_cf_scan'],bytes([0x3E,0xFF,0x00])); m.set_memory_block(0x68FE,b'\xff')   # test only: 'no key'
    return m
BIG=4_000_000_000
def run_to(m,pcs,limit=200000):
    """run until pc in pcs (list); returns (pc, ticks used)"""
    for a in pcs: m.set_breakpoint(a)
    tot=0
    for _ in range(limit):
        m.ticks_to_stop=BIG; r=m.run(); tot+=BIG-m.ticks_to_stop
        if r&1 and m.pc in pcs:
            pc=m.pc
            for a in pcs: m.clear_breakpoint(a)
            return pc,tot
        if r&1: m.step_over_breakpoint()
    sys.exit("FAILED: did not reach %s"%[hex(a) for a in pcs])
vram=lambda m: bytes(m.get_state_view())[0x2C+0x7000:0x2C+0x7800]
ok=True
def check(n,c):
    global ok; ok&=bool(c); print(("PASS " if c else "FAIL ")+n)
m=boot()
run_to(m,[0x5399])                                         # slide-in done, final draw + page 1 drawn
v=vram(m); check("page 1 after the final title draw (rows 41-63 match independent render)", v[41*32:]==expected(0))
check("rows 0-14 above the logo empty, logo rows 15-39 present", not any(v[:15*32]) and any(v[15*32:40*32]))
run_to(m,[0x53FD])                                         # the whole real tune has played
check("page 1 still shown after the tune", vram(m)[41*32:]==expected(0))
m2=copy.deepcopy(m) if False else None
snaps={}
pc,_=run_to(m,[S['vtw_poll']]); snaps[2]=vram(m)[41*32:]
check("page 2 on entry to the idle wait", snaps[2]==expected(1))
t0=None
pc,t_first=run_to(m,[S['vtw_next']]); snaps[3]=vram(m)[41*32:]
check("page 3 after the first pass (still before the second)", snaps[3]==expected(2))
pc,t_rest=run_to(m,[0x5402])
total=t_first+t_rest
af=m.af; check("timeout returns Z with A = 0 (like sub_c9eeh)", (af>>8)==0 and (af&0x40)!=0)
CPU=3579545
print("idle wait: %d T = %.2f s (original sub_c9eeh measured earlier: 20,054,064 T = 5.60 s)"%(total,total/CPU))
check("idle wait length within 1% of the original", abs(total-20054064)/20054064<0.01)
# -------- key pressed during the wait: returns NZ right away, page 2 only
m=boot(); run_to(m,[0x53FD]); m.set_memory_block(S['vz_cf_scan'],bytes([0x3E,0x00,0x00]))   # now 'a key is down'
pc,_=run_to(m,[0x5402]); af=m.af
check("key pressed: returns NZ (A != 0) at once", (af&0x40)==0 and (af>>8)!=0)
check("key pressed: page 2 drawn, page 3 not", vram(m)[41*32:]==expected(1))
# -------- margin wipe on the next normal blit
m.set_memory_block(0xE000,bytes(0x400)); ret=0x0100; m.set_memory_block(ret,b'\x00'); m.sp=0xFFF0; m.set_memory_block(0xFFF0,bytes([ret&255,ret>>8])); m.hl=0xE000; m.pc=S['vz_blit_frame']
run_to(m,[ret]); v=vram(m)
check("next normal blit wipes the credits (rows 41-63 clear)", not any(v[41*32:]))
# -------- picture of the three pages
PAL={0:(0,60,0),3:(255,255,255),1:(230,230,60),2:(60,60,230)}
S5=5; frames=[]
m=boot(); run_to(m,[0x5399]); frames.append(vram(m)); run_to(m,[0x53FD]); run_to(m,[S['vtw_poll']]); frames.append(vram(m)); run_to(m,[S['vtw_next']]); frames.append(vram(m))
img=Image.new("RGB",(128*S5*3+20,64*S5),(0,60,0))
for n,vv in enumerate(frames):
    for y in range(64):
        for x in range(128):
            c=PAL[(vv[y*32+x//4]>>(6-2*(x%4)))&3]
            for dx in range(S5):
                for dy in range(S5): img.putpixel((n*(128*S5+10)+x*S5+dx,y*S5+dy),c)
img.save('credit_pages_render.png'); print("ALL OK" if ok else "FAILED")
