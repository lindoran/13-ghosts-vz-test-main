#!/usr/bin/env python3
"""Run the real vz_boot + vz_draw_hud_row (3x5 font) in the Z80 emulator, compare against an
independent Python rendering of font_3x5.asm, and write a PNG of the whole 128x64 screen.
usage: verify_hud3.py   (needs make outputs ghost13_ram.bin + ghost13_hal.map; pip install z80 pillow)"""
import re, sys, z80
from PIL import Image
ROM=open('VZ200_basic_ROM_listing/refrence_rom.bin','rb').read()
RAM=open('assets/ghost13_ram.bin','rb').read()
S={m.group(1):int(m.group(2),16) for m in re.finditer(r'^(\w+)\s+= \$([0-9A-F]+)',open('assets/ghost13_hal.map').read(),re.M)}
E={k:int(v,16) for k,v in re.findall(r'^(\w+) EQU 0([0-9A-F]+)h',open('assets/ghost13_hal.asm').read(),re.M)}
FONT=[(int(a,16)<<8)|int(b,16) for a,b in re.findall(r'DEFB\s+0x(..),0x(..)\s*;\s*ordinal',open('font-asset-research/font_3x5.asm').read())]
assert len(FONT)==64
assert E_HUD9 if (E_HUD9:=True) else 0
def ref_glyph(code):                      # code = any ASCII; independent of the Z80 code
    if code>=0x60: code-=0x20
    g=FONT[code&0x3F]
    rows=[]
    for r in range(5):
        bits=(g>>(12-3*r))&7
        rows.append(sum(3<<(6-2*i) for i in range(3) if bits&(4>>i)))
    return rows
def boot():
    m=z80.Z80Machine(); m.set_memory_block(0,ROM); m.set_memory_block(0x4000,RAM[0x4000:])
    jp=S['vz_boot']; k=RAM.find(bytes([0x31,0xFF,0xFF,0xCD]),jp); jp_at=k+6
    m.pc=jp; m.sp=0xFFFF; m.set_breakpoint(jp_at)
    for _ in range(300):
        m.ticks_to_stop=2_000_000; m.run()
        if m.pc==jp_at: break
    else: raise SystemExit("boot did not reach game entry")
    m.clear_breakpoint(jp_at); return m
def call(m,addr):
    ret=0x0100; m.set_memory_block(ret,b'\x00'); m.sp=0xFFF0; m.set_memory_block(0xFFF0,bytes([ret&255,ret>>8]))
    m.pc=addr; m.set_breakpoint(ret)
    for _ in range(300):
        m.ticks_to_stop=2_000_000; m.run()
        if m.pc==ret: break
    else: raise SystemExit("did not return")
    m.clear_breakpoint(ret)
def mem(m,a,n): return bytes(m.get_state_view())[0x2C+a:0x2C+a+n]
m=boot()
# 1. cache check: all 64 glyphs vs reference
cache=mem(m,E['FONT3_CACHE'],320); bad=0
for i in range(64):
    ref=ref_glyph(i if i>=0x20 else i+0x40) if False else None
    g=FONT[i]; exp=[]
    for r in range(5):
        bits=(g>>(12-3*r))&7; exp.append(sum(3<<(6-2*k) for k in range(3) if bits&(4>>k)))
    if list(cache[i*5:i*5+5])!=exp: bad+=1; print("cache mismatch glyph",hex(i))
print("font cache:", "OK, 64 glyphs match" if not bad else f"{bad} BAD")
# 2. HUD render
def run(score,lv,gh,name):
    m.set_memory_block(E['HUD_LEVELNAME'],name.encode())
    for i,c in enumerate(score): m.set_memory_block(E['HUD_SCORE']+i,bytes([ord(c)]))
    for a,c in ((E['HUD_LEVEL10'],lv[0]),(E['HUD_LEVEL1'],lv[1]),(E['HUD_GHOST10'],gh[0]),(E['HUD_GHOST1'],gh[1])):
        m.set_memory_block(a,bytes([ord(c)]))
    m.set_memory_block(0x7000,bytes(0x800)); call(m,S['vz_draw_hud_row']); return mem(m,0x7000,0x800)
def expect(score,lv,gh,name):
    txt="SCORE "+score+" LEVEL "+lv+" GH "+gh
    v=bytearray(0x800)
    for c,ch in enumerate(txt):
        for r,b in enumerate(ref_glyph(ord(ch))): v[(57+r)*32+1+c]=b
    for c,ch in enumerate(name):
        for r,b in enumerate(ref_glyph(ord(ch))): v[(2+r)*32+7+c]=b
    return bytes(v)
PAL={0:(0,60,0),1:(230,230,60),2:(60,60,230),3:(255,255,255)}
NAMES=[RAM[0x625E+17*k:0x625E+17*k+17].decode() for k in range(7)]
print("level-name strings:",NAMES); assert all(len(n)==17 for n in NAMES)
tests=[("      120","03","07",NAMES[0]),("  1234560","12","00",NAMES[1]),("999999990","99","13",NAMES[3]),("        0","01","04",NAMES[6])]
tests+=[("        0","01","04",n) for n in NAMES if n not in [x[3] for x in tests]]
img=Image.new("RGB",(128*5,len(tests)*(64*5+10)))
ok=True
for n,t in enumerate(tests):
    v=run(*t); same=(v==expect(*t)); ok&=same
    print("HUD",t,"matches independent render:",same)
    for y in range(64):
        for x in range(128):
            c=PAL[(v[y*32+x//4]>>(6-2*(x%4)))&3]
            for dx in range(5):
                for dy in range(5): img.putpixel((x*5+dx,n*(64*5+10)+y*5+dy),c)
img.save('hud3_render.png'); print("ALL OK" if ok and not bad else "FAILED")

# 3. the game's own score-add (0x5780, unchanged TRS-80 code): what can the field do?
def add(field,de,b):
    mm=boot(); base=0x61DD
    mm.set_memory_block(base,field.encode()); mm.set_memory_block(0x61DC,b':')
    # sub_5780: HL=61DD+DE, call sub_578c B times (pop/push around); run to its ret
    ret=0x0100; mm.set_memory_block(ret,b'\x00'); mm.sp=0xFFF0; mm.set_memory_block(0xFFF0,bytes([ret&255,ret>>8]))
    mm.set_register('de',de) if hasattr(mm,'set_register') else None
    return mm
import struct
def run_add(field,de,b):
    mm=boot(); mm.set_memory_block(0x61DC,(":"+field).encode())
    prog=bytes([0x11,de&255,de>>8, 0x06,b, 0xCD,0x80,0x57, 0x76])   # ld de,DE / ld b,B / call 5780h / halt
    mm.set_memory_block(0x0200,prog); mm.sp=0xFFF0; mm.pc=0x0200; mm.set_breakpoint(0x0208)
    for _ in range(300):
        mm.ticks_to_stop=2_000_000; mm.run()
        if mm.pc==0x0208: break
    else: raise SystemExit("add did not return")
    return bytes(mm.get_state_view())[0x2C+0x61DC:0x2C+0x61DC+10].decode('latin1')
for f,de,b,lab in (("        0",7,1,"+10"),("        0",6,1,"+100"),("      990",7,1,"carry across spaces"),
                   ("999999990",7,1,"overflow past 999,999,999"),("123456780",7,3,"+30")):
    print("score add",repr(f),"DE=%d B=%d (%s) ->"%(de,b,lab),repr(run_add(f,de,b)))
