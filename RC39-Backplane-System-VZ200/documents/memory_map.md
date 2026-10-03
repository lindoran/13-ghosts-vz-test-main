# CPU-visible map

| CPU range | Size | What the CPU sees | Notes |
|-----------|-------|--------------------|--------|
| 0000–3FFF | 16K | ROM | Fixed, always ROM. |
| 4000–67FF | 10K | RAM or ROM | CFG10K=1 → RAM, CFG10K=0 → ROM (10K window).* |
| 6800–6FFF | 2K | MMIO | Memory-mapped I/O. |
| 7000–77FF | 2K | VRAM | Video RAM. |
| 7800–BFFF | 18K | Fixed RAM | “Fixed region” of RAM. |
| C000–FFFF | 16K | Bank window | Any one of 8×16K banks (b000–b111).** |

*The 10K window is controlled by setting bit 3 (the 4th bit) of the bank register at I/O port 0x70.

**Set the bank register by setting bits 0–2 on port 0x70. This selects one of eight 16K banks.

# 128K SRAM Banks and Overlaps

Each bank is a 16K slice of the 128K SRAM, selected by BA16..BA14 = bank number.  
The bank register is located at I/O range 0x70. Its bottom 3 bits (bits 0–2) select the bank number, and its 4th bit (bit 3) controls the 10K selectable ROM/RAM window.

Bank 1 appears in the 10K window when bit 3 is set. This allows the programmer to copy from the 10K ROM window into bank 1 by selecting bank 1 and then clearing bit 3 in the bank register. This exposes both the 10K of ROM space and the corresponding space in RAM at the same time. In this way, ROM data can be copied into RAM for modification.

Keep in mind that the top of bank 1, when viewed in the bank window at the top of memory, overlaps the bottom of the fixed bank. This is where the OS keeps its system environment and the stack, so you must be careful not to overwrite this region. This overlapping area corresponds to the last **2K** of the bank window (**F800–FFFF**).

| Bank | BA16..BA14 | Physical 128K slice | Where it can appear in CPU space | Overlap with fixed map |
|------|-------------|----------------------|----------------------------------|--------------------------|
| **0** | 000 | 00000–03FFF | C000–FFFF when bank=000 | No overlap with fixed RAM: bottom 16K is always ROM in CPU space. This is the default boot bank (bank register = 000). |
| **1** | 001 | 04000–07FFF | 4000–67FF (bottom 10K) when CFG10K=1 (RAM). C000–FFFF when bank=001 (full 16K). | Overlaps the 10K RAM/ROM window (4000–67FF) via its bottom 10K. Also overlaps the bottom 2K of the fixed region when viewed through the bank window, because its physical slice crosses where the fixed RAM lives in the 64K space. |
| **2** | 010 | 08000–0BFFF | 7800–BFFF fixed RAM maps into this physical slice.<br>- C000–FFFF when bank=010. | This bank overlaps essentially the entire fixed RAM region (7800–BFFF) except for the bottom 2K, which belong to the top of bank 1. |
| **3** | 011 | 0C000–0FFFF | C000–FFFF when bank=011 | This is the physical location of the bank window itself — no overlap with fixed RAM/ROM. |
| **4** | 100 | 10000–13FFF | C000–FFFF when bank=100 | In the top half of the 128K; no overlap with fixed regions. |
| **5** | 101 | 14000–17FFF | C000–FFFF when bank=101 | Top half, no fixed overlap. |
| **6** | 110 | 18000–1BFFF | C000–FFFF when bank=110 | Top half, no fixed overlap. |
| **7** | 111 | 1C000–1FFFF | C000–FFFF when bank=111 | Top half, no fixed overlap. |

# Bank Register Bit Fields

The bottom nibble of port 0x70 (minimally decoded to 0x70–0x7F) is the bank register. It is set as follows:

- **Bit 0**: Bank selection bit 0
- **Bit 1**: Bank selection bit 1
- **Bit 2**: Bank selection bit 2
- **Bit 3**: Enable/disable RAM selection in the 10K ROM/RAM window (1 = RAM, 0 = ROM)

# Key Constraints

- MMIO (6800–6FFF) and VRAM (7000–77FF) are never banked — no bank can “steal” those ranges.

- **Bank 0:** Only ever visible in the bank window; safe boot bank, no fixed-RAM overlap.

- **Bank 1:**
  - Bottom 10K → 4000–67FF when CFG10K=1 (RAM).
  - Full 16K → C000–FFFF when bank=001.
  - Overlaps the bottom 2K of fixed memory at F800–FFFF when selected via the bank window.

- **Bank 2:** Physically sits under the fixed RAM region (7800–BFFF). This covers the entire fixed region except for its bottom 2K (which belong to the top of Bank 1).

- **Bank 3:** Is the physical C000–FFFF slice — the bank window’s own “home”.


# The MMIO Section

To keep the system selection logic requirements simple for the original system, the designers used an overloaded memory range for both the keyboard and the output register. This minimally decoded memory range (0x6800–0x6FFF in the physical 64K memory address space) handles all low-level I/O.

### The Keyboard, Interrupt Flag, and Tape Input (Read)

When reading from the 0x6800–0x6FFF range, the data returned is a bit field representing the status of the keyboard matrix, the cassette input, and the video frame sync (interrupt) flag.

- **Bits 0–5**: Keyboard Matrix Columns. A bit is pulled low (0) if a key in the scanned row is pressed.
- **Bit 6**: Cassette Input. Represents the current signal level from the tape port.
- **Bit 7**: Interrupt / Frame Sync Flag. This bit indicates the status of the VDC (Video Display Controller) frame sync signal, which triggers the 50Hz/60Hz interrupt.

**Keyboard Scanning:**
The keyboard is scanned by pulling one of the eight least significant address lines (A0–A7) low. The resulting byte read from that address will have bits 0–5 set according to the keys pressed in that row.

| Row Address | A line | Bit 5 | Bit 4 | Bit 3 | Bit 2 | Bit 1 | Bit 0 |
|-------------|--------|-------|-------|-------|-------|-------|-------|
| **0x68FE**  | A0     | R     | Q     | E     | -     | W     | T     |
| **0x68FD**  | A1     | F     | A     | D     | CTRL  | S     | G     |
| **0x68FB**  | A2     | V     | Z     | C     | SHFT  | X     | B     |
| **0x68F7**  | A3     | 4     | 1     | 3     | -     | 2     | 5     |
| **0x68EF**  | A4     | M     | SPC   | ,     | -     | .     | N     |
| **0x68DF**  | A5     | 7     | 0     | 8     | -     | 9     | 6     |
| **0x68BF**  | A6     | U     | P     | I     | RETN  | O     | Y     |
| **0x687F**  | A7     | J     | ;     | K     | :     | L     | H     |

### The Output Bit-Field (Write)

Writing to the 0x6800–0x6FFF range updates a 6-bit latch (U1) that controls sound, tape output, and video modes.

- **Bit 0**: Speaker A (Piezo drive A)
- **Bit 1**: Cassette Out (LSB)
- **Bit 2**: Cassette Out (MSB)
- **Bit 3**: VDC Display Mode (0 = Text/Lo-res mixed mode, 1 = Hi-res graphics mode)
- **Bit 4**: VDC Background Colour (Mode dependent; e.g., Green/Orange or Green/Buff)
- **Bit 5**: Speaker B (Piezo drive B)

*Note: The speaker is driven in push-pull fashion using Bits 0 and 5. To produce a tone, these bits should be toggled alternately.*

