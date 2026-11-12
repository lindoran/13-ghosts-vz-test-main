# Benn Venn SD Loader target

`make sd` -> `prod/sd/13GHOSTS.VZ` (stub, loads/runs at D000) plus `13GHOST1.DAT`, `13GHOST2.DAT`,
`13GHOST3.DAT` (one per game part). Copy ALL of them to the SD card root, then `LOAD"13GHOSTS"`.
Build: `make sd`
**Also put `VZDOS.VZ` in the card root** (`make sd SD_DOS=/path/to/VZDOS.VZ` copies it to `prod/sd/`): VZDOS looks for it at every boot and prints `LOOKING FOR VZDOS.VZ` / `NOT FOUND` when it is missing.
Needs the VZDOS 2.32-style file API (5F00/5F03/5F09 jump table, as in VZDOS2_32_File_IO_Test).

## File size limit
The real loader cannot load a file larger than **31,200 bytes** from the SD. The build enforces it:
`make_sd.py` writes one file per game part (10,240 / 20,254 / 2,953 bytes now), cuts any part that
outgrows 60 sectors (30,720 bytes) into further files on a sector boundary, and aborts if any card
file would exceed 31,200. The stub opens each file in turn, so no single file ever exceeds the limit.

## How it works
* Ports as VZDOS itself uses them: **55 (37h)** = memory control (bit0: 1 = SRAM / 0 = DOS EPROM in
  4000-67FF, bit1 = SRAM bank); **58 (3Ah)** = RAM map, set by VZDOS at boot -- the stub never writes it.
  (v1 of the stub banked on port 58, which is why part 1 never appeared in the emulator.)
* The DOS runs either from its EPROM (port 55 = 00h) or, with `VZDOS.VZ` on the card, from SRAM bank 0
  (port 55 = 01h; VZDOS copies itself there at boot). The stub cannot read the port, so at start-up it
  probes: it writes the complement of the byte at 5FFF and reads it back (SRAM keeps it, the EPROM ignores
  it), restores the byte, and remembers which mapping the DOS is using. After each copy it puts exactly that
  mapping back, so the DOS that was running stays visible for every DOS call. Part 1 goes into SRAM bank 1
  (port 55 = 03h around each copy), so the DOS is never overwritten while it is reading, and the stub never
  swaps in a different DOS (an EPROM of another version can have a different $5F00 call table: in v2.1,
  $5F09 is rewind, not FAT_NextSector).
* Parts 2 and 3 go straight to their original addresses (7AE8-CA05, E420-EFA8): flat RAM.
* Before every OpenFile the stub resets the DOS sector destination (FB80) to F800 -- FAT_NextSector's copy
  target is pointed at the stub's staging buffer (D200), and if it is left there the next OpenFile reads the
  directory into the wrong buffer and reports "not found".
* Stub (D000), staging buffer (D200) and stack (below E400) sit in CA12-E411, which the game rebuilds at run time.
* Final step: port 55 = 03h (SRAM bank 1 = the game's 4000-67FF), `jp E420` (vz_boot). No game code changed.

## Tested Configuration
Tested on VZDOS firmware running in the VZ200 emulator SD Loader model with a folder card: `LOAD"13GHOSTS"` reaches
vz_boot with RAM byte-identical to every card file, under both the VZ200 ($9000) and VZ300 ($B800) RAM maps,
each with `VZDOS.VZ` on the card (DOS in SRAM) and without it (DOS in EPROM); the game then draws its title
screen. Also checked with an older EPROM (2.1) and VZDOS 2.32 on the card. Tested with a forced 15-sector chunk size (6 files, 4000-67FF
window split across two files) -- identical.

## NOT verified -- needs real hardware
1. The emulator cannot reproduce the real ~31,200-byte failure (its own cut-off is the DOS workspace at F800), so
   "no file over 31,200" is enforced by construction, not observed on hardware.
2. Port roles (55 = memory control, 58 = RAM map) come from VZDOS's own code, the emulator model and the
   CPLD source (VZ300.vhd, which decodes them the same way); the manual's table has them the other way round.
   If a real card misbehaves, check this first. The CPLD clears ports 55 and 58 on its RESET line, not on a
   `jp 0`, which the emulator does not model.
3. FAT_NextSector copying the sector it just read to (FB80) -- true in the emulator's run of the real firmware.
4. Real cards/clusters: emulator uses 512-byte clusters from a synthesized card; a Windows-formatted card with
   an MBR may hit the FAT-chain limitation documented in the emulator's SD_LOADER.md.
5. Not an RC39 setup: SD Loader RAM/10K window and RC39 RAM would fight on the bus.
6. High scores still not saved; calling the DOS from the game later needs the DOS (port 55 = 0) visible and
   F000-FEFF/F800 workspace kept clear of the game's tables.
