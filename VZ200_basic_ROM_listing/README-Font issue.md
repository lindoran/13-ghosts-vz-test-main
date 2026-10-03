# VZ200 Level II BASIC V2.0 - Printer Graphics Font (PRN_GFX_FONT)

This directory contains the disassembly, analysis, font renderer, and verified bug fixes for the **VZ200 Level II BASIC V2.0 ROM printer graphics character generator table** (`PRN_GFX_FONT`).

---

## 1. Background & ROM Architecture

The Dick Smith VZ200 / Video Technology Laser 200 series computers include an internal 5×7 (padded to 5×8) dot-matrix character generator table in their Level II BASIC ROM.

### Location & Usage
* **Routine:** `PRN_INV_CHAR` (ROM address `0x3C55` in `level_II_basic_V2_VZ200.asm` / `.lst`)
* **Font Table:** `PRN_GFX_FONT` (starts at line 10730 of `level_II_basic_V2_VZ200.asm`, right before `ERROR_MSG_OUTPUT`)
* **Total Characters:** 64 glyphs (ASCII codes `0x00`–`0x3F`: `@`, `A`–`Z`, `[`, `\`, `]`, `^`, `<-`, space, punctuation, and digits `0`–`9`)
* **Storage format:** Exactly **5 bytes per character**. Each byte represents **one vertical dot column** (column-major, left-to-right columns 0 through 4).

### Active-Low Dot-Matrix Representation
The VZ200 printer interface outputs active-low dots directly to bit-bang the printer port:
* **Bit = `0`**: Ink dot printed (`#`)
* **Bit = `1`**: Blank space (` `)
* **Bit orientation:**
  * `bit 0` (LSB) = Row 0 (top dot of character cell)
  * `bit 1`       = Row 1
  * `bit 2`       = Row 2
  * `bit 3`       = Row 3
  * `bit 4`       = Row 4
  * `bit 5`       = Row 5
  * `bit 6`       = Row 6 (bottom dot of uppercase glyph)
  * `bit 7` (MSB) = Row 7 (line spacing / descender margin; almost always `1`/blank)

### 7×8 Character Cell Framing
When the VZ200 outputs a character in `PRN_INV_CHAR`:
1. It sends an initial blank column margin (`0xFF`).
2. It sends the 5 character column bytes (`col 0` through `col 4`).
3. It sends a trailing blank column margin (`0xFF`).
This forms a clean 7-column wide by 8-dot high character cell on dot-matrix printer paper.

---

## 2. Known ROM Typos & Bitwise Fixes

The original 1982/1983 VZ200 Level II BASIC V2.0 ROM table was hand-entered from standard 5×7 dot-matrix tables (matching canonical GLCD / Adafruit GFX / SSD1306 definitions). During entry, nine characters suffered transcription errors / design flaws.

### Summary Table

| Code | Character | ROM Bytes | Corrected Bytes | Error Type | Visual Impact |
| :---: | :---: | :---: | :---: | :---: | :--- |
| `0x18` | `'X'` | `9C ED F7 EB 9C` | `9C EB F7 EB 9C` | Bit 1 vs 2 swap (`0xED` $\rightarrow$ `0xEB`) | Col 1 dot was misplaced in row 1 instead of row 2 |
| `0x1F` | `'<-'` | `F7 E3 D6 F7 F7` | `F7 E3 D5 F7 F7` | Bit 0 vs 1 swap (`0xD6` $\rightarrow$ `0xD5`) | Top arrowhead dot was in row 0 instead of row 1 |
| `0x23` | `'#'` | `EB 80 EB 80 ED` | `EB 80 EB 80 EB` | Bit 1 vs 2 swap (`0xED` $\rightarrow$ `0xEB`) | Col 4 dot placed in row 1 instead of row 2; broke top crossbar |
| `0x24` | `'$'` | `DB D6 80 D6 ED` | `DB D5 80 D5 ED` | Bit 0 vs 1 swap (`0xD6` $\rightarrow$ `0xD5`) | Cols 1 & 3 dots placed in row 0 instead of row 1 |
| `0x2A` | `'*'` | `D6 E3 80 E3 D5` | `D5 E3 80 E3 D5` | Bit 0 vs 1 swap (`0xD6` $\rightarrow$ `0xD5`) | Col 0 dot placed in row 0 instead of row 1 |
| `0x2C` | `','` | `DF C7 F7 FF FF` | `BF C7 E7 FF FF` | Clear rows 0–2 & copy `;` | Replaces awkward stub hook with clean descending comma tail from `;` (`0x3B`) |
| `0x33` | `'3'` | `DD BB BB BB C9` | `DD B6 B6 B6 C9` | `0xBB` $\rightarrow$ `0xB6` | Middle horizontal bar missing; bits misplaced |
| `0x35` | `'5'` | `D8 BA DA DA C6` | `D8 BA BA BA C6` | Hex `D` vs `B` (`0xDA` $\rightarrow$ `0xBA`) | Middle section corrupted |
| `0x3C` | `'<'` | `F7 EB DD DE DE` | `F7 EB DD BE BE` | Hex `D` vs `B` (`0xDE` $\rightarrow$ `0xBE`) | Cols 3 & 4 bit 5 vs 6: row 5 had 3 dots, row 6 blank |
| `0x3E` | `'>'` | `DE DE DD EB F7` | `BE BE DD EB F7` | Hex `D` vs `B` (`0xDE` $\rightarrow$ `0xBE`) | Cols 0 & 1 bit 5 vs 6: row 5 had 3 dots, row 6 blank |

---

### Detailed Bitwise Breakdown

#### 1. Char `0x18` ('X')
* **ROM:** `DEFB 0x9C, 0xED, 0xF7, 0xEB, 0x9C`
* **Col 1 (0xED):** `1110 1101` $\rightarrow$ dot at bit 1 (row 1), blank at bit 2 (row 2).
* **Col 3 (0xEB):** `1110 1011` $\rightarrow$ blank at bit 1 (row 1), dot at bit 2 (row 2).
* **Fix:** Col 1 becomes `0xEB`, making Col 1 mirror Col 3.
```
       ROM (0xED)              FIXED (0xEB)
b0  |#   #|                 |#   #|
b1  |##  #|  <-- misplaced  |#   #|
b2  |   # |  <-- missing    | # # |
b3  |  #  |                 |  #  |
b4  | # # |                 | # # |
b5  |#   #|                 |#   #|
b6  |#   #|                 |#   #|
b7  |     |                 |     |
```

#### 2. Char `0x1F` ('<-' left arrow)
* **ROM:** `DEFB 0xF7, 0xE3, 0xD6, 0xF7, 0xF7`
* **Col 2 (0xD6):** `1101 0110` $\rightarrow$ dot at bit 0 (row 0), blank at bit 1 (row 1).
* **Fixed (0xD5):** `1101 0101` $\rightarrow$ blank at bit 0 (row 0), dot at bit 1 (row 1).
* **Fix:** Col 2 becomes `0xD5`. Swapping row 0 and row 1 makes row 1 (`  #  `) mirror row 5 (`  #  `), restoring vertical symmetry around row 3.
```
       ROM (0xD6)              FIXED (0xD5)
b0  |  #  |  <-- misplaced  |     |
b1  |     |  <-- missing    |  #  |
b2  | #   |                 | #   |
b3  |#####|                 |#####|  <-- shaft
b4  | #   |                 | #   |
b5  |  #  |                 |  #  |
b6  |     |                 |     |
b7  |     |                 |     |
```

#### 3. Char `0x23` ('#')
* **ROM:** `DEFB 0xEB, 0x80, 0xEB, 0x80, 0xED`
* **Col 4 (0xED):** `1110 1101` $\rightarrow$ bit 1 was dot (`0`), bit 2 was blank (`1`).
* **Fix (0xEB):** `1110 1011` $\rightarrow$ bit 1 becomes blank (`1`), bit 2 becomes dot (`0`).
* **Visual Impact:** In the ROM, row 1 had an erroneous dot in column 4 (`| # ##|`), while row 2 missed its dot in column 4 (`|#### |`), leaving the top crossbar incomplete. Replacing col 4 with `0xEB` copies row 0 (`| # # |`) to row 1, and row 4 (`|#####|`) to row 2, completing both horizontal crossbars with 100% symmetry (`EB 80 EB 80 EB`).
```
       ROM (0xED)              FIXED (0xEB)
b0  | # # |                 | # # |
b1  | # ##|  <-- extra dot  | # # |  <-- matches row 0
b2  |#### |  <-- missing    |#####|  <-- matches row 4
b3  | # # |                 | # # |
b4  |#####|                 |#####|
b5  | # # |                 | # # |
b6  | # # |                 | # # |
b7  |     |                 |     |
```

#### 4. Char `0x24` ('$')
* **ROM:** `DEFB 0xDB, 0xD6, 0x80, 0xD6, 0xED`
* **Cols 1 & 3 (0xD6):** `1101 0110` $\rightarrow$ dot at bit 0 (row 0), blank at bit 1 (row 1).
* **Canonical 5x7 (0xD5):** `1101 0101` $\rightarrow$ blank at bit 0 (row 0), dot at bit 1 (row 1).
* **Fix:** Cols 1 & 3 become `0xD5`. Restores 180° rotational symmetry matching row 5 (`#### `) and row 6 (`  #  `).
```
       ROM (0xD6)              FIXED (0xD5)
b0  | ### |                 |  #  |  <-- top spine
b1  |  # #|  <-- missing    | ####|  <-- top curve
b2  |# #  |                 |# #  |
b3  | ### |                 | ### |
b4  |  # #|                 |  # #|
b5  |#### |                 |#### |  <-- bottom curve
b6  |  #  |                 |  #  |  <-- bottom spine
b7  |     |                 |     |
```

#### 5. Char `0x2A` ('*')
* **ROM:** `DEFB 0xD6, 0xE3, 0x80, 0xE3, 0xD5`
* **Col 0 (0xD6):** `1101 0110` $\rightarrow$ dot at bit 0 (row 0), blank at bit 1 (row 1).
* **Col 4 (0xD5):** `1101 0101` $\rightarrow$ blank at bit 0 (row 0), dot at bit 1 (row 1).
* **Fix:** Col 0 becomes `0xD5`, restoring bilateral horizontal & vertical symmetry.
```
       ROM (0xD6)              FIXED (0xD5)
b0  |# #  |  <-- misplaced  |  #  |
b1  |  # #|  <-- missing    |# # #|
b2  | ### |                 | ### |
b3  |#####|                 |#####|
b4  | ### |                 | ### |
b5  |# # #|                 |# # #|
b6  |  #  |                 |  #  |
b7  |     |                 |     |
```

#### 6. Char `0x2C` (',')
* **ROM:** `DEFB 0xDF, 0xC7, 0xF7, 0xFF, 0xFF`
* **Fix (`BF C7 E7 FF FF`):** The original ROM comma was a deformed hook spanning only rows 3–5 with no proper descender (`row 6` was blank). By clearing rows 0–2 (blank) and copying the exact comma shape from the lower portion of the semicolon (`;`, `0x3B`: rows 3–6), the comma gains a proper descender curving down to row 6.
```
       ROM                     FIXED (from ';')
b0  |     |                 |     |
b1  |     |                 |     |
b2  |     |                 |     |
b3  | ##  |                 | ##  |
b4  | #   |                 | ##  |
b5  |##   |                 | #   |
b6  |     |  <-- missing    |#    |  <-- descender tail
b7  |     |                 |     |
```

#### 7. Char `0x33` ('3')
* **ROM:** `DEFB 0xDD, 0xBB, 0xBB, 0xBB, 0xC9`
* **Cols 1..3 (0xBB):** `1011 1011` $\rightarrow$ bits 0 and 3 are `1` (blank), breaking the top and middle bars.
* **Fix (0xB6):** `1011 0110` $\rightarrow$ bits 0 and 3 are `0` (ink dots), matching the standard digit bars in '8' and '9'.
```
       ROM (0xBB)              FIXED (0xB6)
b0  | #   |                 |#####|
b1  |    #|                 |    #|
b2  |    #|                 |    #|
b3  | #   |                 | ####|
b4  |    #|                 |    #|
b5  |#   #|                 |#   #|
b6  | ### |                 | ### |
b7  |     |                 |     |
```

#### 8. Char `0x35` ('5')
* **ROM:** `DEFB 0xD8, 0xBA, 0xDA, 0xDA, 0xC6`
* **Cols 2 & 3 (0xDA):** `1101 1010` $\rightarrow$ hex entry error for `0xBA` (`1011 1010`).
* **Fix (0xBA):** Restores clean top bar and upper-left stem.
```
       ROM (0xDA)              FIXED (0xBA)
b0  |# ###|                 |#####|
b1  |#    |                 |#    |
b2  |#    |                 |#### |
b3  |  # #|                 |    #|
b4  |    #|                 |    #|
b5  |#   #|                 |#   #|
b6  | ### |                 | ### |
b7  |     |                 |     |
```

#### 9. Char `0x3C` ('<')
* **ROM:** `DEFB 0xF7, 0xEB, 0xDD, 0xDE, 0xDE`
* **Cols 3 & 4 (0xDE):** `1101 1110` $\rightarrow$ hex entry error for `0xBE` (`1011 1110`).
* **Fix (0xBE):** In `0xDE`, bit 5 was active-low (`0`) instead of bit 6 (`0`). This caused row 5 to contain three dots (`  ###`) instead of a single dot, while leaving row 6 completely empty. Correcting `0xDE` to `0xBE` restores bilateral vertical symmetry around row 3: row 5 becomes `  #  ` (mirroring row 1) and row 6 becomes `   ##` (mirroring row 0).
```
       ROM (0xDE)              FIXED (0xBE)
b0  |   ##|                 |   ##|
b1  |  #  |                 |  #  |
b2  | #   |                 | #   |
b3  |#    |                 |#    |
b4  | #   |                 | #   |
b5  |  ###|  <-- corrupted  |  #  |  <-- mirrors row 1
b6  |     |  <-- missing    |   ##|  <-- mirrors row 0
b7  |     |                 |     |
```

#### 10. Char `0x3E` ('>')
* **ROM:** `DEFB 0xDE, 0xDE, 0xDD, 0xEB, 0xF7`
* **Cols 0 & 1 (0xDE):** `1101 1110` $\rightarrow$ hex entry error for `0xBE` (`1011 1110`).
* **Fix (0xBE):** Symmetrical counterpart to `0x3C`. Correcting `0xDE` to `0xBE` in columns 0 and 1 fixes row 5 from `###  ` to `  #  ` and adds `##   ` to row 6.
```
       ROM (0xDE)              FIXED (0xBE)
b0  |##   |                 |##   |
b1  |  #  |                 |  #  |
b2  |   # |                 |   # |
b3  |    #|                 |    #|
b4  |   # |                 |   # |
b5  |###  |  <-- corrupted  |  #  |  <-- mirrors row 1
b6  |     |  <-- missing    |##   |  <-- mirrors row 0
b7  |     |                 |     |
```

---

## 3. Tool: `make_vz200_printer_font.py`

This script parses the ROM source, verifies the 64 glyphs, visualizes them in console ASCII or PNG sheets, and generates clean assembly listings.

### Usage Examples

1. **Dump ASCII bitmaps of all 64 characters with fixes applied:**
   ```bash
   python3 make_vz200_printer_font.py level_II_basic_V2_VZ200.asm --ascii --fix-bugs
   ```

2. **Render font sheet PNG with corrected characters:**
   ```bash
   python3 make_vz200_printer_font.py level_II_basic_V2_VZ200.asm -o vz200_printer_font.png --fix-bugs
   ```

3. **Render with hardware 7×8 printer cell framing (including 0xFF margins):**
   ```bash
   python3 make_vz200_printer_font.py level_II_basic_V2_VZ200.asm --margins --fix-bugs -o vz200_printer_font_margins.png
   ```

4. **Regenerate the corrected assembly table (`corrected_table.asm`):**
   ```bash
   python3 make_vz200_printer_font.py level_II_basic_V2_VZ200.asm --gen-asm
   ```

---

## 4. File Manifest

* **`level_II_basic_V2_VZ200.asm`**: Full VZ200 Level II BASIC V2.0 ROM assembly source. Original table at line 10730.
* **`level_II_basic_V2_VZ200.lst`**: Assembler listing with addresses and hex bytes.
* **`make_vz200_printer_font.py`**: Extraction, analysis, rendering, and patching script.
* **`corrected_table.asm`**: Ready-to-include drop-in assembly replacement for `PRN_GFX_FONT` with all 10 bugs/enhancements fixed.
* **`vz200_printer_font.png`**: High-resolution rendered bitmap sheet of all 64 glyphs with fixes applied.
* **`reference_rom.bin`**: Byte Copy of an actual VZ200 rom, when you compare the asembled listing the issue is present this is a bug in the actual os rom!
