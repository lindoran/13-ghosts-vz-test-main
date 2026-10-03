# VZ200 Key Matrix and Mapping

The VZ200 keyboard matrix is minimally decoded, using address bits A0–A7 to select the row being scanned. This document describes the mapping between the physical VZ200 matrix and the PC scan codes used by the simulator.

## VZ200 Keyboard Matrix

Each row is selected by pulling a specific address line low. The resulting 6-bit value (bits 0–5) represents the columns in that row.

**Note:**
- `CTRL` = Control
- `SHFT` / `SHIFT` = Shift
- `RETN` / `RETRN` = Return
- `SPC` = Space
- `NC` = No key assigned

### Character Matrix

| Row Address (LSB) | Bit 5 | Bit 4 | Bit 3 | Bit 2 | Bit 1 | Bit 0 |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **0xFE** (A0) | R | Q | E | - | W | T |
| **0xFD** (A1) | F | A | D | CTRL | S | G |
| **0xFB** (A2) | V | Z | C | SHFT | X | B |
| **0xF7** (A3) | 4 | 1 | 3 | - | 2 | 5 |
| **0xEF** (A4) | M | SPC | , | - | . | N |
| **0xDF** (A5) | 7 | 0 | 8 | - | 9 | 6 |
| **0xBF** (A6) | U | P | I | RETN | O | Y |
| **0x7F** (A7) | J | ; | K | : | L | H |

### PC Scan Code Matrix (Hex)

The following table shows the internal scan codes assigned to each position in the matrix.

| Row Address (LSB) | Bit 5 | Bit 4 | Bit 3 | Bit 2 | Bit 1 | Bit 0 |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **0xFE** | 0x15 | 0x14 | 0x08 | - | 0x1A | 0x17 |
| **0xFD** | 0x09 | 0x04 | 0x07 | CTRL | 0x16 | 0x0A |
| **0xFB** | 0x19 | 0x1D | 0x06 | SHFT | 0x1B | 0x05 |
| **0xF7** | 0x21 | 0x1E | 0x20 | - | 0x1F | 0x22 |
| **0xEF** | 0x10 | 0x2C | 0x36 | - | 0x37 | 0x11 |
| **0xDF** | 0x24 | 0x27 | 0x25 | 0x2D | 0x26 | 0x23 |
| **0xBF** | 0x18 | 0x13 | 0x0C | 0x28 | 0x12 | 0x1C |
| **0x7F** | 0x0D | 0x33 | 0x0E | 0x34 | 0x0F | 0x0B |

## Modifier Key Handling

Modifier keys on the PC keyboard are mapped to the VZ200 `SHIFT` and `CTRL` keys as follows:

- **SHIFT**: Both `LSHIFT` (0x02) and `RSHIFT` (0x20) map to VZ200 `SHIFT`.
- **CTRL**: Both `LCTRL` (0x01) and `RCTRL` (0x10) map to VZ200 `CTRL`.
- **Special Case**: Since `:` and `;` share a key on PC keyboards, the VZ200 `:` is mapped to the PC `'` (apostrophe) key.

## Arrow Keys and Backspace/Delete Handling

The VZ200 does not have dedicated arrow or delete keys. These are emulated by the Arduino firmware (`vziosim_usb.ino`) using `CTRL` combinations.

| PC Keyboard Key | VZ200 Equivalent |
| :--- | :--- |
| **Left Arrow** (0x50) | `CTRL` + `M` |
| **Right Arrow** (0x4F) | `CTRL` + `,` (comma) |
| **Up Arrow** (0x52) | `CTRL` + `.` (period) |
| **Down Arrow** (0x51) | `CTRL` + `SPC` (space) |
| **Delete** (0x4C) | `CTRL` + `;` (RUBOUT) |
| **Backspace** (0x2A) | `CTRL` + `M` |

### Smart CTRL Management
To allow seamless navigation, the simulator firmware manages the `CTRL` key state automatically:
- Pressing any emulated key (arrows or delete) activates `CTRL`.
- `CTRL` remains active as long as at least one emulated key is held down.
- `CTRL` is only released when **all** emulated keys are released.

### How the simulator is different
The simulator mimics individual row scans and the full-scan behavior (address 0x6800) used by the BIOS to detect key presence. However, it does not simulate the physical logic for all possible address bit combinations (e.g., pulling only two lines low), nor does it produce electrical artifacts like ghosted or blocked keys. Supporting full hardware-accurate behavior would require calculating and updating the entire 256-entry address map on every key event. So far, tested software performs correctly with the current implementation.
