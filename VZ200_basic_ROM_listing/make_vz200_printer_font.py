#!/usr/bin/env python3
"""
make_vz200_printer_font.py

Extract and render the VZ200 Level II BASIC printer graphics font (PRN_GFX_FONT).

Font Structure:
    The ROM's PRN_GFX_FONT contains 64 glyphs, 5 bytes per glyph.
    Each glyph is 5 columns wide x 8 dots high (column-major, active-low):
      - 5 bytes represent the 5 vertical dot-matrix columns (left to right: col 0..4).
      - Active-low dots: bit = 0 -> printed dot (ink / '#'), bit = 1 -> blank (' ').
      - Vertical bit orientation:
            bit 0 (LSB) = top dot (row 0)
            bit 1       = row 1
            ...
            bit 6       = row 6
            bit 7 (MSB) = row 7 (descender / line spacing, almost always 1/blank)

    During inverse-character printer output (PRN_INV_CHAR, ROM address 0x3C55),
    the VZ200 outputs a blank margin column (0xFF), the 5 glyph columns, and
    another blank margin column (0xFF), forming a 7x8 character cell.

Known ROM Typos in VZ200 Level II BASIC V2.0:
    - Char 0x18 ('X'): ROM has DEFB 0x9C, 0xED, 0xF7, 0xEB, 0x9C.
      Byte 1 (col 1) is 0xED instead of 0xEB (bit 1 vs bit 2 swap, D vs B).
      With 0xED, a dot is misplaced at row 1 instead of row 2.
      With 0xEB, 'X' has full horizontal symmetry.
    - Char 0x1F ('<-' left arrow): ROM has DEFB 0xF7, 0xE3, 0xD6, 0xF7, 0xF7.
      Byte 2 (col 2) is 0xD6 instead of 0xD5 (bit 0 vs bit 1 swap).
      With 0xD6, the top arrowhead dot is in row 0 instead of row 1.
      With 0xD5, the arrow is vertically symmetric around row 3.
    - Char 0x23 ('#'): ROM has DEFB 0xEB, 0x80, 0xEB, 0x80, 0xED.
      Byte 4 (col 4) is 0xED instead of 0xEB (bit 1 vs bit 2 swap).
      With 0xED, row 1 had an extra dot in col 4 while row 2 missed its dot in col 4.
      With 0xEB, row 1 matches row 0 (| # # |) and row 2 matches row 4 (|#####|),
      forming a clean, symmetric hash symbol.
    - Char 0x24 ('$'): ROM has DEFB 0xDB, 0xD6, 0x80, 0xD6, 0xED.
      Bytes 1 and 3 (cols 1 & 3) are 0xD6 instead of 0xD5 (bit 0 vs bit 1 swap).
      With 0xD6, the top dots are placed at row 0 instead of row 1, leaving
      row 1 missing its dots. With 0xD5, '$' matches canonical 5x7 GLCD font.
    - Char 0x2A ('*'): ROM has DEFB 0xD6, 0xE3, 0x80, 0xE3, 0xD5.
      Byte 0 (col 0) is 0xD6 instead of 0xD5 (bit 0 vs bit 1 swap).
      With 0xD6, the dot is misplaced at row 0 instead of row 1.
      With 0xD5, '*' matches col 4 and forms a symmetric 8-spoke star burst.
    - Char 0x2C (','): ROM has DEFB 0xDF, 0xC7, 0xF7, 0xFF, 0xFF.
      The original comma glyph was distorted and only spanned rows 3-5 with an awkward hook.
      Matching the comma below the dot in semicolon ';' (0x3B, DEFB 0xBF, 0xC4, 0xE4, 0xFF, 0xFF)
      with rows 0-2 cleared (blank) yields DEFB 0xBF, 0xC7, 0xE7, 0xFF, 0xFF, giving
      a clean, consistent comma descender down to row 6.
    - Char 0x33 ('3'): ROM has DEFB 0xDD, 0xBB, 0xBB, 0xBB, 0xC9.
      The middle bytes 0xBB are a typo for 0xB6 (the same middle bar pattern as '8' and '9').
      With 0xBB, bits 0 and 3 are missing/misplaced. With 0xB6, it renders a perfect '3'.
    - Char 0x35 ('5'): ROM has DEFB 0xD8, 0xBA, 0xDA, 0xDA, 0xC6.
      Bytes 2 and 3 are 0xDA instead of 0xBA (a 'B' vs 'D' hex entry error).
      With 0xBA, it renders a perfect '5'.
    - Char 0x3C ('<'): ROM has DEFB 0xF7, 0xEB, 0xDD, 0xDE, 0xDE.
      Bytes 3 and 4 are 0xDE instead of 0xBE (a 'D' vs 'B' hex entry error).
      With 0xDE, bit 5 is 0 instead of bit 6, corrupting row 5 (three dots instead
      of one) and leaving row 6 blank. With 0xBE, row 5 mirrors row 1 and row 6
      mirrors row 0, restoring vertical symmetry.
    - Char 0x3E ('>'): ROM has DEFB 0xDE, 0xDE, 0xDD, 0xEB, 0xF7.
      Bytes 0 and 1 are 0xDE instead of 0xBE (same 'D' vs 'B' hex entry error).
      With 0xBE, row 5 mirrors row 1 and row 6 mirrors row 0, restoring vertical symmetry.

    Use --fix-bugs to optionally preview the corrected glyphs.

Example:
    python3 make_vz200_printer_font.py level_II_basic_V2_VZ200.asm --ascii --fix-bugs
    python3 make_vz200_printer_font.py level_II_basic_V2_VZ200.asm -o vz200_printer_font.png --fix-bugs

Dependencies:
    Pillow (for PNG generation)
"""

import argparse
import re
from pathlib import Path

try:
    from PIL import Image, ImageDraw, ImageFont
except ImportError:
    Image = None
    ImageDraw = None
    ImageFont = None


# Special character names in the 64-character table
SPECIAL_NAMES = {
    0x00: "@",
    0x1B: "[",
    0x1C: "\\ (down)",
    0x1D: "]",
    0x1E: "^ (up)",
    0x1F: "<- (left)",
    0x20: "SPACE",
}

# Known ROM typos and their canonical corrections
KNOWN_FIXES = {
    0x18: [0x9C, 0xEB, 0xF7, 0xEB, 0x9C],  # 'X': col 1 0xED -> 0xEB
    0x1F: [0xF7, 0xE3, 0xD5, 0xF7, 0xF7],  # '<- (left)': col 2 0xD6 -> 0xD5
    0x23: [0xEB, 0x80, 0xEB, 0x80, 0xEB],  # '#': col 4 0xED -> 0xEB (swaps bits 1 & 2)
    0x24: [0xDB, 0xD5, 0x80, 0xD5, 0xED],  # '$': cols 1 & 3 0xD6 -> 0xD5
    0x2A: [0xD5, 0xE3, 0x80, 0xE3, 0xD5],  # '*': col 0 0xD6 -> 0xD5
    0x2C: [0xBF, 0xC7, 0xE7, 0xFF, 0xFF],  # ',': rows 0-2 blank, rows 3-7 match ';' (0x3B)
    0x33: [0xDD, 0xB6, 0xB6, 0xB6, 0xC9],  # '3': 0xBB -> 0xB6
    0x35: [0xD8, 0xBA, 0xBA, 0xBA, 0xC6],  # '5': 0xDA -> 0xBA
    0x3C: [0xF7, 0xEB, 0xDD, 0xBE, 0xBE],  # '<': cols 3 & 4 0xDE -> 0xBE
    0x3E: [0xBE, 0xBE, 0xDD, 0xEB, 0xF7],  # '>': cols 0 & 1 0xDE -> 0xBE
}


def parse_font(filename):
    """Extract PRN_GFX_FONT's 64 five-byte glyphs from the assembly source."""
    text = Path(filename).read_text(encoding="utf-8", errors="replace")

    marker = "PRN_GFX_FONT:"
    start = text.find(marker)
    if start < 0:
        raise ValueError("Could not find PRN_GFX_FONT in source file")

    # Stop at the next section after the font table.
    end = text.find("; Output error message", start)
    if end < 0:
        end = len(text)

    block = text[start:end]

    pattern = re.compile(
        r"DEFB\s+"
        r"0x([0-9A-Fa-f]{2})\s*,\s*"
        r"0x([0-9A-Fa-f]{2})\s*,\s*"
        r"0x([0-9A-Fa-f]{2})\s*,\s*"
        r"0x([0-9A-Fa-f]{2})\s*,\s*"
        r"0x([0-9A-Fa-f]{2})"
        r"\s*;\s*Char\s+0x([0-9A-Fa-f]{2}):\s*(.*)"
    )

    glyphs = {}

    for match in pattern.finditer(block):
        values = [int(match.group(i), 16) for i in range(1, 6)]
        code = int(match.group(6), 16)
        label = match.group(7).strip()

        glyphs[code] = {
            "bytes": values,
            "label": label,
        }

    if len(glyphs) != 64:
        raise ValueError(
            "Expected 64 glyphs in PRN_GFX_FONT, found %d" % len(glyphs)
        )

    for code in range(64):
        if code not in glyphs:
            raise ValueError("Missing glyph 0x%02X" % code)
        if len(glyphs[code]["bytes"]) != 5:
            raise ValueError("Glyph 0x%02X does not have 5 bytes" % code)

    return glyphs


def get_glyph_columns(glyph_bytes, include_margins=False):
    """Return the column list, optionally bracketed by 0xFF blank margins."""
    if include_margins:
        return [0xFF] + list(glyph_bytes) + [0xFF]
    return list(glyph_bytes)


def glyph_to_ascii_rows(glyph_bytes, msb_top=False, include_margins=False):
    """
    Convert a glyph's vertical column bytes into 8 horizontal ASCII rows.
    
    Default orientation (msb_top=False):
        row 0 = bit 0 (LSB)
        ...
        row 7 = bit 7 (MSB)
    """
    cols = get_glyph_columns(glyph_bytes, include_margins)
    rows = []
    for y in range(8):
        bit = (7 - y) if msb_top else y
        row_str = "".join("#" if not (col & (1 << bit)) else " " for col in cols)
        rows.append(row_str)
    return rows


def print_ascii(glyphs, msb_top=False, include_margins=False, fix_bugs=False):
    """Print every glyph as an ASCII bitmap."""
    print("=" * 60)
    print("VZ200 PRN_GFX_FONT ASCII DUMP")
    print("Orientation: %s at top, active-low (0=dot, 1=blank)" %
          ("MSB (bit 7)" if msb_top else "LSB (bit 0)"))
    if include_margins:
        print("Margins: 7 columns (FF [5 glyph cols] FF)")
    else:
        print("Margins: 5 columns (glyph only)")
    if fix_bugs:
        patched_list = ", ".join("0x%02X '%s'" % (k, SPECIAL_NAMES.get(k, glyphs[k]["label"].strip("'\""))) for k in sorted(KNOWN_FIXES.keys()))
        print("Note: Known ROM typos (%s) patched" % patched_list)
    print("=" * 60)

    for code in sorted(glyphs.keys()):
        glyph = glyphs[code]
        label = SPECIAL_NAMES.get(code, glyph["label"])
        raw_bytes = glyph["bytes"]
        bytes_to_use = KNOWN_FIXES[code] if (fix_bugs and code in KNOWN_FIXES) else raw_bytes

        byte_str = " ".join("%02X" % b for b in bytes_to_use)
        status = ""
        if code in KNOWN_FIXES:
            if fix_bugs:
                status = " [PATCHED ROM BUG]"
            else:
                status = " [ROM TYPO - see docstring]"

        print()
        print("0x%02X %-12s %s%s" % (code, label, byte_str, status))

        rows = glyph_to_ascii_rows(bytes_to_use, msb_top=msb_top, include_margins=include_margins)
        for y, row_str in enumerate(rows):
            bit_idx = (7 - y) if msb_top else y
            print("   b%d |%s|" % (bit_idx, row_str))


def make_font_png(glyphs, output, scale=12, columns=8, msb_top=False, include_margins=False, fix_bugs=False):
    """
    Create a bitmap sheet containing all 64 printer glyphs.
    """
    if Image is None:
        raise SystemExit("Pillow is required for PNG output. Install with: pip install pillow")

    width_dots = 7 if include_margins else 5
    height_dots = 8

    glyph_w = width_dots * scale
    glyph_h = height_dots * scale

    margin = 12
    label_h = 22
    cell_w = glyph_w + margin
    cell_h = glyph_h + label_h + margin

    codes = sorted(glyphs.keys())
    rows_count = (len(codes) + columns - 1) // columns

    image_w = columns * cell_w + margin
    image_h = rows_count * cell_h + margin

    image = Image.new("RGB", (image_w, image_h), "white")
    draw = ImageDraw.Draw(image)

    try:
        font = ImageFont.truetype("DejaVuSansMono.ttf", 11)
    except OSError:
        font = ImageFont.load_default()

    for idx, code in enumerate(codes):
        glyph = glyphs[code]
        col_idx = idx % columns
        row_idx = idx // columns

        x0 = margin + col_idx * cell_w
        y0 = margin + row_idx * cell_h + label_h

        # Draw light background box for glyph cell
        draw.rectangle(
            [x0 - 1, y0 - 1, x0 + glyph_w, y0 + glyph_h],
            outline="#E0E0E0",
            fill="#FAFAFA"
        )

        raw_bytes = glyph["bytes"]
        bytes_to_use = KNOWN_FIXES[code] if (fix_bugs and code in KNOWN_FIXES) else raw_bytes
        cols = get_glyph_columns(bytes_to_use, include_margins)

        # Draw the 5x8 (or 7x8) active-low dots
        for x, col_val in enumerate(cols):
            for y in range(8):
                bit = (7 - y) if msb_top else y
                if not (col_val & (1 << bit)):
                    px0 = x0 + x * scale
                    py0 = y0 + y * scale
                    draw.rectangle(
                        [px0, py0, px0 + scale - 1, py0 + scale - 1],
                        fill="black",
                    )

        label = SPECIAL_NAMES.get(code, glyph["label"])
        label_text = "%02X %s" % (code, label)
        if len(label_text) > 10:
            label_text = label_text[:10]
        draw.text(
            (x0, margin + row_idx * cell_h),
            label_text,
            fill="#990000" if (code in KNOWN_FIXES and not fix_bugs) else "black",
            font=font,
        )

    image.save(output)
    print("Wrote %s" % output)


def make_individual_pngs(glyphs, directory, scale=32, msb_top=False, include_margins=False, fix_bugs=False):
    """Write one PNG for each glyph."""
    if Image is None:
        raise SystemExit("Pillow is required for PNG output. Install with: pip install pillow")

    width_dots = 7 if include_margins else 5
    height_dots = 8

    directory = Path(directory)
    directory.mkdir(parents=True, exist_ok=True)

    for code in sorted(glyphs.keys()):
        image = Image.new("RGB", (width_dots * scale, height_dots * scale), "white")
        draw = ImageDraw.Draw(image)

        raw_bytes = glyphs[code]["bytes"]
        bytes_to_use = KNOWN_FIXES[code] if (fix_bugs and code in KNOWN_FIXES) else raw_bytes
        cols = get_glyph_columns(bytes_to_use, include_margins)

        for x, col_val in enumerate(cols):
            for y in range(8):
                bit = (7 - y) if msb_top else y
                if not (col_val & (1 << bit)):
                    px0 = x * scale
                    py0 = y * scale
                    draw.rectangle(
                        [px0, py0, px0 + scale - 1, py0 + scale - 1],
                        fill="black",
                    )

        image.save(directory / ("font_%02X.png" % code))

    print("Wrote individual glyphs to %s/" % directory)


def generate_corrected_asm(glyphs, output_path="corrected_table.asm"):
    """
    Generate an assembly file (.asm) containing the corrected 64-character table
    with clear annotations and references to the original ROM bytes.
    """
    lines = [
        "; =====================================================================",
        "; VZ200 Level II BASIC V2.0 - Corrected Printer Graphics Font Table",
        "; PRN_GFX_FONT (64 characters, 5 bytes per character, active-low columns)",
        "; =====================================================================",
        "; Known ROM typos patched in this table:",
        ";   - Char 0x18 ('X'): col 1 0xED -> 0xEB (restores horizontal symmetry)",
        ";   - Char 0x1F ('<-'): col 2 0xD6 -> 0xD5 (swaps rows 0 and 1 for vertical symmetry)",
        ";   - Char 0x23 ('#'): col 4 0xED -> 0xEB (swaps bits 1 & 2; rows 1 & 2 match 0 & 4)",
        ";   - Char 0x24 ('$'): cols 1 & 3 0xD6 -> 0xD5 (restores rotational symmetry)",
        ";   - Char 0x2A ('*'): col 0 0xD6 -> 0xD5 (restores symmetric star burst)",
        ";   - Char 0x2C (','): rows 0-2 blank, rows 3-7 match ';' (0x3B)",
        ";   - Char 0x33 ('3'): cols 1..3 0xBB -> 0xB6 (restores middle bar)",
        ";   - Char 0x35 ('5'): cols 2 & 3 0xDA -> 0xBA (fixes hex D vs B typo)",
        ";   - Char 0x3C ('<'): cols 3 & 4 0xDE -> 0xBE (fixes hex D vs B typo; restores rows 5 & 6)",
        ";   - Char 0x3E ('>'): cols 0 & 1 0xDE -> 0xBE (fixes hex D vs B typo; restores rows 5 & 6)",
        "; =====================================================================",
        "",
        "PRN_GFX_FONT_CORRECTED:",
    ]

    for code in sorted(glyphs.keys()):
        raw = glyphs[code]["bytes"]
        label = SPECIAL_NAMES.get(code, glyphs[code]["label"])
        if code in KNOWN_FIXES:
            fixed = KNOWN_FIXES[code]
            byte_str = ",".join(f"0x{b:02X}" for b in fixed)
            orig_str = ",".join(f"0x{b:02X}" for b in raw)
            lines.append(f"              DEFB  {byte_str} ; Char 0x{code:02X}: {label}  [FIXED: was {orig_str}]")
        else:
            byte_str = ",".join(f"0x{b:02X}" for b in raw)
            lines.append(f"              DEFB  {byte_str} ; Char 0x{code:02X}: {label}")

    content = "\n".join(lines) + "\n"
    Path(output_path).write_text(content, encoding="utf-8")
    print("Wrote corrected assembly table to %s" % output_path)


def main():
    parser = argparse.ArgumentParser(
        description="Render and patch the VZ200 ROM PRN_GFX_FONT (5 columns x 8 dots, active-low)."
    )
    parser.add_argument(
        "rom_source",
        help="VZ200 ROM assembly source containing PRN_GFX_FONT (e.g. level_II_basic_V2_VZ200.asm)",
    )
    parser.add_argument(
        "-o", "--output",
        default="vz200_printer_font.png",
        help="output PNG filename (default: vz200_printer_font.png)",
    )
    parser.add_argument(
        "--scale",
        type=int,
        default=12,
        help="pixels per printer dot in the generated PNG (default: 12)",
    )
    parser.add_argument(
        "--columns",
        type=int,
        default=8,
        help="number of glyph columns across the PNG sheet (default: 8)",
    )
    parser.add_argument(
        "--ascii",
        action="store_true",
        help="print the font as ASCII bitmaps in the console",
    )
    parser.add_argument(
        "--margins",
        action="store_true",
        help="include the 1-dot blank margins (0xFF) sent by the ROM printer routine (7x8 dots total)",
    )
    parser.add_argument(
        "--msb-top",
        action="store_true",
        help="render with MSB (bit 7) at top (warning: ROM font is LSB/bit 0 at top; MSB inverts glyphs)",
    )
    parser.add_argument(
        "--fix-bugs",
        action="store_true",
        help="patch known ROM typos (0x18 'X', 0x1F '<-', 0x23 '#', 0x24 '$', 0x2A '*', 0x2C ',', 0x33 '3', 0x35 '5', 0x3C '<', 0x3E '>')",
    )
    parser.add_argument(
        "--individual",
        metavar="DIRECTORY",
        help="also create one PNG per glyph in DIRECTORY",
    )
    parser.add_argument(
        "--gen-asm",
        nargs="?",
        const="corrected_table.asm",
        metavar="FILE",
        help="generate corrected assembly table to FILE (default: corrected_table.asm)",
    )

    args = parser.parse_args()

    glyphs = parse_font(args.rom_source)

    print("Parsed PRN_GFX_FONT: 64 glyphs x 5 columns")
    print("Glyph size: %s x 8 dots (active-low, %s at top)" % (
        "7" if args.margins else "5",
        "MSB (bit 7)" if args.msb_top else "LSB (bit 0)"
    ))
    if not args.fix_bugs:
        patched_names = ", ".join("0x%02X '%s'" % (k, SPECIAL_NAMES.get(k, glyphs[k]["label"].strip("'\""))) for k in sorted(KNOWN_FIXES.keys()))
        print("Note: Glyphs (%s) contain original ROM typos. Pass --fix-bugs to preview corrected glyphs." % patched_names)
    print()

    if args.ascii:
        print_ascii(glyphs, msb_top=args.msb_top, include_margins=args.margins, fix_bugs=args.fix_bugs)

    make_font_png(
        glyphs,
        args.output,
        scale=args.scale,
        columns=args.columns,
        msb_top=args.msb_top,
        include_margins=args.margins,
        fix_bugs=args.fix_bugs,
    )

    if args.individual:
        make_individual_pngs(
            glyphs,
            args.individual,
            scale=args.scale,
            msb_top=args.msb_top,
            include_margins=args.margins,
            fix_bugs=args.fix_bugs,
        )

    if args.gen_asm:
        generate_corrected_asm(glyphs, args.gen_asm)


if __name__ == "__main__":
    main()
