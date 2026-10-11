#!/usr/bin/env python3
"""Rewrites the vz_blit_frame block of hal_vz.asm (table-driven, 32-pair unrolled).
Run:  python3 gen_blit.py     (idempotent; replaces the block between the markers)"""
import re

BEGIN = "; ==== BEGIN GENERATED BLIT (gen_blit.py) ===="
END = "; ==== END GENERATED BLIT ===="

def pair(k):
    even = k % 2 == 0
    rows = (0, 1, 2) if even else (2, 1, 0)
    step = "inc" if even else "dec"
    o = ["\tld\ta, (bc)\n\tinc\tbc\n\tld\tl, a\n\tld\ta, (bc)\n\tinc\tbc\n\tld\te, a\n"]
    for i, r in enumerate(rows):
        o.append(f"\tld\ta, (de)\n\tor\t(hl)\n\tld\t(ix+{32 * r + k}), a\n")
        if i < 2:
            o.append(f"\t{step}\th\n\t{step}\td\n")
    return "".join(o)

body = f"""{BEGIN}
; ---------------------------------------------------------------------------
; vz_blit_frame:  1024-byte TRS-80 64x16 screen buffer (HL) -> VZ200 MC6847
; mode 1 (128x64) at 0x7100-0x76FF.  Preserves AF BC DE HL IX.
;
; Each TRS-80 graphics char (bit 7 set) holds a 2x3 block; chars with bit 7
; clear draw blank (same as the first version).  One VRAM byte = 2 chars x
; 2 pixels x 2 bits, so each scanline byte is  HI[chA] | LO[chB]  where HI/LO
; are 256-byte page-aligned tables built at boot by vz_build_blit_tables:
;     page BLIT_PAGE+r    : HI form for scanline r (left char:  bits 7-4)
;     page BLIT_PAGE+3+r  : LO form for scanline r (right char: bits 3-0)
; H/D hold the table pages, L/E the chars.  The 32 pairs of a row are fully
; unrolled (dest = IX+n) and the scanline order zigzags 0-1-2 / 2-1-0 so
; the table pages never need resetting.  ~150 T-states per pair-of-3-scanlines
; versus ~620 average before.
; ---------------------------------------------------------------------------
vz_blit_frame:
	push\taf
	push\tbc
	push\tde
	push\thl
	push\tix
	ld\tb, h
	ld\tc, l\t\t\t; BC = source
	ld\tix, 07100h\t\t; first playfield scanline
	ld\th, BLIT_PAGE
	ld\td, BLIT_PAGE+3
	ld\ta, 16\t\t\t; 16 character rows
	push\taf\t\t\t; row counter lives on the stack
vz_bl_row:
{"".join(pair(k) for k in range(32))}\tpush\tde
	ld\tde, 96\t\t\t; next character row = 3 scanlines * 32 bytes
	add\tix, de
	pop\tde
	pop\taf
	dec\ta
	push\taf
	jp\tnz, vz_bl_row
	pop\taf
	pop\tix
	pop\thl
	pop\tde
	pop\tbc
	pop\taf
	ret

; ---------------------------------------------------------------------------
; vz_build_blit_tables: fills the six 256-byte pages at BLIT_PAGE (runs once,
; from vz_boot).  Char c -> s = c if bit 7 set else 0.  For scanline r the
; two bits (s >> 2r) & 3 give  HI = (b0 ? C0h : 0) | (b1 ? 30h : 0),  LO = HI >> 4.
; ---------------------------------------------------------------------------
vz_build_blit_tables:
	ld\tc, 0
vbt_char:
	ld\ta, c
	bit\t7, a
	jr\tnz, vbt_ok
	xor\ta
vbt_ok:
	ld\tb, a\t\t\t; B = effective char
	ld\th, BLIT_PAGE
	ld\tl, c
	ld\ta, b
	call\tvbt_pair\t\t; scanline 0
	inc\th
	ld\ta, b
	srl\ta
	srl\ta
	call\tvbt_pair\t\t; scanline 1
	inc\th
	ld\ta, b
	srl\ta
	srl\ta
	srl\ta
	srl\ta
	call\tvbt_pair\t\t; scanline 2
	inc\tc
	jr\tnz, vbt_char
	ret

; A = (char >> 2r); writes HI form to (HL) and LO form to (HL+0300h). Keeps HL.
vbt_pair:
	ld\te, 0
	rra
	jr\tnc, vbp1
	ld\te, 0c0h
vbp1:
	rra
	jr\tnc, vbp2
	set\t5, e
	set\t4, e
vbp2:
	ld\t(hl), e
	ld\ta, e
	rrca
	rrca
	rrca
	rrca
	push\thl
	push\tde
	ld\tde, 00300h
	add\thl, de
	pop\tde
	ld\t(hl), a
	pop\thl
	ret
{END}
"""

src = open("hal_vz.asm").read()
if BEGIN in src:
    pat = re.compile(re.escape(BEGIN) + r".*?" + re.escape(END) + r"\n", re.S)
    src = pat.sub(lambda m: body, src)
else:
    # first run: replace old block (header comment of vz_blit_frame .. end of vz_conv_pair_row2)
    start = src.index("; ---------------------------------------------------------------------------\n; vz_blit_frame:")
    end = src.index("; ---------------------------------------------------------------------------\n; vz_draw_glyph:")
    src = src[:start] + body + "\n" + src[end:]
if "BLIT_PAGE EQU" not in src:
    src = src.replace("vz_boot:\n", "BLIT_PAGE EQU 0eeh\t\t; 6 pages EE00-F3FF: blit lookup tables (runtime)\n\nvz_boot:\n", 1)
if "call\tvz_build_blit_tables" not in src:
    src = src.replace("\tcall\tvz_build_font_cache\n", "\tcall\tvz_build_font_cache\n\tcall\tvz_build_blit_tables\n", 1)
open("hal_vz.asm", "w").write(src)
print("ok")
