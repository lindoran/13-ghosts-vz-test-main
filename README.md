# 13 Ghosts — TRS-80 → VZ200 Port

Porting the 1982 TRS-80 game *13 Ghosts* (Software Affair) to the VZ200 /
RC39 Backplane Clone (Z80, MC6847 Mode 1). This README is a map of the
repository — what's current, what's historical, and how to build the
final tape image.

## Architecture (v8: patch in place, do not relocate)

The game stays **byte for byte at its original TRS-80 addresses**
(`0x5200-0xCA05`).  `port_13ghosts_v8.py` rebuilds the original binary from
`ghost13b.asm`, patches about 25 TRS-80-specific instructions in place (video
copies, keyboard, sound, TRSDOS) so they call into `hal_vz.asm` (the VZ200/RC39
replacement routines), and writes three tape files.  Nothing else changes.

Earlier versions (v1-v7, now in `archive/`) disassembled the binary, shifted it
to `0x7AE8` and re-assembled it with symbolic labels.  That cannot work reliably
from a linear disassembly: level data was relocated as if it were code, byte
pairs used as opcodes by the day/night patch were relocated as if they were
addresses, and the animation/sprite tables - which hold absolute TRS-80
addresses - could not be relocated at all.  Keeping the original addresses
removes that whole class of bugs.

The one thing that has to move is the block of 34 compressed screens
(`0x644B-0x886B`): it sits exactly on the VZ200's I/O + video RAM
(`0x6800-0x77FF`).  The screens are position-independent (the game finds them
through a table it builds at start-up), so the patcher splits them into pieces
that fit the free RAM and the table is filled from a generated list instead
of by the game's scan.  See the docstring of `port_13ghosts_v8.py` for the map.

The tape has **four files**: `stage1` (forces bank 0 + 10K RAM window, loads the
next file through the VZ200 ROM loader), part 1 (`0x4000-0x67FF`), part 2
(`0x7AE8-0xCA05`), part 3 (`0xE420`, the replacement routines; its start address
`vz_boot` jumps into the game).  Parts 1 and 2 begin with an 8-byte stub that
loads the following file.  Their WAVs are concatenated into one tape.

## Quick start

```
make VZPACK=/path/to/vzpack VZ2WAV=/path/to/vz2wav
```

Produces three tapes, all with the same stage 1 and the same three parts:

| Target | File | Use |
|---|---|---|
| `make standard` | `ghost13_two_stage.wav` | normal-speed ROM-format tape (~476 s) |
| `make fast` | `ghost13_fast.wav` | fast loader, normal phase: stock VZ200 and emulators (~103 s) |
| `make fast-inv` | `ghost13_fast_inv.wav` | fast loader, inverted phase (`--fast-invert`): machines whose tape input inverts the signal, e.g. the RC39/HB200 homebrew (~103 s) |

Plain `make` builds all three. The fast tapes encode each part with
`vz2wav --fast --fast-vram` (`--fast-vram` is required here: parts 2 and 3 reach
above `0xC000`; override with `FAST_FLAGS=`). They need vz2wav 2.3 or later,
where the normal phase is the default. `make stage1` / `make parts` build
just one side; `make clean` removes all generated output. `VZPACK`/`VZ2WAV`
default to the paths in the `Makefile`; override them if yours live
elsewhere.

Needs one of `z88dk-z80asm` (preferred) or `pasmo` on `PATH` for
assembly — both have been verified to produce byte-identical output
for this source.

---

## Controls (VZ200 keyboard)

| Key | Action |
|---|---|
| `W` / `A` / `S` / `D` | up / left / down / right |
| `Space` | fire |
| `T` | toggle sound on/off (one toggle per press; holding the key does not flip it again) |
| `Ctrl`+`Q` | restart: back to the title screen (the TRS-80's Clear+Break chord; `Q` alone does nothing) |
| `Return` | enter |

`T` is polled only during a real game, the same place the original polled its `S`/`T`
sound keys. Pressing it while the demo is running just starts a game and does not also
toggle the sound. The original TRS-80 `S` (off) / `T` (on) pair is gone: `S` is now Down,
so it can no longer mute the game by accident. The extra direction keys (`X`, `Z`, `M`,
`,`, `.`) are no longer read.

## Current pipeline (what the build actually uses)

| File | What it is |
|---|---|
| `cmd_tools.py` | Parses TRS-80 TRSDOS `.cmd` load-module format, reassembles a flat memory image. Standalone; not part of the VZ200 build itself, but what originally produced `ghost13b.asm`'s source bytes. |
| `ghost13b.asm` | Full `z80dasm` disassembly of the original TRS-80 game (the un-protection-patched variant — see `PORTING_NOTES.md`). v8 uses it only to **recover the original bytes** (from its `;addr<TAB>bytes` comments); its instruction text is no longer assembled. |
| `port_13ghosts_v8.py` | **Current** porting script (patch in place; see above). Writes `ghost13_p1/p2/p3.vz` (+ `.bin`), `ghost13_hal.asm/.map`, and `ghost13_ram.bin` (flat 64K image of everything loaded, for emulator tests). |
| `hal_vz.asm` | The VZ200/RC39 replacement routines the patched game calls: boot, screen-table fill, video blit + HUD, keyboard, sound, font tile cache. |
| `stage1.asm` | The bootstrap (12 bytes): bank 0 + RAM in the 4000-67FF window, then call the ROM's `TAPE_LOAD_COMMON` to load the next file. |
| `Makefile` | The build chain. `make` → `ghost13_two_stage.wav`, `ghost13_fast.wav`, `ghost13_fast_inv.wav` (stage1 + 3 parts each). |
| `splice_wav.py` | Concatenates the per-file WAVs into the final tape image. Generic — works for any number of same-format WAV segments. |
| `gen_blit.py` | Regenerates the `vz_blit_frame` / `vz_build_blit_tables` block in `hal_vz.asm` (table-driven, 32-pair unrolled, ~22 ms/frame). Edit the generator, not the generated block. |
| `verify_blit.py` | Runs the new blit and a baseline build's original bit-twiddling blit on identical buffers in the Z80 emulator and compares VRAM byte for byte. Usage: `verify_blit.py [BASELINE_DIR]` (dir holding the old `ghost13_ram.bin` + `ghost13_hal.map`). |
| `verify_font_cache.py` | Runs the real `vz_boot` in a Z80 emulator with the ROM font poisoned and checks the tile cache against an independent conversion of the corrected font table. |

**Generated, not checked in as source** (produced by the Makefile — listed here so the names are recognizable if you see them on disk): `stage1.bin`/`.vz`/`.wav`, `ghost13_p*.bin`/`.vz`/`.wav`, `ghost13_hal.*`, `ghost13_ram.bin`, `ghost13_two_stage.wav`, `ghost13_fast.wav`, `ghost13_fast_inv.wav`, `ghost13_p*_fast*.wav`, `*.o`.

## Documentation

| File | Covers |
|---|---|
| `PORTING_NOTES.md` | Stage-1 findings: TRSDOS `.cmd` format, the `ghost13a`/`ghost13b` copy-protection-patch diff, entry point (`0x535A`), the external ROM/DOS call map. |
| `REAUDIT_v2.md` | The `0x7800` → `0x7AE8` relocation (ROM workspace collision + the CLOAD self-corruption bug it caused), the leftover-ROM-call reachability triage, and the toolchain verification (real `z88dk-z80asm`/`vzpack`/`vz2wav` vs. the `pasmo` stand-in). |
| `STAGE1_NOTES.md` | The bank 1 / bank 2 memory-aliasing hazard (from the RC39 `memory_map.md`), why the two-stage load fixes it, and the ROM-code-level emulator verification (all 8 boot-time bank states, real `TAPE_LOAD_COMMON`). |
| `PROGRESS.md` | Overall project log through the v2/v3 relocation and re-audit work. **Predates** the bank-aliasing fix and the font-cache work below — treat `STAGE1_NOTES.md` and this README as the more current sources for anything that conflicts. |
| `texmode-issues.md` | Your own doc on the text-mode/HUD rendering gap (semigraphics-only blitter drops ordinary text) and the `PRN_GFX_FONT` tile-cache plan. The cache itself (`vz_build_font_cache` etc.) is implemented in `hal_vz.asm` and emulator-verified against that plan; the actual HUD *renderer* described in this doc's later sections is still open. |

## Reference material (not part of this repo — inputs from elsewhere)

- `export.lst` — full disassembly of the VZ200 BASIC ROM. Load-bearing reference for nearly everything above the CMD-parsing stage: the RST-vector/DCB workspace layout, `TAPE_LOAD_COMMON` and everything it calls, `PRN_GFX_FONT`, keyboard matrix addresses. Extracted as a raw 16K ROM binary (parser handles the listing's primary + continuation hex-dump lines) for the emulator verification in `STAGE1_NOTES.md`.
- `RC39-Backplane-System-for-VZ200-main/` (your repo) — `documents/memory_map.md` and the Banking/Decode GAL CUPL sources are what `REAUDIT_v2.md` and `STAGE1_NOTES.md` verify against. Not duplicated here; refer to your own copy.
- `vz2wav-decompile-main/` (your repo) — source for `vzpack`/`vz2wav`/`wav2vz`. `dist/linux.zip` has working prebuilt x86-64 binaries despite the `ia64-linux` directory name.
- `z88dk-master.zip` — source for `z88dk-z80asm`. Needs 4 git submodules (`uthash`, `optparse`, `regex`, `UNIXem`) that a plain GitHub zip download doesn't include.

## What the patcher changes (and how to check it)

`python3 port_13ghosts_v8.py` prints every patched site with the original and
new bytes; each patch is asserted against the expected original bytes, the
untouched game bytes are checked identical to the original, and every moved
screen is decompressed from its new address and compared with the original
decode.  Patches: 5 video-RAM copies (`3C00h`), 5 keyboard reads (`3840h`,
`3804h`, and the any-key poll at `C9FD`), 4 sound `out` instructions plus the 4
stores that used to poke the port number into them, the TRSDOS high-score
read/write bypasses, and the screen-table builder (`C750`).

Fixes this design made unnecessary or that were found along the way:

* the VZ200 ROM font table has 17 bad bytes in 10 glyphs; the corrected table
  (`VZ200_basic_ROM_listing/corrected_table.asm`) is built into `hal_vz.asm`
  and the 1 KB tile cache at `F400h` is made from it (`verify_font_cache.py`);
* the first port inverted the sense of the any-key poll (`vz_check_fire`), which
  turned every wait-for-key loop inside out; it now returns NZ when any key
  is down, like the original;
* the original `push bc` before the video copy at `5577h` has to be kept
  (`vz_blit_site1`), because `5583h` pops it again.

Memory map after loading, original addresses unless noted: `4000` stub,
`4050-51FF` screens C, `5200-644A` game, `644B-67FF` screens A, `6800-77FF` VZ200
I/O + video RAM, `7AE8` stub, `7AF0-886B` screens B, `886C-CA05` game,
`CA12-E411` game buffers/table (runtime), `E420` replacement routines, `F400`
tile cache, stack from `FFFF`.

Not covered: the high-score name entry reads/writes the TRS-80 video RAM at
`3Exx/3Fxx` directly (not patched), and the TRSDOS high-score file is not
saved.  Real hardware has not been tried.

## Superseded — moved to `archive/`

`port_13ghosts_v7.py` (the last relocating version) and older scripts are kept for reference only.

Kept only as a record of how the design evolved; the `Makefile` doesn't
reference any of these, and each was replaced for a specific,
documented reason:

| File | Superseded by | Why |
|---|---|---|
| `archive/port_13ghosts.py` | `_v2` | Hardcoded `org 0x7800` — collides with the ROM's RST-vector/DCB workspace and corrupts CLOAD's own hand-off address. See `REAUDIT_v2.md` §"Critical bug." |
| `archive/port_13ghosts_v2.py` | `_v3` | Fixed the org, but predates the bank-aliasing discovery — no runtime bank handling at all. |
| `archive/port_13ghosts_v3.py` | `_v4` | Added an 8-way runtime bank probe to handle the RC39's undefined boot-time bank state. Made unnecessary once the two-stage load deterministically forces bank 0 before stage 2 ever loads — `_v4` removes it (and the ~48 bytes it cost). |
| `archive/ghost13a.asm`/`.bin`/`.sym` | *(reference only)* | The copy-protection-patched TRS-80 variant, not the one the VZ200 build is based on (`ghost13b`). Kept only per `PORTING_NOTES.md`'s a/b diff record, not used downstream. |
| `archive/Makefile.fixed` | current `Makefile` | Intermediate fix for the org-address bug, predates the two-stage load entirely (no `stage1`/splice rules). |
