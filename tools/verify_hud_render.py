#!/usr/bin/env python3
"""Run the real boot + vz_draw_hud_row in the Z80 emulator for the NEW build
(embedded corrected font) and an OLD build (ROM font), render the HUD strip.
usage: python3 tools/verify_hud_render.py NEW.bin NEW.map OLD.bin OLD.map"""
import sys, re, z80
from PIL import Image
ORG=0x7AE8
ROM=bytearray(open('VZ200_basic_ROM_listing/refrence_rom.bin','rb').read())

def syms(p):
    return {m.group(1):int(m.group(2),16) for m in re.finditer(r'^(\w+)\s+= \$([0-9A-F]+)',open(p).read(),re.M)}

def run_hud(binp,mapp,fields):
    b=open(binp,'rb').read(); S=syms(mapp)
    m=z80.Z80Machine()
    m.set_memory_block(0,bytes(ROM)); m.set_memory_block(ORG,b)
    # boot up to (not including) the jump into the game
    k=b.find(bytes([0x31,0xFF,0xFF,0xCD]),S['vz_boot']-ORG); jp_at=ORG+k+6
    m.pc=S['vz_boot']; m.sp=0xFFFF; m.set_breakpoint(jp_at)
    for _ in range(300):
        m.ticks_to_stop=2_000_000; m.run()
        if m.pc==jp_at: break
    else: raise SystemExit("boot did not reach game entry")
    m.clear_breakpoint(jp_at)
    for addr,val in fields.items():           # TRS-80 ASCII bytes in HUD row
        m.set_memory_block(addr,bytes([val]))
    ret=0x0100; m.set_memory_block(ret,b'\x00')
    m.sp=0xFFF0; m.set_memory_block(0xFFF0,bytes([ret&255,ret>>8]))
    m.pc=S['vz_draw_hud_row']; m.set_breakpoint(ret)
    for _ in range(300):
        m.ticks_to_stop=2_000_000; m.run()
        if m.pc==ret: break
    else: raise SystemExit("HUD routine did not return")
    return bytes(m.get_state_view())[0x2C+0x7000:0x2C+0x7800]

def hud_fields(score,level,ghost):
    f={}
    for i,c in enumerate(score): f[0x53CC+i]=ord(c)
    f[0x53F2]=ord(level[0]); f[0x53F3]=ord(level[1])
    f[0x53FD]=ord(ghost[0]); f[0x53FE]=ord(ghost[1])
    return f

PAL={0:(0,60,0),1:(230,230,60),2:(60,60,230),3:(255,255,255)}
def strip(vram,S=6):
    img=Image.new("RGB",(128*S,8*S))
    for r in range(8):
        for x in range(128):
            v=(vram[(56+r)*32+x//4]>>(6-2*(x%4)))&3
            for dx in range(S):
                for dy in range(S): img.putpixel((x*S+dx,r*S+dy),PAL[v])
    return img

tests={"A (digits 3 and 5, the fixed glyphs)":("33355","53","35"),
       "B (digits unchanged by the fix)":("01247","68","09")}
new,newm,old,oldm=sys.argv[1:5]
rows=[];ok=True
for name,(sc,lv,gh) in tests.items():
    f=hud_fields(sc,lv,gh)
    vn=run_hud(new,newm,f); vo=run_hud(old,oldm,f)
    same=vn[56*32:]==vo[56*32:]
    print(f"test {name}: new vs old HUD strip identical = {same}")
    rows += [(f"OLD ROM font  {sc} L{lv} G{gh}",strip(vo)),(f"NEW corrected  {sc} L{lv} G{gh}",strip(vn))]
    if name.startswith("B") and not same: ok=False
    if name.startswith("A") and same: ok=False
W=rows[0][1].width; H=rows[0][1].height
sheet=Image.new("RGB",(W,(H+6)*len(rows)),(20,20,20))
for i,(n,im) in enumerate(rows): sheet.paste(im,(0,i*(H+6)))
sheet.save("hud_render_corrected_font.png")
print("expectation (A differs, B identical):","PASS" if ok else "FAIL")
