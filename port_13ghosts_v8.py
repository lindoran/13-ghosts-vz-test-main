#!/usr/bin/env python3
"""
port_13ghosts_v8.py -- 13 Ghosts (TRS-80, Software Affair 1982) -> VZ200 / RC39

DESIGN (replaces the relocating re-assembly of v1..v7)
------------------------------------------------------
The v1..v7 scripts disassembled the TRS-80 binary, shifted it to 0x7AE8 and
re-assembled it with symbolic labels.  A linear disassembly cannot tell code
from data or addresses from constants, so every such guess corrupted
something (level data, the day/night patch bytes, the decompressor's own
code, and -- finally -- the pointer tables in the sprite/animation data,
which hold absolute TRS-80 addresses).

v8 does not relocate anything.  The game stays at its ORIGINAL addresses,
0x5200-0xCA05, byte for byte, and only the TRS-80-specific instructions are
patched in place (about 25 sites: video copy, keyboard, sound, TRSDOS).  The
only thing that moves is the block of 34 compressed screens, which sits at
0x644B-0x886B in the original -- exactly on top of the VZ200's I/O and video
RAM (0x6800-0x77FF).  The screens are position independent (the game
indexes them through a table it builds at start-up), so the patcher splits
them into pieces that fit the free RAM and the table is filled by the
replacement code (hal_vz.asm) instead of by the game's own scan.

Memory map after loading (RC39 with the 10K window set to RAM):

  4000-4007  stub: loads the next tape file          (tape file 1)
  4050-51FF  compressed screens, piece C
  5200-644A  ORIGINAL game bytes, patched
  644B-67FF  compressed screens, piece A
  6800-77FF  VZ200 I/O + video RAM (not used for code/data)
  7AE8-7AEF  stub: loads the next tape file          (tape file 2)
  7AF0-886B  compressed screens, piece B
  886C-CA05  ORIGINAL game bytes, patched
  CA12-E411  game buffers, slack, screen table (runtime, original addresses)
  E420-      replacement routines, font, screen list  (tape file 3)
  F400-F53F  3x5 HUD font cache, 320 bytes (runtime)
  F540-F54E  high-score name entry buffer, 15 bytes (runtime)
  F600-FBFF  blit lookup tables, 6 pages (runtime, built by vz_build_blit_tables)
  FC00-FFFF  stack (grows down from FFFF)

Everything the patcher changes is listed in PATCHES and checked against the
expected original bytes, so the result can be diffed against the original.
"""
import os
import re
import shutil
import struct
import subprocess
import sys

SRC_ASM = "ghost13b.asm"                                   # z80dasm listing of the TRS-80 binary
FONT_SRC = os.path.join("font-asset-research", "font_3x5.asm")
HAL_SRC = "hal_vz.asm"
ASSETS_DIR = "assets"
PROD_DIR = "prod"

ORIG_LO, ORIG_HI = 0x5200, 0xCA05
CODE_RANGES = [(0x535A, 0x60A8), (0xC587, 0xCA05)]         # real code; the rest is data
GAME_ENTRY = 0x535A

HAL_BASE = 0xE420
FONT3_CACHE = 0xF400            # 3x5 HUD font, 64 glyphs x 5 bytes = 320 bytes (runtime)
NAME_BUF = 0xF540               # high-score name entry buffer, 15 bytes (replaces TRS-80 video RAM 3EE9h)
assert FONT3_CACHE + 320 <= NAME_BUF
SCREEN_TABLE = 0xE212
SND_ENABLE = 0xC80B
HUD_SCORE, HUD_LEVEL10, HUD_LEVEL1 = 0xDDDA, 0xDE04, 0xDE05    # buffer 4 row 15 (0xDDD2) + col 8 / 50 / 51; score field = cols 8-16
HUD_GHOST10, HUD_GHOST1 = 0xDE0F, 0xDE10
HUD_LEVELNAME = 0xDDE8          # 17-char level-name field, HUD row cols 22-38

BUILDER_START = 0x644A          # `ld hl,l644ah` in the original table builder (0xC753)

# Where the compressed screens may go: (name, first address, limit).  Each
# region ends with a 09h terminator so the decompressor stops there.
SCREEN_REGIONS = [("C", 0x4050, 0x5200), ("A", 0x644B, 0x6800), ("B", 0x7AF0, 0x886C)]

STUB_CODE = lambda name_ptr: bytes([0x21, name_ptr & 255, name_ptr >> 8, 0xCD, 0x5F, 0x36, 0x76, 0x00])

VZPACK = os.environ.get("VZPACK") or shutil.which("vzpack")
VZ2WAV = os.environ.get("VZ2WAV") or shutil.which("vz2wav")


# ------------------------------------------------------------------ original image
def recon_original():
    """Rebuild the original binary from the ';addr<TAB>bytes' comments of the z80dasm listing."""
    pat = re.compile(r";([0-9a-f]{4})\t((?:[0-9a-f]{2} )+)")
    mem = {}
    for line in open(SRC_ASM):
        m = pat.search(line)
        if m:
            a = int(m.group(1), 16)
            for i, x in enumerate(m.group(2).split()):
                mem[a + i] = int(x, 16)
    missing = [a for a in range(ORIG_LO, ORIG_HI + 1) if a not in mem]
    if missing or min(mem) != ORIG_LO or max(mem) != ORIG_HI:
        raise SystemExit(f"{SRC_ASM}: cannot rebuild original image (missing {len(missing)} bytes)")
    return bytearray(mem[a] for a in range(ORIG_LO, ORIG_HI + 1))


def in_code(a):
    return any(lo <= a <= hi for lo, hi in CODE_RANGES)


# ------------------------------------------------------------------ compressed screens
def scan_streams(img):
    """Exactly what the original table builder at 0xC750 does (including its
    jump into the middle of `ld de,2323h` to execute INC HL twice/three times)."""
    b = lambda a: img[a - ORIG_LO]
    table, hl = {}, BUILDER_START
    hl += 1
    while True:
        a = b(hl)
        if a == 0x09:
            return table, hl                      # end marker
        if a in (0x0A, 0x08, 0x0B):
            hl += 2
        elif a < 4:
            hl += 3
        elif a == 4:
            idx = b(hl + 1) | (b(hl + 2) << 8)
            hl += 3
            table[idx] = hl
        else:
            hl += 1


def decode_stream(rd, ptr):
    """The game's decompressor (original 0xC6A3-0xC6F8) -> list of cells, plus overflow."""
    out, hl = [], ptr - 1
    for _ in range(20000):
        hl += 1
        a = rd(hl)
        if a >= 0x20:
            out.append(a)
        elif a == 0x0A:
            hl += 1
            n = rd(hl) or 256
            out.extend([out[-1]] * n)
        elif a < 4:
            hl += 1
            tgt = (a << 8) | rd(hl)
            if tgt < len(out):
                raise SystemExit(f"stream at {ptr:04X}: negative fill")
            out.extend([None] * (tgt - len(out)))          # None = fill byte (day/night dependent)
        elif a == 6:
            continue
        else:
            while len(out) < 1024:
                out.append(None)
            return out
    raise SystemExit(f"stream at {ptr:04X} does not terminate")


def plan_screens(orig):
    table, end = scan_streams(orig)
    markers = sorted((ptr - 3, idx, ptr) for idx, ptr in table.items())
    assert markers[0][0] == BUILDER_START + 1, hex(markers[0][0])
    chunks = []                                          # (old_marker_addr, idx, bytes)
    for i, (m, idx, ptr) in enumerate(markers):
        nxt = markers[i + 1][0] if i + 1 < len(markers) else end
        chunks.append((m, idx, bytes(orig[m - ORIG_LO: nxt - ORIG_LO])))
    assert orig[end - ORIG_LO] == 0x09
    total = sum(len(c[2]) for c in chunks)

    # greedy packing, biggest first, into regions (each reserves 1 byte for the 09 terminator)
    free = {name: [lo, hi - lo - 1] for name, lo, hi in SCREEN_REGIONS}
    placement = {}                                       # idx -> (region, offset)
    region_items = {name: [] for name, _, _ in SCREEN_REGIONS}
    region_items["D"] = []
    for m, idx, data in sorted(chunks, key=lambda c: -len(c[2])):
        for name, _, _ in SCREEN_REGIONS:
            if free[name][1] >= len(data):
                region_items[name].append((idx, data))
                free[name][1] -= len(data)
                break
        else:
            region_items["D"].append((idx, data))
    return table, chunks, region_items, total


def region_bytes(items):
    """Concatenate chunks + terminator; return (bytes, {idx: offset_of_stream_data})."""
    blob, offs = bytearray(), {}
    for idx, data in items:
        offs[idx] = len(blob) + 3                         # stream starts after the 3-byte marker
        blob += data
    blob.append(0x09)
    return bytes(blob), offs


# ------------------------------------------------------------------ patches
HAL_SYMBOLS = {}                                          # filled after the HAL is assembled


def u16(v):
    return bytes([v & 255, v >> 8])


def call(sym):
    return b"\xCD" + u16(HAL_SYMBOLS[sym])


def jp(addr):
    return b"\xC3" + u16(addr)


NOP = b"\x00"


def build_patches():
    """(address, expected original bytes, replacement bytes, description)"""
    P = []

    def add(addr, old, new, why):
        new = bytes(new)
        assert len(new) <= len(old), (hex(addr), len(new), len(old))
        new = new + NOP * (len(old) - len(new))
        P.append((addr, bytes(old), new, why))

    # --- video RAM copies: ld de,3C00h / ld bc,0400h / [push bc] / ldir
    add(0x5577, bytes.fromhex("11 00 3c 01 00 04 c5 ed b0"), call("vz_blit_site1"),
        "buffer 4 -> screen, plus HUD; keeps the original push bc")
    for a in (0x5A7E, 0x602A, 0x607B):
        add(a, bytes.fromhex("11 00 3c 01 00 04 ed b0"), call("vz_blit_frame"), "buffer -> screen")
    # --- title credits: the final static draw of the title screen (after the slide-in)
    add(0x5396, bytes.fromhex("cd 12 60"), call("vz_title_draw"), "title: draw the screen, then the 3x5 credits")
    # --- title credits, pages 2 and 3: the idle wait for a key (B = 2) after the tune
    add(0x53FF, bytes.fromhex("cd ee c9"), call("vz_title_wait"),
        "title idle wait: same polls as sub_c9eeh, flipping the credits to pages 2 and 3")
    # --- game-over summary: sub_5b6dh's final copy of rows 12-15 to 3F00h (HL = 0CD12h stays)
    add(0x5BA2, bytes.fromhex("11 00 3f 01 00 01 ed b0"), call("vz_gameover_blit"),
        "game over: blit rows 12-15, then the 3x5 summary in the margins")
    # --- high-score table display (sub_5ae1h): blit, then draw the table from the table itself
    add(0x5AFD, bytes.fromhex("11 00 3c 01 00 04 ed b0"), call("vz_hs_blit"),
        "high scores: blit screen 38, then the 3x5 table (ranks, 3-letter names, scores)")
    # --- high-score name entry: typed name lives in video RAM 3EE9h on the TRS-80 (ROM on the VZ)
    for a, why in ((0x5B2E, "name entry: buffer start"), (0x5AAF, "name entry: copy of the typed name into the table")):
        add(a, bytes.fromhex("21 e9 3e"), bytes([0x21]) + u16(NAME_BUF), why)
    add(0x5B5B, bytes.fromhex("11 f8 3e"), bytes([0x11]) + u16(NAME_BUF + 3), "name entry: limit is 3 letters")
    add(0x5B31, bytes.fromhex("36 8f cd 3a 60"), call("vz_name_cursor"),
        "name entry: store the cursor, draw prompt + name in 3x5, then the original sub_603ah")
    # --- win screen: the status row written to the last text row (3FC0h) after screen 39
    add(0x56A7, bytes.fromhex("11 c0 3f 01 40 00 ed b0"), call("vz_win_row"),
        "win screen: the HUD row template (HL = 61D5h) drawn in 3x5 instead of copied to 3FC0h")
    # --- keyboard
    for a in (0x5404, 0x54E5, 0x5DBC, 0x5F27):
        add(a, bytes.fromhex("3a 40 38"), call("vz_read_kbd_3840"), "TRS-80 keyboard row 0x3840")
    add(0x5507, bytes.fromhex("3a 04 38"), call("vz_read_kbd_3804"), "TRS-80 keyboard row 0x3804 (S/T sound keys)")
    add(0xC9FD, bytes.fromhex("3a ff 38 4f 3e ff 2f b1 c9"), call("vz_check_fire") + b"\xC9",
        "any-key poll (NZ = key down)")
    # --- sound: out (80h),a  (the game also poked the port number into these instructions)
    add(0x5C11, bytes.fromhex("32 1c 5c"), b"", "self-modifying port store (target instruction is patched)")
    add(0x5C14, bytes.fromhex("32 2b 5c"), b"", "self-modifying port store (target instruction is patched)")
    add(0xC796, bytes.fromhex("32 f8 c7"), b"", "self-modifying port store (target instruction is patched)")
    add(0xC799, bytes.fromhex("32 08 c8"), b"", "self-modifying port store (target instruction is patched)")
    add(0x5C1B, bytes.fromhex("d3 80 c5 10 fe 10 fe 10 fe c1"), call("vz_snd_burst"), "sound out + delay")
    add(0x5C29, bytes.fromhex("af d3 80"), call("vz_snd_silence"), "sound off")
    add(0xC7F6, bytes.fromhex("08 d3 80 08"), call("vz_snd_exaf"), "music sound out")
    add(0xC807, bytes.fromhex("d3 80 18 f1"), jp(HAL_SYMBOLS["vz_snd_c807"]), "music sound out (then jr 0xC7FC)")
    # --- TRSDOS (high-score disk file) bypass
    add(0x536D, bytes.fromhex("cd 24 44 cc 36 44 cc 28 44 28 05 fe 18 c2 09 44"), jp(0x537D),
        "skip TRSDOS high-score read")
    add(0x5ACA, bytes.fromhex("cd 20 44 cc 39 44 cc 28 44 c2 09 44"), b"", "skip TRSDOS high-score write")
    # --- compressed-screen table: filled by vz_init_screen_table instead
    add(0xC750, bytes.fromhex("01 12 e2"), jp(HAL_SYMBOLS["vz_init_screen_table"]),
        "table builder: fill the screen table from the generated list instead of scanning")
    return P


def apply_patches(img, patches):
    for addr, old, new, why in patches:
        i = addr - ORIG_LO
        if bytes(img[i:i + len(old)]) != old:
            raise SystemExit(f"patch {addr:04X}: unexpected original bytes {bytes(img[i:i+len(old)]).hex(' ')}")
        img[i:i + len(new)] = new


# ------------------------------------------------------------------ HAL assembly
def load_corrected_font():
    """Emit the packed 3x5 HUD font (64 glyphs x 2 bytes) from font-asset-research/font_3x5.asm."""
    txt = open(FONT_SRC).read()
    rows = re.findall(r"DEFB\s+0x([0-9A-Fa-f]{2}),0x([0-9A-Fa-f]{2})\s*;\s*ordinal", txt)
    if len(rows) != 64:
        raise SystemExit(f"{FONT_SRC}: expected 64 glyphs, found {len(rows)}")
    out = ["; 3x5 HUD font, 64 glyphs x 2 bytes (15 pixels row-major, bit 14 = top-left).",
           "; Generated from font-asset-research/font_3x5.asm -- do not hand-edit.", "vz_font3_src:"]
    for i, (hi, lo) in enumerate(rows):
        out.append(f"\tdefb\t0{hi.upper()}h,0{lo.upper()}h\t\t; glyph {i:02X}")
    out.append("vz_font3_src_end:")
    return "\n".join(out) + "\n"


def assemble_hal(screen_entries, extra_blob):
    equ = [f"HAL_BASE EQU 0{HAL_BASE:04X}h", f"FONT3_CACHE EQU 0{FONT3_CACHE:04X}h",
           f"SCREEN_TABLE EQU 0{SCREEN_TABLE:04X}h", f"GAME_ENTRY EQU 0{GAME_ENTRY:04X}h",
           f"SND_ENABLE EQU 0{SND_ENABLE:04X}h", f"HUD_SCORE EQU 0{HUD_SCORE:04X}h",
           f"HUD_LEVEL10 EQU 0{HUD_LEVEL10:04X}h", f"HUD_LEVEL1 EQU 0{HUD_LEVEL1:04X}h",
           f"HUD_GHOST10 EQU 0{HUD_GHOST10:04X}h", f"HUD_GHOST1 EQU 0{HUD_GHOST1:04X}h",
           f"HUD_LEVELNAME EQU 0{HUD_LEVELNAME:04X}h", f"NAME_BUF EQU 0{NAME_BUF:04X}h"]
    lst = ["", "; compressed-screen list: screen index, address of its stream (after the 04 marker)",
           "vz_screen_list:"]
    for idx, ptr in screen_entries:
        lst.append(f"\tdefw\t0{idx:04X}h,0{ptr:04X}h")
    lst.append("\tdefw\t0FFFFh")
    src = f"\torg\t0{HAL_BASE:04X}h\n" + "\n".join(equ) + "\n" + open(HAL_SRC).read() + "\n" + load_corrected_font() \
        + "\n".join(lst) + "\nvz_hal_end:\n"
    asm_path = os.path.join(ASSETS_DIR, "ghost13_hal.asm")
    open(asm_path, "w").write(src)
    asm_command = os.environ.get("ASM") or "z88dk-z80asm"
    asm = shutil.which(asm_command)
    if not asm:
        raise SystemExit(f"{asm_command} not found (install z88dk, or set ASM to the assembler path)")
    for f in ("ghost13_hal.bin", "ghost13_hal.map", "ghost13_hal.o"):
        f = os.path.join(ASSETS_DIR, f)
        if os.path.exists(f):
            os.remove(f)
    res = subprocess.run([asm, "-b", "-m", asm_path], capture_output=True, text=True)
    bin_path = os.path.join(ASSETS_DIR, "ghost13_hal.bin")
    if res.returncode != 0 or not os.path.exists(bin_path):
        raise SystemExit("assembling ghost13_hal.asm failed:\n" + res.stdout + res.stderr)
    code = open(bin_path, "rb").read()
    syms = {}
    with open(os.path.join(ASSETS_DIR, "ghost13_hal.map")) as map_file:
        map_text = map_file.read()
    for m in re.finditer(r"^(\w+)\s+= \$([0-9A-F]+)", map_text, re.M):
        syms[m.group(1)] = int(m.group(2), 16)
    return code, syms


# ------------------------------------------------------------------ packing .vz
def write_vz(path, bin_path, name, start, data):
    with open(bin_path, "wb") as binary_file:
        binary_file.write(data)
    if VZPACK and os.path.exists(VZPACK):
        r = subprocess.run([VZPACK, "--in-bin", bin_path, "-s", hex(start), "-o", path, "-t", "mc", "-n", name],
                           capture_output=True, text=True)
        if r.returncode == 0:
            return
        print("vzpack failed, writing the container directly:", r.stderr.strip())
    with open(path, "wb") as f:
        f.write(b"VZFO" + name.encode().ljust(17, b"\0")[:17] + b"\xf1" + struct.pack("<H", start) + data)


def main():
    os.makedirs(ASSETS_DIR, exist_ok=True)
    os.makedirs(PROD_DIR, exist_ok=True)
    orig = recon_original()
    pristine = bytes(orig)
    print(f"original image rebuilt from {SRC_ASM}: {len(orig)} bytes at {ORIG_LO:04X}-{ORIG_HI:04X}")

    table, chunks, region_items, total = plan_screens(orig)
    print(f"{len(chunks)} compressed screens, {total} bytes, split into regions: " +
          ", ".join(f"{k}:{len(v)}" for k, v in region_items.items()))

    # pass 1: assemble the HAL with dummy screen addresses to learn its size
    dummy = [(idx, 0) for idx in sorted(table)]
    code, syms = assemble_hal(dummy, b"")
    HAL_SYMBOLS.update(syms)
    d_blob, d_offs = region_bytes(region_items["D"])
    d_base = HAL_BASE + len(code)

    # final screen addresses
    new_ptr = {}
    layout = {}
    for name, lo, hi in SCREEN_REGIONS:
        blob, offs = region_bytes(region_items[name])
        assert len(blob) <= hi - lo, (name, len(blob), hi - lo)
        layout[name] = (lo, blob)
        for idx, off in offs.items():
            new_ptr[idx] = lo + off
    layout["D"] = (d_base, d_blob)
    for idx, off in d_offs.items():
        new_ptr[idx] = d_base + off
    entries = [(idx, new_ptr[idx]) for idx in sorted(new_ptr)]
    code, syms2 = assemble_hal(entries, b"")
    assert syms2 == syms and d_base == HAL_BASE + len(code), "HAL changed size between passes"
    hal_total = len(code) + len(d_blob)
    if HAL_BASE + hal_total >= FONT3_CACHE:
        raise SystemExit(f"HAL + screen piece D ({hal_total} bytes) overlaps the font cache at {FONT3_CACHE:04X}")
    BLIT_TABLES = 0xF600        # must match BLIT_PAGE in hal_vz.asm: six 256-byte runtime pages
    assert f"BLIT_PAGE EQU 0{BLIT_TABLES >> 8:02x}h" in open("hal_vz.asm").read(), "BLIT_PAGE in hal_vz.asm does not match BLIT_TABLES"
    assert NAME_BUF + 15 <= BLIT_TABLES and BLIT_TABLES + 6 * 256 <= 0xFC00, "runtime areas overlap each other or the stack"

    # patch the original game bytes
    patches = build_patches()
    apply_patches(orig, patches)
    changed = [i for i in range(len(orig)) if orig[i] != pristine[i]]
    print(f"patched {len(patches)} sites, {len(changed)} bytes differ from the original binary:")
    for addr, old, new, why in patches:
        print(f"   {addr:04X}  {old.hex(' ')}  ->  {new.hex(' ')}   {why}")

    # ---- build the three tape files
    def at(addr):
        return addr - ORIG_LO

    # file 1: 4000-67FF
    f1 = bytearray(0x6800 - 0x4000)
    f1[0:8] = STUB_CODE(0x4007)
    lo, blob = layout["C"]
    f1[lo - 0x4000: lo - 0x4000 + len(blob)] = blob
    f1[0x5200 - 0x4000: 0x644B - 0x4000] = orig[at(0x5200): at(0x644B)]
    lo, blob = layout["A"]
    f1[lo - 0x4000: lo - 0x4000 + len(blob)] = blob
    # file 2: 7AE8-CA05
    f2 = bytearray(ORIG_HI + 1 - 0x7AE8)
    f2[0:8] = STUB_CODE(0x7AEF)
    lo, blob = layout["B"]
    f2[lo - 0x7AE8: lo - 0x7AE8 + len(blob)] = blob
    f2[0x886C - 0x7AE8:] = orig[at(0x886C):]
    # file 3: HAL + piece D
    f3 = code + d_blob

    # ---- verify: every screen decodes identically from its new home
    mem = bytearray(65536)
    mem[0x4000:0x6800] = f1
    mem[0x7AE8:ORIG_HI + 1] = f2
    mem[HAL_BASE:HAL_BASE + len(f3)] = f3
    rd_new = lambda a: mem[a]
    rd_old = lambda a: pristine[a - ORIG_LO]
    for idx in sorted(table):
        a = decode_stream(rd_old, table[idx])
        b = decode_stream(rd_new, new_ptr[idx])
        if a != b:
            raise SystemExit(f"screen {idx:02X} decodes differently after the move")
    print(f"verified: all {len(table)} screens decode identically from their new addresses")
    # the part of the original that was NOT patched or moved must be byte-identical
    untouched = bytearray(pristine)
    for addr, old, new, why in patches:
        untouched[at(addr): at(addr) + len(old)] = old
    assert untouched == pristine
    check = bytearray(65536)
    check[0x5200:0x644B] = mem[0x5200:0x644B]
    check[0x886C:ORIG_HI + 1] = mem[0x886C:ORIG_HI + 1]
    diff = [a for a in list(range(0x5200, 0x644B)) + list(range(0x886C, ORIG_HI + 1))
            if check[a] != pristine[a - ORIG_LO]]
    assert set(diff) == {ORIG_LO + i for i in changed if ORIG_LO + i < 0x644B or ORIG_LO + i >= 0x886C}, \
        "unexpected differences from the original"

    write_vz(os.path.join(PROD_DIR, "ghost13_p1.vz"),
             os.path.join(ASSETS_DIR, "ghost13_p1.bin"), "13GHOSTS1", 0x4000, bytes(f1))
    write_vz(os.path.join(PROD_DIR, "ghost13_p2.vz"),
             os.path.join(ASSETS_DIR, "ghost13_p2.bin"), "13GHOSTS2", 0x7AE8, bytes(f2))
    write_vz(os.path.join(PROD_DIR, "ghost13_p3.vz"),
             os.path.join(ASSETS_DIR, "ghost13_p3.bin"), "13GHOSTS3", HAL_BASE, bytes(f3))
    for p in (os.path.join(PROD_DIR, "ghost13_p1.vz"),
              os.path.join(PROD_DIR, "ghost13_p2.vz"),
              os.path.join(PROD_DIR, "ghost13_p3.vz")):
        print(f"wrote {p} ({os.path.getsize(p)} bytes)")
    # a flat 64K memory image for emulator / test use
    with open(os.path.join(ASSETS_DIR, "ghost13_ram.bin"), "wb") as ram_file:
        ram_file.write(bytes(mem))
    return 0


if __name__ == "__main__":
    sys.exit(main())
