#!/usr/bin/env python3
"""High-score name entry + table, with the game's own code in the Z80 emulator (real game booted to the title
screen first, so the screen table and game state exist).  Only the timing/keyboard/music helpers are stubbed:
  VZ ROM 0049h (wait key)  -> fed from a key queue (VRAM is captured before each key is supplied)
  sub_c9ee (key wait)      -> always 'key pressed'     sub_603a (wait release) -> ret     sub_c793 (music) -> ret
Checks: name-entry prompt/slots drawn after each keystroke, the typed name lands in NAME_BUF (3 letters max), three
real insertions (0x5A49 flow, incl. the game's table shift) leave the right table, and the table screen
(rank, name, score, 5+5 lines, underline cleared, title graphics intact) matches an independent render.
usage: verify_highscores.py   (after `make parts`; pip install z80 pillow)"""
import re, sys, z80
from PIL import Image
ROM=open('VZ200_basic_ROM_listing/refrence_rom.bin','rb').read()
RAM=open('assets/ghost13_ram.bin','rb').read()
S={m.group(1):int(m.group(2),16) for m in re.finditer(r'^(\w+)\s+= \$([0-9A-F]+)',open('assets/ghost13_hal.map').read(),re.M)}
E={k:int(v,16) for k,v in re.findall(r'^(\w+) EQU 0([0-9A-F]+)h',open('assets/ghost13_hal.asm').read(),re.M)}
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
# --- test stubs (test memory only)
m.set_memory_block(0xC9EE,bytes([0x3E,0x01,0xB7,0xC9]))   # sub_c9ee: ld a,1 / or a / ret   (NZ = key down)
m.set_memory_block(0x603A,b'\xC9'); m.set_memory_block(0xC793,b'\xC9')
KEYS=[]; SNAPS=[]; CAPTURE={}
def run_until(stop_pc, limit=4000):
    m.set_breakpoint(0x0049); m.set_breakpoint(stop_pc)
    for a in CAPTURE: m.set_breakpoint(a)
    for _ in range(limit):
        m.ticks_to_stop=2_000_000; m.run()
        if m.pc in CAPTURE and m.pc!=stop_pc and CAPTURE[m.pc] is None:
            CAPTURE[m.pc]=mem(0xCA12,1024); m.clear_breakpoint(m.pc)      # buffer 0 as the patched blit receives it
        elif m.pc==0x0049:
            SNAPS.append(mem(0x7000,0x800))
            if not KEYS: raise SystemExit("FAILED: game asked for a key but the queue is empty")
            ret=mem(m.sp,2); m.a=KEYS.pop(0); m.pc=ret[0]|ret[1]<<8; m.sp=m.sp+2
        elif m.pc==stop_pc: break
    else: raise SystemExit("FAILED: did not reach %04X"%stop_pc)
    m.clear_breakpoint(0x0049); m.clear_breakpoint(stop_pc)
def call(addr,hl=None,limit=4000):
    ret=0x0100; m.set_memory_block(ret,b'\x00'); m.sp=0xFFF0; m.set_memory_block(0xFFF0,bytes([ret&255,ret>>8]))
    if hl is not None: m.hl=hl
    m.pc=addr; run_until(ret,limit)
ok=True
def check(name,cond):
    global ok; ok&=bool(cond); print(("PASS " if cond else "FAIL ")+name)
def text_rows(lines):                       # lines: [(text, VZ ink row, first cell)] -> expected 0x800 bytes
    v=bytearray(0x800)
    for t,y,cell in lines:
        for c,ch in enumerate(t):
            for r,b in enumerate(ref_glyph(ch)): v[(y+r)*32+cell+c]=b
    return v
# ---------------------------------------------------------------- A. name entry, real sub_5b2e
call(0x6012,0x630E)                                         # draw screen 37 (GREAT SCORE) like 0x5A8F
KEYS[:]=[ord('a'),ord('b'),ord('C'),ord('d'),13]; SNAPS.clear()
call(0x5B2E)
slots=["___","A__","AB_","ABC","ABC"]
for n,(snap,s) in enumerate(zip(SNAPS,slots)):
    exp=text_rows([("TYPE YOUR NAME, THEN RETURN",41,2),(s,49,14)])
    check(f"name entry, before key {n+1}: prompt + '{s}' drawn", snap[41*32:46*32]==bytes(exp[41*32:46*32]) and snap[49*32:54*32]==bytes(exp[49*32:54*32]))
check("3-letter limit: NAME_BUF = 'ABC' + spaces after RETURN", mem(E['NAME_BUF'],15)==b'ABC'+b' '*12)
check("title graphics of screen 37 (rows 24-34) not disturbed by the text", any(SNAPS[-1][24*32:35*32]))
Image.frombytes('P',(1,1),b'\0')  # (keep PIL import used)
promptshot=SNAPS[2]
# ---------------------------------------------------------------- B. three real insertions through 0x5A49
def insert(score,name):
    m.set_memory_block(0x61DD,score.encode()); KEYS[:]=[ord(c) for c in name]+[13]; SNAPS.clear()
    m.sp=0xFFF0; m.set_memory_block(0xFFF0,b'\x00\x01'); m.pc=0x5A49
    # the flow ends with jp l538fh (title): stop there
    run_until(0x538F)
for sc,nm in (("    45670","xyz"),("    99990","AAA"),("     1230","low"),("123456780","big"),("*   45670","win")):
    insert(sc,nm)
tbl=[(mem(0x634B+24*i,15),mem(0x634B+24*i+15,9)) for i in range(10)]
want=[("BIG","123456780"),("WIN","*   45670"),("AAA","    99990"),("XYZ","    45670"),("LOW","     1230")]
for i,(n,sc) in enumerate(want):
    check(f"table entry {i+1} = {n} {sc.strip()} (game's own shift/insert)", tbl[i][0]==n.encode().ljust(15) and tbl[i][1]==sc.encode())
check("entries 6-10 still empty", all(t[0]==b' '*15 and t[1]==b' '*9 for t in tbl[5:]))
# ---------------------------------------------------------------- C. table screen via the game's sub_5ae1
CAPTURE[S['vz_hs_blit']]=None
call(0x5AE1)
buf=CAPTURE.pop(S['vz_hs_blit'])
v=mem(0x7000,0x800)
lines=[]
dst=[(33+6*i,0) for i in range(5)]+[(33+6*i,17) for i in range(5)]
for i,(y,cell) in enumerate(dst):
    rank=f"{i+1:>2}"; n,sc=tbl[i]
    lines.append((rank+" "+n[:3].decode()+" "+(" BUSTER!" if sc[0:1] not in (b" ",b"*") else ("*"+sc.decode()[2:] if sc[0:1]==b"*" and sc[1:2]==b" " else sc.decode()[1:])),y,cell))
exp=text_rows(lines)
for i,(t,y,cell) in enumerate(lines):
    check(f"table line {i+1} '{t.strip()}' matches independent render", all(v[(y+r)*32+cell:(y+r)*32+cell+15]==bytes(exp[(y+r)*32+cell:(y+r)*32+cell+15]) for r in range(5)))
check("underline row 38 cleared, row 32 blank", not any(v[38*32:39*32]) and not any(v[32*32:33*32]))
# graphics above the table: rows 8-31 must equal the independent conversion of the decoded screen 38 (char rows 0-7)
g=bytearray(24*32)
for r in range(8):
    for col in range(64):
        c=buf[r*64+col]
        if c<0x80: continue
        for b in range(6):
            if c&(1<<b):
                x=col*2+(b&1); y=r*3+(b>>1); g[y*32+x//4]|=3<<(6-2*(x%4))
check("title graphics (VZ rows 8-31) intact", v[8*32:32*32]==bytes(g))
check("table lines in the bottom margin set the wipe flag", mem(S['vz_margin_dirty'])[0]&1==1)
call(S['vz_blit_frame'],0xE000)
v2=mem(0x7000,0x800); check("next normal blit wipes the margins", not any(v2[56*32:]) and not any(v2[:8*32]))
# ---------------------------------------------------------------- pictures
PAL={0:(0,60,0),1:(230,230,60),2:(60,60,230),3:(255,255,255)}
def png(frames,fn,S5=5):
    img=Image.new("RGB",(128*S5,(64*S5+10)*len(frames)))
    for n,vv in enumerate(frames):
        for y in range(64):
            for x in range(128):
                c=PAL[(vv[y*32+x//4]>>(6-2*(x%4)))&3]
                for dx in range(S5):
                    for dy in range(S5): img.putpixel((x*S5+dx,n*(64*S5+10)+y*S5+dy),c)
    img.save(fn)
call(0x5AE1); tablescreen=mem(0x7000,0x800)
png([promptshot,tablescreen],'highscores_render.png')
print("ALL OK" if ok else "FAILED")
