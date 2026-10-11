#!/usr/bin/env python3
"""
Porting script for 13 Ghosts (TRS-80 Model I/III) -> VZ200 / RC39 Clone.
Transforms ghost13b.asm into ghost13_vz.asm and assembles it with z88dk-z80asm.
"""

import os
import re
import shutil
import struct
import subprocess

SRC_ASM = "ghost13b.asm"
OUT_ASM = "ghost13_vz.asm"
OUT_BIN = "ghost13_vz.bin"
OUT_VZ  = "ghost13_vz.vz"
OUT_WAV = "ghost13_vz.wav"

VZPACK  = "/home/david/Documents/vz2wav-decompile/bin/ia64-linux/vzpack"
VZ2WAV  = "/home/david/Documents/vz2wav-decompile/bin/ia64-linux/vz2wav"

# --- v2 change -------------------------------------------------------------
# 0x7800 is *not* free RAM: the VZ200 ROM's cold-boot copies its RST-vector
# jump table + DCBs into RAM 0x7800-0x7835 and zero-fills through 0x785C
# (confirmed from export.lst, BASIC_INIT_1). Worse, CLOAD's own loader
# stashes the tape header's start address at 0x781E and re-reads it *after*
# the transfer to know where to jump -- and since the transfer's write
# pointer starts at the load address and walks upward, loading at 0x7800
# means the block's own bytes at offset 0x1E overwrite that cell before
# the ROM reads it back, sending execution into the ROM instead of our
# code. 0x7AE8 is the ROM's own documented "start of user RAM" (see the
# comment at export.lst address 0x00A8) and sits well clear of all of it.
LOAD_ORG = 0x7AE8

# The VZ200 ROM's PRN_GFX_FONT (0x3B94) has 17 bad bytes across 10 glyphs
# (confirmed against a real ROM dump -- see VZ200_basic_ROM_listing/
# README-Font issue.md). The ROM can't be fixed, so the corrected table
# is embedded in the game image and the tile cache is built from that copy.
FONT_SRC = os.path.join("VZ200_basic_ROM_listing", "corrected_table.asm")
# ----------------------------------------------------------------------- --

# ---------------------------------------------------------------------------
# DATA REGIONS.  z80dasm is a linear sweep: level/sprite tables embedded in
# the TRS-80 image were disassembled as "instructions", many with a 16-bit
# operand that happens to look like an in-image address (ld bc,laa06h ...).
# Treating those as real code makes this script (a) rewrite buffer addresses
# (0CA12h ...) inside the data and (b) relocate their label operands by the
# 0x28D3 load shift -- silently corrupting the compressed level stream, which
# the decompressor at 0xC665..0xC6F8 then expands with garbage run lengths
# (an LDIR with BC=0xFF00 that overwrites all of RAM).  Found by running the
# tape in the RC39/VZ200 emulator.  Everything in these ORIGINAL-address
# ranges is emitted as raw bytes (labels kept, so addresses still resolve):
#   0x5200-0x5359  header table before the entry point (0x535A)
#   0x60A9-0xC586  level/sprite data between the first code block (ends with
#                  "jp lc600h" at 0x60A6) and the code that resumes at 0xC587
DATA_RANGES = [(0x5200, 0x5359), (0x60A9, 0xC586)]

# Individual instructions whose 16-bit immediate is a CONSTANT that merely
# looks like an in-image address (z80dasm labelled it, so the port would
# relocate it).  Found by emulator debugging + an audit of every in-image
# 16-bit immediate; each is emitted as raw bytes.  Original addresses:
#   0xC6FB ld de,803Eh / 0xC715 ld de,803Eh  -> bytes "3E 80" = ld a,80h opcode
#   0xC6FE ld hl,8036h / 0xC71D ld hl,8036h  -> bytes "36 80" = ld (hl),80h opcode
#       (day/night switch patches the decompressor's `xor n` / `ld (hl),n`
#        instructions at 0xC6AC/0xC6CF/0xC6F2/0xC787 with these byte pairs;
#        relocating them rewrote the decompressor into `add hl,bc; xor c`)
#   0x5A29 ld bc,8000h / 0x5A38 ld bc,8000h  -> delay count for ROM call 0060h
CONST_LINES = {0xC6FB, 0xC6FE, 0xC715, 0xC71D, 0x5A29, 0x5A38}

def freeze_data_regions(lines):
    out = []
    n_frozen = 0
    pat = re.compile(r";([0-9a-f]{4})\t((?:[0-9a-f]{2} )+)")
    for line in lines:
        m = pat.search(line)
        if m and not line.lstrip().startswith(";"):
            addr = int(m.group(1), 16)
            if addr in CONST_LINES or any(lo <= addr <= hi for lo, hi in DATA_RANGES):
                bs = m.group(2).split()
                # keep the original ";addr<TAB>bytes" tail verbatim: later
                # passes key off it (base-label placement, the 0x5200 skip)
                out.append("\tdefb\t" + ",".join(f"0{b.upper()}h" for b in bs) +
                           "\t\t" + line[m.start():])
                n_frozen += 1
                continue
        out.append(line)
    print(f"freeze_data_regions: {n_frozen} instruction lines -> raw defb")
    return out

def load_corrected_font():
    """Parse corrected_table.asm -> 64 glyphs x 5 bytes; return DEFB source."""
    txt = open(FONT_SRC).read()
    rows = re.findall(r"DEFB\s+((?:0x[0-9A-Fa-f]{2},?){5})", txt)
    if len(rows) != 64:
        raise SystemExit(f"{FONT_SRC}: expected 64 glyph rows, found {len(rows)}")
    out = ["; Corrected PRN_GFX_FONT, 64 glyphs x 5 column bytes (active-low).",
           "; Generated from " + FONT_SRC.replace("\\", "/") + " -- do not hand-edit.",
           "vz_font_src:"]
    for i, r in enumerate(rows):
        out.append("\tdefb\t" + ",".join(f"0{b[2:].upper()}h" for b in r.split(",")) +
                   f"\t\t; glyph {i:02X}")
    out.append("vz_font_src_end:")
    return "\n".join(out) + "\n"

def main():
    with open(SRC_ASM, "r") as f:
        lines = f.readlines()
    lines = freeze_data_regions(lines)

    out_lines = []
    
    # 1. Header
    out_lines.append("; =============================================================================\n")
    out_lines.append("; 13 GHOSTS — Port for VZ200 / RC39 Backplane Clone (NTSC, MC6847 Mode 1)\n")
    out_lines.append("; Target: VZ200 Level II BASIC compatible machine code\n")
    out_lines.append(f"; Load address: {LOAD_ORG:#06x} (ROM-documented start of free user RAM,\n")
    out_lines.append(";                clear of the RST-vector/DCB workspace at 0x7800-0x785C)\n")
    out_lines.append("; =============================================================================\n\n")
    out_lines.append(f"\torg\t0{LOAD_ORG:04x}h\n\n")

    # Front porch: direct entry. Bank is no longer probed here -- stage 1
    # (a separate tiny bootstrap, loaded first) deterministically forces
    # bank 0 via OUT (0x70),0 *before* calling back into the ROM's tape
    # loader for this payload, so this payload's own C000+ tail always
    # lands in the one bank with zero aliasing against fixed RAM or the
    # 10K window. Verified end-to-end against real ROM code (TAPE_LOAD_
    # COMMON et al, not a reimplementation) across all 8 possible pre-
    # stage-1 boot states, including the two hazardous banks (1 and 2).
    # See STAGE1_NOTES.md.
    out_lines.append(f"\tjp\tvz_boot\t\t; {LOAD_ORG:04x}: bank already forced to 0 by stage 1\n\n")

    # Addresses where base labels need to be placed on the line
    base_targets = {
        0x5342: "l5342h", 0x5c1b: "l5c1bh", 0x5c2a: "l5c2ah", 0x6032: "l6032h",
        0x6188: "l6188h", 0x619e: "l619eh", 0x61dc: "l61dch", 0x61ff: "l61ffh",
        0x6210: "l6210h", 0x6214: "l6214h", 0x625c: "l625ch", 0x62c3: "l62c3h",
        0x6317: "l6317h", 0x6359: "l6359h", 0xbf35: "lbf35h", 0xbf3d: "lbf3dh",
        0xbfc8: "lbfc8h", 0xbfee: "lbfeeh", 0xc0d4: "lc0d4h", 0xc0f0: "lc0f0h",
        0xc0f6: "lc0f6h", 0xc125: "lc125h", 0xc1f0: "lc1f0h", 0xc24a: "lc24ah",
        0xc250: "lc250h", 0xc30e: "lc30eh", 0xc414: "lc414h", 0xc63a: "lc63ah",
        0xc641: "lc641h", 0xc64d: "lc64dh", 0xc6bf: "lc6bfh", 0xc6e5: "lc6e5h",
        0xc7f7: "lc7f7h", 0xc903: "lc903h", 0xc905: "lc905h", 0xc908: "lc908h"
    }

    # Equ definitions for targets
    equ_defs = [
        "l5343h EQU l5342h + 1",
        "l5c1ch EQU l5c1bh + 1",
        "l5c2bh EQU l5c2ah + 1",
        "l6034h EQU l6032h + 2",
        "l618ah EQU l6188h + 2",
        "l619fh EQU l619eh + 1",
        "l61ddh EQU l61dch + 1",
        "l6200h EQU l61ffh + 1",
        "l6212h EQU l6210h + 2",
        "l6215h EQU l6214h + 1",
        "l625eh EQU l625ch + 2",
        "l62c4h EQU l62c3h + 1",
        "l6319h EQU l6317h + 2",
        "l635ah EQU l6359h + 1",
        "lbf36h EQU lbf35h + 1",
        "lbf3eh EQU lbf3dh + 1",
        "lbfc9h EQU lbfc8h + 1",
        "lbfefh EQU lbfeeh + 1",
        "lc0d5h EQU lc0d4h + 1",
        "lc0f1h EQU lc0f0h + 1",
        "lc0f7h EQU lc0f6h + 1",
        "lc127h EQU lc125h + 2",
        "lc1f1h EQU lc1f0h + 1",
        "lc24bh EQU lc24ah + 1",
        "lc251h EQU lc250h + 1",
        "lc30fh EQU lc30eh + 1",
        "lc415h EQU lc414h + 1",
        "lc63bh EQU lc63ah + 1",
        "lc642h EQU lc641h + 1",
        "lc64eh EQU lc64dh + 1",
        "lc6c0h EQU lc6bfh + 1",
        "lc6e6h EQU lc6e5h + 1",
        "lc7f8h EQU lc7f7h + 1",
        "lc904h EQU lc903h + 1",
        "lc906h EQU lc905h + 1",
        "lc909h EQU lc908h + 1"
    ]

    out_lines.append("; Equ definitions for self-modifying code & internal data labels\n")
    for eq in equ_defs:
        out_lines.append(f"{eq}\n")
    out_lines.append("\n")

    # Addresses to rename in operands
    addr_operand_replacements = {
        "05343h": "l5343h",
        "05c1ch": "l5c1ch",
        "05c2bh": "l5c2bh",
        "06034h": "l6034h",
        "0618ah": "l618ah",
        "0619fh": "l619fh",
        "061ddh": "l61ddh",
        "06200h": "l6200h",
        "06212h": "l6212h",
        "06215h": "l6215h",
        "0625eh": "l625eh",
        "062c4h": "l62c4h",
        "06319h": "l6319h",
        "0635ah": "l635ah",
        "0bf36h": "lbf36h",
        "0bf3eh": "lbf3eh",
        "0bfc9h": "lbfc9h",
        "0bfefh": "lbfefh",
        "0c0d5h": "lc0d5h",
        "0c0f1h": "lc0f1h",
        "0c0f7h": "lc0f7h",
        "0c127h": "lc127h",
        "0c1f1h": "lc1f1h",
        "0c24bh": "lc24bh",
        "0c251h": "lc251h",
        "0c30fh": "lc30fh",
        "0c415h": "lc415h",
        "0c63bh": "lc63bh",
        "0c642h": "lc642h",
        "0c64eh": "lc64eh",
        "0c6c0h": "lc6c0h",
        "0c6e6h": "lc6e6h",
        "0c7f8h": "lc7f8h",
        "0c904h": "lc904h",
        "0c906h": "lc906h",
        "0c909h": "lc909h",

        # Buffer remapping into 10K RAM window (0x4000-0x57FF incl. 0x400 slack after buffer 4; table 0x5800)
        "0ca12h": "04000h", # Buffer 0
        "0ce12h": "04400h", # Buffer 1
        "0d212h": "04800h", # Buffer 2
        "0d612h": "04c00h", # Buffer 3
        "0da12h": "05000h", # Buffer 4
        "0e212h": "05800h", # Pointer table -- NOT at 0x5400: the scroll code at 0x6051-0x6076 LDIRs 0x400 bytes to buffer4+k*0x40 (k<=15), overrunning buffer 4 by up to 0x3C0 bytes. The original layout keeps a 0x400 slack gap (0xDE12-0xE211) before the table; so do we (0x5400-0x57FF).
        "0ddd2h": "053c0h", # Buffer 4 + 0x3C0 = row 15, the one-row HUD. (was 053d2h -- 18 bytes off, HUD copy overran into the pointer table)
        "0cc92h": "04280h", # Buffer 0 + 0x280
        "0ccd5h": "042c3h", # Buffer 0 + 0x2C3
        "0ccf6h": "042e4h", # Buffer 0 + 0x2E4
        "0cd12h": "04300h", # Buffer 0 + 0x300
        "0cd14h": "04302h", # Buffer 0 + 0x302
        "0d112h": "04700h", # Buffer 1 + 0x300
        "0cd44h": "04332h", # Buffer 0 + 0x332 -- HUD template chain (was missing)
        "0cd55h": "04343h", # Buffer 0 + 0x343 -- HUD template chain (was missing)
        "0cd84h": "04372h", # Buffer 0 + 0x372 -- HUD "Level:/Ghost:" text lands here (was missing)
        "0d213h": "04801h", # Buffer 2 + 0x1   -- buffer-2 fill routine (was missing)
    }

    skip_first_org = True
    in_trsdos_open = False
    in_trsdos_save = False

    for idx, line in enumerate(lines, 1):
        # Skip original org
        if "org\t05200h" in line and skip_first_org:
            skip_first_org = False
            continue

        # Skip first 3 bytes at 0x5200 (replaced by jp vz_boot)
        if ";5200\t01 20 00" in line:
            continue

        # Check if this line needs l535ah label
        if ";535a\t3a 1b 02" in line:
            out_lines.append("l535ah:\n")

        # Check if this line is an address where we should attach a base label
        cm = re.search(r";([0-9a-fA-F]{4})\t", line)
        if cm:
            addr = int(cm.group(1), 16)
            if addr in base_targets:
                lbl = base_targets[addr]
                out_lines.append(f"{lbl}:\n")

        # TRSDOS SVC bypass at 0x536D
        if ";536d\tcd 24 44" in line:
            out_lines.append("\tjp\tl537dh\t\t; Bypass TRSDOS high score disk read\n")
            in_trsdos_open = True
            continue
        if in_trsdos_open:
            if "l537dh:" in line:
                in_trsdos_open = False
                out_lines.append(line)
            continue

        # TRSDOS SVC bypass at 0x5ACA
        if ";5aca\tcd 20 44" in line:
            out_lines.append("\tcall\tsub_603ah\t; Bypass TRSDOS high score disk write\n")
            in_trsdos_save = True
            continue
        if in_trsdos_save:
            if ";5ad9\t06 03" in line:
                in_trsdos_save = False
                out_lines.append(line)
            continue

        # Screen blit replacement:
        # 1. 0x5577: ld de, 03c00h; ld bc, 00400h; push bc; ldir
        if ";5577\t11 00 3c" in line:
            out_lines.append("\tcall\tvz_blit_frame\t; Blit buffer4 (HL) to VZ200 screen\n")
            out_lines.append("\tcall\tvz_draw_hud_row\t; Render the one-row HUD (buffer4 row 15) into the VZ margin\n")
            # The original also did `push bc` (BC=0400h) between the copy set-up and
            # the LDIR; the matching `pop bc; pop de` at 0x5583 relies on it.  Dropping
            # the push made `pop bc` take the buffer address as an LDIR count (0x5000)
            # and ran a block copy over all of RAM -> game restarted at the title.
            out_lines.append("\tld\tbc, 00400h\t\t; keep the original push bc (balances pop bc/pop de at 0x5583)\n")
            out_lines.append("\tpush\tbc\n")
            continue
        if ";557a\t01 00 04" in line and idx < 500: continue
        if ";557d\tc5" in line: continue
        if ";557e\ted b0" in line and idx < 500: continue

        # 2. 0x5A7E: ld de, 03c00h; ld bc, 00400h; ldir
        if ";5a7e\t11 00 3c" in line:
            out_lines.append("\tcall\tvz_blit_frame\t; Blit buffer0 (HL) to VZ200 screen\n")
            out_lines.append("\tnop\n\tnop\n\tnop\n\tnop\n\tnop\n")
            continue
        if ";5a81\t01 00 04" in line: continue
        if ";5a84\ted b0" in line and idx < 1160: continue

        # 3. 0x5AFD: ld de, 03c00h; ld bc, 00400h; ldir
        if ";5afd\t11 00 3c" in line:
            out_lines.append("\tcall\tvz_blit_frame\t; Blit buffer0 (HL) to VZ200 screen\n")
            out_lines.append("\tnop\n\tnop\n\tnop\n\tnop\n\tnop\n")
            continue
        if ";5b00\t01 00 04" in line: continue
        if ";5b03\ted b0" in line and idx < 1210: continue

        # 4. 0x602A: ld de, 03c00h; ld bc, 00400h; ldir
        if ";602a\t11 00 3c" in line:
            out_lines.append("\tcall\tvz_blit_frame\t; Blit buffer0 (HL) to VZ200 screen\n")
            out_lines.append("\tnop\n\tnop\n\tnop\n\tnop\n\tnop\n")
            continue
        if ";602d\t01 00 04" in line: continue
        if ";6030\ted b0" in line and idx < 1910: continue

        # 5. 0x607B: ld de, 03c00h; ld bc, 00400h; ldir
        if ";607b\t11 00 3c" in line:
            out_lines.append("\tcall\tvz_blit_frame\t; Blit buffer4 (HL) to VZ200 screen\n")
            out_lines.append("\tnop\n\tnop\n\tnop\n\tnop\n\tnop\n")
            continue
        if ";607e\t01 00 04" in line: continue
        if ";6081\ted b0" in line and idx < 1945: continue

        # Keyboard replacements:
        if "ld a,(03840h)" in line:
            out_lines.append("\tcall\tvz_read_kbd_3840\t; Read VZ200 keyboard (arrows/space/enter)\n")
            continue
        if "ld a,(03804h)" in line and idx < 500:
            out_lines.append("\tcall\tvz_read_kbd_3804\t; Read VZ200 'S' key (sound toggle)\n")
            continue

        # Sound output:
        if ";5c1b\td3 80" in line:
            out_lines.append("\tcall\tvz_sound_toggle\t; VZ200 sound output\n")
            continue
        if ";5c2a\td3 80" in line:
            out_lines.append("\tcall\tvz_sound_off\t; VZ200 sound off\n")
            continue
        if ";c7f7\td3 80" in line:
            out_lines.append("\tcall\tvz_sound_toggle\t; VZ200 sound toggle\n")
            continue
        if ";c807\td3 80" in line:
            out_lines.append("\tcall\tvz_sound_toggle\t; VZ200 sound toggle\n")
            continue

        # Controller check bypass at sub_c9fdh:
        if "sub_c9fdh:" in line:
            out_lines.append("sub_c9fdh:\n")
            out_lines.append("\tcall\tvz_check_fire\t; Check fire button\n")
            out_lines.append("\tret\n")
            continue
        if idx >= 26503 and ";ca00\t4f" in line: continue
        if idx >= 26503 and ";ca01\t3e ff" in line: continue
        if idx >= 26503 and ";ca03\t2f" in line: continue
        if idx >= 26503 and ";ca04\tb1" in line: continue
        if idx >= 26503 and ";ca05\tc9" in line: continue

        # Apply operand replacements (symbols and buffers)
        code_part = line
        for old_op, new_op in addr_operand_replacements.items():
            if old_op in code_part:
                code_part = re.sub(r"\b" + old_op + r"\b", new_op, code_part)
        out_lines.append(code_part)

    # Append our VZ200 Hardware Abstraction Layer at the end of the file
    out_lines.append("\n; =============================================================================\n")
    out_lines.append("; VZ200 HARDWARE ABSTRACTION LAYER (HAL)\n")
    out_lines.append("; =============================================================================\n\n")

    hal_code = """
; ---------------------------------------------------------------------------
; vz_boot: runs once loaded. Bank is already forced to 0 by stage 1 before
; this payload's tail (which lands in the banked C000+ region) was ever
; streamed in -- see the front-porch comment above and STAGE1_NOTES.md.
; Initial entry point when loaded via VZ200 tape
; ---------------------------------------------------------------------------
vz_boot:
\tdi
\t; 1. Enable 10K RAM window (0x4000-0x67FF) by writing bit 3=1 to port 0x70
\tld\ta, 008h
\tout\t(070h), a

\t; 2. Initialize VZ200 MC6847 Video Display Controller
\t; Latch at 0x6800: bit 3 = 1 (Hi-res Graphics Mode 1), bit 4 = 0 (Green bg)
\tld\ta, 008h
\tld\t(06800h), a

\t; 3. Clear VZ200 VRAM (0x7000-0x77FF, 2048 bytes) with background (0x00)
\tld\thl, 07000h
\tld\tde, 07001h
\tld\tbc, 007ffh
\tld\t(hl), 000h
\tldir

\t; 4. Clear the 5 game buffers + the 0x400 slack after buffer 4 (0x4000-0x57FF)
\t;    with 0x80 (TRS-80 blank semigraphics), then zero the 512-byte
\t;    decompressor pointer table at 0x5800-0x59FF (unused entries must be 0:
\t;    a zero pointer is how the decompressor reports "no such screen").
\tld\thl, 04000h
\tld\tde, 04001h
\tld\tbc, 017ffh
\tld\t(hl), 080h
\tldir
\tld\thl, 05800h
\tld\tde, 05801h
\tld\tbc, 001ffh
\tld\t(hl), 000h
\tldir

\t; 5. Set stack to top of RAM
\tld\tsp, 0ffffh

\t; 6. Build the text-mode font tile cache (see texmode-issues.md) before
\t; the game needs it for the HUD/title text -- boot-time only.
\tcall\tvz_build_font_cache

\t; 7. Jump to relocated game entry point
\tjp\tl535ah

; ---------------------------------------------------------------------------
; vz_sound_toggle: Toggle piezo speaker A and B on 0x6800
; Preserves Mode 1 graphics bit (bit 3 = 1)
; ---------------------------------------------------------------------------
vz_sound_toggle:
\tpush\taf
\tld\ta, (vz_sound_phase)
\txor\t001h
\tld\t(vz_sound_phase), a
\tjr\tz, vz_snd_p1
\tld\ta, 028h\t\t; Speaker B on (bit 5=1), Mode 1 on (bit 3=1)
\tjr\tvz_snd_wr
vz_snd_p1:
\tld\ta, 009h\t\t; Speaker A on (bit 0=1), Mode 1 on (bit 3=1)
vz_snd_wr:
\tld\t(06800h), a
\tpop\taf
\tret

vz_sound_off:
\tpush\taf
\tld\ta, 008h\t\t; Speakers off, Mode 1 on (bit 3=1)
\tld\t(06800h), a
\tpop\taf
\tret

vz_sound_phase:
\tdefb\t000h

; ---------------------------------------------------------------------------
; vz_check_fire: Replaces sub_c9fdh.
; Checks if fire button (Space) is pressed.
; Returns Z flag set if fire pressed, NZ if not pressed.
; ---------------------------------------------------------------------------
vz_check_fire:
\tld\ta, (068efh)\t; Row A4: bit 4 = Space (0 when pressed)
\tbit\t4, a
\tret

; ---------------------------------------------------------------------------
; vz_read_kbd_3804: Replaces reading 0x3804 (checks 'S' for sound toggle)
; Row A1 (0x68FD): Bit 1 = 'S' (0 when pressed)
; Returns A = 0x08 if 'S' pressed, else 0
; ---------------------------------------------------------------------------
vz_read_kbd_3804:
\tld\ta, (068fdh)\t; Row A1
\tbit\t1, a\t\t; Check 'S'
\tjr\tnz, vz_no_s
\tld\ta, 008h\t\t; 'S' is pressed
\tret
vz_no_s:
\txor\ta
\tret

; ---------------------------------------------------------------------------
; vz_read_kbd_3840: Replaces reading 0x3840 (TRS-80 control row)
; TRS-80 bits:
;   bit 7 = Space (Fire)
;   bit 6 = Right Arrow (or 'X'/'D')
;   bit 5 = Left Arrow  (or 'Z'/'A')
;   bit 4 = Down Arrow  (or 'S')
;   bit 3 = Up Arrow    (or 'W')
;   bit 2 = Break (or 'Q')
;   bit 1 = Clear
;   bit 0 = Enter
; ---------------------------------------------------------------------------
vz_read_kbd_3840:
\tpush\tbc
\tld\tb, 000h\t\t; Accumulated result in B

\t; 1. Check Space (Fire -> bit 7)
\tld\ta, (068efh)\t; Row A4
\tbit\t4, a\t\t; Bit 4 = Space
\tjr\tnz, vz_k_right
\tset\t7, b

vz_k_right:
\t; 2. Check Right Arrow (bit 6):
\t; Row A4: bit 3 = ',' (CTRL+, is right arrow)
\t; Row A2: bit 1 = 'X'
\t; Row A1: bit 3 = 'D'
\tbit\t3, a\t\t; Row A4 bit 3 (comma)
\tjr\tz, vz_set_right
\tld\ta, (068fbh)\t; Row A2
\tbit\t1, a\t\t; 'X'
\tjr\tz, vz_set_right
\tld\ta, (068fdh)\t; Row A1
\tbit\t3, a\t\t; 'D'
\tjr\tnz, vz_k_left
vz_set_right:
\tset\t6, b

vz_k_left:
\t; 3. Check Left Arrow (bit 5):
\t; Row A4: bit 5 = 'M' (CTRL+M is left arrow)
\t; Row A2: bit 4 = 'Z'
\t; Row A1: bit 4 = 'A'
\tld\ta, (068efh)\t; Row A4
\tbit\t5, a\t\t; 'M'
\tjr\tz, vz_set_left
\tld\ta, (068fbh)\t; Row A2
\tbit\t4, a\t\t; 'Z'
\tjr\tz, vz_set_left
\tld\ta, (068fdh)\t; Row A1
\tbit\t4, a\t\t; 'A'
\tjr\tnz, vz_k_down
vz_set_left:
\tset\t5, b

vz_k_down:
\t; 4. Check Down Arrow (bit 4):
\t; Row A1: bit 1 = 'S'
\tld\ta, (068fdh)\t; Row A1
\tbit\t1, a\t\t; 'S'
\tjr\tnz, vz_k_up
\tset\t4, b

vz_k_up:
\t; 5. Check Up Arrow (bit 3):
\t; Row A4: bit 1 = '.' (CTRL+. is up arrow)
\t; Row A0: bit 1 = 'W'
\tld\ta, (068efh)\t; Row A4
\tbit\t1, a\t\t; '.'
\tjr\tz, vz_set_up
\tld\ta, (068feh)\t; Row A0
\tbit\t1, a\t\t; 'W'
\tjr\tnz, vz_k_break
vz_set_up:
\tset\t3, b

vz_k_break:
\t; 6. Check Break / Quit (bit 2):
\t; Row A0: bit 4 = 'Q'
\tld\ta, (068feh)\t; Row A0
\tbit\t4, a\t\t; 'Q'
\tjr\tnz, vz_k_enter
\tset\t2, b

vz_k_enter:
\t; 7. Check Enter / Return (bit 0):
\t; Row A6 (0x68BF): bit 2 = RETN
\tld\ta, (068bfh)\t; Row A6
\tbit\t2, a\t\t; RETN
\tjr\tnz, vz_k_done
\tset\t0, b

vz_k_done:
\tld\ta, b
\tpop\tbc
\tor\ta\t\t; Set flags according to A
\tret

; ---------------------------------------------------------------------------
; vz_blit_frame:
; Fast converter from 1024-byte TRS-80 64x16 screen buffer (at HL)
; to VZ200 MC6847 Mode 1 128x64 display at 0x7000-0x77FF.
;
; Screen layout:
;   - Scanlines 0-7   (0x7000-0x70FF): Top margin
;   - Scanlines 8-55  (0x7100-0x76FF): 16 character rows * 3 scanlines/row
;     = 48 scanlines of 128-pixel playfield!
;   - Scanlines 56-63 (0x7700-0x77FF): Bottom margin
; ---------------------------------------------------------------------------
vz_blit_frame:
\tpush\taf
\tpush\tbc
\tpush\tde
\tpush\thl

\t; DE points to VRAM start of active playfield (Scanline 8 = 0x7100)
\tld\tde, 07100h
\tld\tb, 010h\t\t; 16 character rows

vz_row_loop:
\tpush\tbc\t\t; Save row counter
\tpush\thl\t\t; Save start of this character row in buffer

\t; Each character row has 3 scanlines on VZ200:
\t; Scanline 0: uses bits 0, 1 of each character
\t; Scanline 1: uses bits 2, 3 of each character
\t; Scanline 2: uses bits 4, 5 of each character

\t; --- Scanline 0 ---
\tld\tc, 020h\t\t; 32 pairs of characters (64 chars total)
vz_sc0_loop:
\tld\ta, (hl)\t\t; Char 0
\tinc\thl
\tld\tb, (hl)\t\t; Char 1
\tinc\thl
\tcall\tvz_conv_pair_row0
\tld\t(de), a
\tinc\tde
\tdec\tc
\tjr\tnz, vz_sc0_loop

\t; --- Scanline 1 ---
\tpop\thl\t\t; Restore start of character row
\tpush\thl
\tld\tc, 020h
vz_sc1_loop:
\tld\ta, (hl)
\tinc\thl
\tld\tb, (hl)
\tinc\thl
\tcall\tvz_conv_pair_row1
\tld\t(de), a
\tinc\tde
\tdec\tc
\tjr\tnz, vz_sc1_loop

\t; --- Scanline 2 ---
\tpop\thl\t\t; Restore start of character row
\tld\tc, 020h
vz_sc2_loop:
\tld\ta, (hl)
\tinc\thl
\tld\tb, (hl)
\tinc\thl
\tcall\tvz_conv_pair_row2
\tld\t(de), a
\tinc\tde
\tdec\tc
\tjr\tnz, vz_sc2_loop

\tpop\tbc\t\t; Restore row counter
\tdjnz\tvz_row_loop

\tpop\thl
\tpop\tde
\tpop\tbc
\tpop\taf
\tret

; Convert Char A (in register A) and Char B (in register B) to Mode 1 byte
; Row 0: Char A bits 0,1 -> pixels 0,1; Char B bits 0,1 -> pixels 2,3
; 2-bit color 3 (11b = Red or Yellow foreground)
vz_conv_pair_row0:
\tpush\tbc
\tld\tc, 000h\t\t; Result
\tor\ta
\tjp\tp, vz_c0_p2
\trra\t\t\t; Bit 0 into Carry
\tjr\tnc, vz_c0_b1
\tset\t7, c
\tset\t6, c
vz_c0_b1:
\trra\t\t\t; Bit 1 into Carry
\tjr\tnc, vz_c0_p2
\tset\t5, c
\tset\t4, c
vz_c0_p2:
\tld\ta, b\t\t; Now test Char B
\tor\ta
\tjp\tp, vz_c0_done
\trra\t\t\t; Bit 0 into Carry
\tjr\tnc, vz_c0_b3
\tset\t3, c
\tset\t2, c
vz_c0_b3:
\trra\t\t\t; Bit 1 into Carry
\tjr\tnc, vz_c0_done
\tset\t1, c
\tset\t0, c
vz_c0_done:
\tld\ta, c
\tpop\tbc
\tret

; Row 1: Char A bits 2,3 -> pixels 0,1; Char B bits 2,3 -> pixels 2,3
vz_conv_pair_row1:
\tpush\tbc
\tld\tc, 000h
\tor\ta
\tjp\tp, vz_c1_p2
\trrca\t\t\t; Shift bits 2,3 into bits 0,1
\trrca
\trra
\tjr\tnc, vz_c1_b1
\tset\t7, c
\tset\t6, c
vz_c1_b1:
\trra
\tjr\tnc, vz_c1_p2
\tset\t5, c
\tset\t4, c
vz_c1_p2:
\tld\ta, b
\tor\ta
\tjp\tp, vz_c1_done
\trrca
\trrca
\trra
\tjr\tnc, vz_c1_b3
\tset\t3, c
\tset\t2, c
vz_c1_b3:
\trra
\tjr\tnc, vz_c1_done
\tset\t1, c
\tset\t0, c
vz_c1_done:
\tld\ta, c
\tpop\tbc
\tret

; Row 2: Char A bits 4,5 -> pixels 0,1; Char B bits 4,5 -> pixels 2,3
vz_conv_pair_row2:
\tpush\tbc
\tld\tc, 000h
\tor\ta
\tjp\tp, vz_c2_p2
\trrca
\trrca
\trrca
\trrca
\trra
\tjr\tnc, vz_c2_b1
\tset\t7, c
\tset\t6, c
vz_c2_b1:
\trra
\tjr\tnc, vz_c2_p2
\tset\t5, c
\tset\t4, c
vz_c2_p2:
\tld\ta, b
\tor\ta
\tjp\tp, vz_c2_done
\trrca
\trrca
\trrca
\trrca
\trra
\tjr\tnc, vz_c2_b3
\tset\t3, c
\tset\t2, c
vz_c2_b3:
\trra
\tjr\tnc, vz_c2_done
\tset\t1, c
\tset\t0, c
vz_c2_done:
\tld\ta, c
\tpop\tbc
\tret

; ---------------------------------------------------------------------------
; vz_draw_glyph: draws one cached 8x8 font tile to VRAM.
; In: A = char code (0-63, i.e. ascii AND 0x3Fh), DE = dest VRAM address
;     (top-left byte of the 8x8 cell; must be byte-aligned, i.e. an even
;     x-pixel boundary).
; Destroys AF, BC, HL. DE is preserved (walked forward internally to
; write all 8 rows, then restored) -- safe for a caller to reuse DE
; immediately after the call without reloading it.
;
; Verified in a Z80 emulator against the real ROM font, rendering to a
; decoded PNG for visual inspection ("HUD OK" test) -- caught a real bug
; this way (missing the second INC DE per row, which silently shifted
; every row after the first one byte early) before this was wired in.
; A second bug (DE not preserved, silently corrupting any caller that
; assumed it was) was caught the same way testing vz_draw_hud_row and
; fixed here rather than patched around at each call site.
; ---------------------------------------------------------------------------
vz_draw_glyph:
\tpush\taf
\tpush\tbc
\tpush\tde
\tld\th, 0
\tld\tl, a
\tadd\thl, hl
\tadd\thl, hl
\tadd\thl, hl
\tadd\thl, hl\t\t; hl = char_code * 16
\tld\tbc, 05a00h\t\t; FONT_TILE_CACHE
\tadd\thl, bc
\tld\tb, 8
vdg_row_loop:
\tld\ta, (hl)
\tld\t(de), a
\tinc\thl
\tinc\tde
\tld\ta, (hl)
\tld\t(de), a
\tinc\thl
\tinc\tde
\tpush\taf
\tld\ta, e
\tadd\ta, 30
\tld\te, a
\tld\ta, d
\tadc\ta, 0
\tld\td, a
\tpop\taf
\tdjnz\tvdg_row_loop
\tpop\tde\t\t; discard the walked value, restore caller's original DE
\tpop\tbc
\tpop\taf
\tret

; ---------------------------------------------------------------------------
; vz_draw_hud_row: renders a compact summary of the one-row HUD (buffer 4
; row 15, VZ 0x53C0-0x53FF -- see HUD_FIELDS.md) into the bottom VZ margin
; (0x7700-0x771F). Called once per frame from render site 1, right after
; vz_blit_frame blits buffer 4 -- this is the only site confirmed to be
; the live gameplay HUD (sites 2-4 blit buffer 0 for title/announcement
; screens; site 5 is an unrelated transition effect).
;
; 8px/cell (Option A), 16 cells available, 14 used:
;   cell:   0    1-5        6   7    8-9      10   11   12-13
;   text: 'S'  score(5)   sp  'L'  level(2)  sp  'G'  ghost(2)
; Score is the last 5 of the source field's 9 chars (right-justified,
; space-padded, ones digit fixed at the end -- taking the last 5 keeps
; that alignment and just caps displayable width at 99999).
;
; Destroys AF, BC, DE, HL.
; ---------------------------------------------------------------------------
vz_draw_hud_row:
\tld\tde, 07700h
\tld\ta, 013h\t\t; 'S'
\tcall\tvz_draw_glyph
\tld\thl, 053cch\t\t; score field, last 5 chars (row cols 12-16)
\tld\tde, 07702h
\tld\tb, 5
vhr_score_loop:
\tld\ta, (hl)
\tand\t03fh
\tpush\thl
\tpush\tbc
\tcall\tvz_draw_glyph\t; DE is preserved by vz_draw_glyph itself
\tpop\tbc
\tpop\thl
\tinc\thl
\tld\ta, e
\tadd\ta, 2
\tld\te, a
\tld\ta, d
\tadc\ta, 0
\tld\td, a
\tdjnz\tvhr_score_loop
\t; de is now 0770ch (cell 6) -- leave it blank as a separator
\tld\tde, 0770eh\t\t; cell 7
\tld\ta, 00ch\t\t; 'L'
\tcall\tvz_draw_glyph
\tld\tde, 07710h\t\t; cell 8
\tld\ta, (053f2h)\t\t; level tens digit
\tand\t03fh
\tcall\tvz_draw_glyph
\tld\tde, 07712h\t\t; cell 9
\tld\ta, (053f3h)\t\t; level ones digit
\tand\t03fh
\tcall\tvz_draw_glyph
\t; cell 10 left blank as a separator
\tld\tde, 07716h\t\t; cell 11
\tld\ta, 007h\t\t; 'G'
\tcall\tvz_draw_glyph
\tld\tde, 07718h\t\t; cell 12
\tld\ta, (053fdh)\t\t; ghost tens digit
\tand\t03fh
\tcall\tvz_draw_glyph
\tld\tde, 0771ah\t\t; cell 13
\tld\ta, (053feh)\t\t; ghost ones digit
\tand\t03fh
\tcall\tvz_draw_glyph
\tret

; ---------------------------------------------------------------------------
; Text-mode font cache (see texmode-issues.md).
;
; Converts the corrected PRN_GFX_FONT table (embedded at vz_font_src; the
; ROM copy at 0x3B94 has typos and is no longer read) (64 glyphs, 5
; bytes each, column-major, INVERTED polarity -- confirmed against the
; ROM's own "inverse character output" comment and the space glyph
; being 0xFF x5) into 64 cached 8x8 Mode-1 tiles (16 bytes each, 2
; bits/pixel) at FONT_TILE_CACHE. Source glyph is 5 columns wide,
; placed left-aligned in the 8-wide cell with 3 blank padding columns.
; "On" pixel = 2-bit value 3, matching vz_blit_frame's convention.
;
; Row-bit-order is bit0=top row, bit7=bottom row -- confirmed by
; rendering multiple asymmetric letters (U, L, P, F, A, B) both ways
; and comparing: bit7-top produced backwards/mirrored letterforms
; (U rendered as an arch, L as a mirrored Γ, etc.), bit0-top rendered
; all of them correctly. Symmetric letters like H or O look fine
; either way, which is why the original single-glyph 'H' test didn't
; catch this.
;
; Verified independently: ran this exact routine against the real
; ROM font bytes in a Z80 emulator and diffed the output byte-for-byte
; against a from-scratch Python reference implementation of the same
; spec -- exact match across all 64 glyphs (1024 bytes) before this
; was wired into the build.
; ---------------------------------------------------------------------------
vz_build_font_cache:
\tld\thl, vz_font_src\t; corrected copy embedded below (NOT the ROM's)
\tld\tde, 05a00h\t\t; FONT_TILE_CACHE
\tld\tb, 64
fc_glyph_loop:
\tpush\tbc
\tpush\thl
\tpush\tde
\tcall\tvz_convert_glyph
\tpop\tde
\tpop\thl
\tpop\tbc
\tld\ta,l
\tadd\ta,5
\tld\tl,a
\tld\ta,h
\tadc\ta,0
\tld\th,a
\tld\ta,e
\tadd\ta,16
\tld\te,a
\tld\ta,d
\tadc\ta,0
\tld\td,a
\tdjnz\tfc_glyph_loop
\tret

; vz_convert_glyph: HL=src glyph(5 bytes), DE=dst tile(16 bytes).
; Both preserved (caller advances). Destroys AF,BC.
vz_convert_glyph:
\tld\t(fc_src), hl
\tld\t(fc_dst_row), de
\txor\ta
\tld\t(fc_row), a
fc_row_loop:
\tld\thl, fc_row
\tld\tb,(hl)
\tld\ta,001h
fc_mask_loop:
\tld\tc,a
\tld\ta,b
\tor\ta
\tjr\tz, fc_mask_done
\tdec\tb
\tld\ta,c
\tsla\ta
\tjr\tfc_mask_loop
fc_mask_done:
\tld\ta,c
\tld\t(fc_rowmask), a

\txor\ta
\tld\t(fc_acc), a
\tld\thl,(fc_src)
\tld\ta,(fc_rowmask)
\tcall\tfc_pixel
\tcall\tfc_accum
\tinc\thl
\tld\ta,(fc_rowmask)
\tcall\tfc_pixel
\tcall\tfc_accum
\tinc\thl
\tld\ta,(fc_rowmask)
\tcall\tfc_pixel
\tcall\tfc_accum
\tinc\thl
\tld\ta,(fc_rowmask)
\tcall\tfc_pixel
\tcall\tfc_accum
\tld\ta,(fc_acc)
\tld\tde,(fc_dst_row)
\tld\t(de),a
\tinc\tde
\tld\t(fc_dst_row),de

\txor\ta
\tld\t(fc_acc), a
\tinc\thl
\tld\ta,(fc_rowmask)
\tcall\tfc_pixel
\tcall\tfc_accum
\txor\ta
\tcall\tfc_accum
\txor\ta
\tcall\tfc_accum
\txor\ta
\tcall\tfc_accum
\tld\ta,(fc_acc)
\tld\tde,(fc_dst_row)
\tld\t(de),a
\tinc\tde
\tld\t(fc_dst_row),de

\tld\ta,(fc_row)
\tinc\ta
\tld\t(fc_row),a
\tcp\t8
\tjp\tnz, fc_row_loop
\tret

; fc_pixel: In HL->src byte, A=rowmask. Out A=0 or 3. Destroys B.
fc_pixel:
\tld\tb,(hl)
\tand\tb
\tjr\tz, fc_pixel_on
\txor\ta
\tret
fc_pixel_on:
\tld\ta,3
\tret

; fc_accum: A_in=pixel(0/3). fc_acc = fc_acc*4 + A_in.
fc_accum:
\tpush\taf
\tld\ta,(fc_acc)
\tsla\ta
\tsla\ta
\tld\tb,a
\tpop\taf
\tor\tb
\tld\t(fc_acc), a
\tret

fc_src:      defw 0
fc_row:      defb 0
fc_rowmask:  defb 0
fc_acc:      defb 0
fc_dst_row:  defw 0

; End of HAL
"""
    out_lines.append(hal_code)
    out_lines.append(load_corrected_font())

    print(f"Writing {OUT_ASM} ({len(out_lines)} lines)...")
    with open(OUT_ASM, "w") as f:
        f.writelines(out_lines)

    # Assemble. Prefer z88dk-z80asm (the real toolchain); fall back to pasmo
    # if it isn't on this machine (verified byte-for-byte identical output
    # against z88dk-z80asm for this source on the reviewer's box).
    if shutil.which("z88dk-z80asm"):
        print(f"Assembling {OUT_ASM} with z88dk-z80asm...")
        cmd = ["z88dk-z80asm", "-b", OUT_ASM]
        res = subprocess.run(cmd, capture_output=True, text=True)
        if res.returncode != 0:
            print("Assembly failed!")
            print("STDOUT:", res.stdout)
            print("STDERR:", res.stderr)
            return False
    elif shutil.which("pasmo"):
        print(f"z88dk-z80asm not found; assembling {OUT_ASM} with pasmo instead...")
        cmd = ["pasmo", OUT_ASM, OUT_BIN, OUT_ASM.replace(".asm", ".sym")]
        res = subprocess.run(cmd, capture_output=True, text=True)
        if res.returncode != 0:
            print("Assembly failed!")
            print("STDOUT:", res.stdout)
            print("STDERR:", res.stderr)
            return False
    else:
        print("No Z80 assembler found (need z88dk-z80asm or pasmo). Stopping "
              "after source generation.")
        return False

    bin_size = os.path.getsize(OUT_BIN)
    print(f"Assembly SUCCESS! Produced {OUT_BIN} ({bin_size} bytes, span: "
          f"{LOAD_ORG:#06x} to {hex(LOAD_ORG + bin_size)})")

    # Pack into .vz format using vzpack
    if os.path.exists(VZPACK):
        print(f"Packing {OUT_BIN} into {OUT_VZ} using vzpack...")
        cmd_pack = [VZPACK, "--in-bin", OUT_BIN, "-s", hex(LOAD_ORG), "-o", OUT_VZ, "-t", "mc", "-n", "13GHOSTS"]
        res_pack = subprocess.run(cmd_pack, capture_output=True, text=True)
        if res_pack.returncode == 0:
            vz_size = os.path.getsize(OUT_VZ)
            print(f"Packed {OUT_VZ} ({vz_size} bytes)")
        else:
            print("vzpack failed:", res_pack.stderr)
    else:
        # vzpack (ia64 binary) isn't runnable here. Write an equivalent
        # container by hand -- reverse-engineered from the existing
        # ghost13_vz.vz: 4-byte magic "VZFO" + 17-byte zero-padded name +
        # 1-byte type (0xF1 = machine code) + 2-byte little-endian start
        # address, then the raw binary appended as-is.
        print(f"vzpack not found; writing {OUT_VZ} directly...")
        name = b"13GHOSTS"
        name_field = name + b"\x00" * (17 - len(name))
        with open(OUT_BIN, "rb") as f:
            raw = f.read()
        with open(OUT_VZ, "wb") as f:
            f.write(b"VZFO")
            f.write(name_field)
            f.write(b"\xf1")
            f.write(struct.pack("<H", LOAD_ORG))
            f.write(raw)
        print(f"Wrote {OUT_VZ} ({os.path.getsize(OUT_VZ)} bytes)")

    # Convert .vz to .wav using vz2wav
    if os.path.exists(VZ2WAV) and os.path.exists(OUT_VZ):
        print(f"Converting {OUT_VZ} into {OUT_WAV} using vz2wav...")
        cmd_wav = [VZ2WAV, OUT_VZ, OUT_WAV]
        res_wav = subprocess.run(cmd_wav, capture_output=True, text=True)
        if res_wav.returncode == 0:
            wav_size = os.path.getsize(OUT_WAV)
            print(f"Generated {OUT_WAV} ({wav_size} bytes)")
        else:
            print("vz2wav failed:", res_wav.stderr)
    else:
        print(f"vz2wav not found -- skipping {OUT_WAV}. Re-run `make wav` "
              f"on your machine (which has the real vz2wav) against this "
              f"{OUT_VZ} to get fresh cassette audio.")

    return True

if __name__ == "__main__":
    main()
