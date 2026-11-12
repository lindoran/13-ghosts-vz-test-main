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
| `make standard` | `assets/ghost13_two_stage.wav` | normal-speed ROM-format tape (~476 s) |
| `make fast` | `prod/ghost13_fast.wav` | fast loader, normal phase: stock VZ200 and emulators (~103 s) |
| `make fast-inv` | `prod/ghost13_fast_inv.wav` | fast loader, inverted phase (`--fast-invert`): machines whose tape input inverts the signal, e.g. the RC39/HB200 homebrew (~103 s) |

Plain `make` builds all three. The fast tapes encode each part with
`vz2wav --fast --fast-vram` (`--fast-vram` is required here: parts 2 and 3 reach
above `0xC000`; override with `FAST_FLAGS=`). They need vz2wav 2.3 or later,
where the normal phase is the default. `make stage1` / `make parts` build
just one side. The emulator-ready part files (`.vz`) and the two distributable
fast tapes and all `.vz` emulator inputs (including the stage-one loader) are
in `prod/`; intermediate files and the standard-speed tape are in `assets/`.
`make clean` removes generated files from both locations and
cleans legacy root-level build outputs. `VZPACK`/`VZ2WAV`
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
| `tools/cmd_tools.py` | Parses TRS-80 TRSDOS `.cmd` load-module format, reassembles a flat memory image. Standalone; not part of the VZ200 build itself, but what originally produced `ghost13b.asm`'s source bytes. |
| `tools/disasm_cmds.py` | Takes `cmds/ghost13a.cmd` and `cmds/ghost13b.cmd`, verifies hashes, builds flat binaries, and runs `z80dasm` to produce `ghost13a.asm`, `ghost13b.asm`, `ghost13a.sym`, and `ghost13b.sym` matching reference disassemblies (`make disasm`). |
| `ghost13b.asm` | Full `z80dasm` disassembly of the original TRS-80 game (the un-protection-patched variant — see `PORTING_NOTES.md`). v8 uses it only to **recover the original bytes** (from its `;addr<TAB>bytes` comments); its instruction text is no longer assembled. |
| `port_13ghosts_v8.py` | **Current** porting script (patch in place; see above). Writes `prod/ghost13_p1/p2/p3.vz` for emulator tests, plus intermediate `.bin` files, `ghost13_hal.asm/.map`, and `ghost13_ram.bin` under `assets/`. |
| `hal_vz.asm` | The VZ200/RC39 replacement routines the patched game calls: boot, screen-table fill, video blit, the 3x5 text renderer (HUD, title credits), keyboard, sound. |
| `stage1.asm` | The bootstrap (12 bytes): bank 0 + RAM in the 4000-67FF window, then call the ROM's `TAPE_LOAD_COMMON` to load the next file. |
| `Makefile` | The build chain. `make` → `assets/ghost13_two_stage.wav`, `prod/ghost13_fast.wav`, and `prod/ghost13_fast_inv.wav` (stage1 + 3 parts each). |
| `splice_wav.py` | Concatenates the per-file WAVs into the final tape image. Generic — works for any number of same-format WAV segments. |
| `tools/gen_blit.py` | Regenerates the `vz_blit_frame` / `vz_blit_rows4` / `vz_build_blit_tables` block in `hal_vz.asm` (table-driven, 32-pair unrolled, ~22 ms/frame for the full screen; `vz_blit_rows4` draws only the bottom four character rows). The margin-wipe check at the top of both entry points lives here too: edit the generator, not the generated block, or the next run erases your change. Run from the repository root with `python3 tools/gen_blit.py`. |
| `tools/verify_blit.py` | Runs the new blit and a baseline build's original bit-twiddling blit on identical buffers in the Z80 emulator and compares VRAM byte for byte. Usage: `python3 tools/verify_blit.py [BASELINE_DIR]` (dir holding the old `ghost13_ram.bin` + `ghost13_hal.map`). |
| `tools/verify_hud3.py` | Runs the real `vz_boot` + `vz_draw_hud_row` in a Z80 emulator: checks the 3x5 font cache (all 64 glyphs) and the HUD (score, level name, level, ghosts) byte for byte against an independent render of `font_3x5.asm`, and exercises the game's own score-add routine (`0x5780`) to bound the score field. Writes `hud3_render.png`. |
| `tools/verify_title.py` | Runs the *real game* from its entry point to the title screen's final draw (`0x5396`) and checks credits page 1 against an independent render, then checks the margin wipe on the next blit. Writes `title_render.png`. |
| `tools/verify_credit_pages.py` | Runs the real title sequence (slide-in, final draw, the whole tune) and then the real idle wait: checks each credits page against an independent render, that the wait takes the same time as the original `sub_c9eeh` (within 1%) and returns the same flags, the key-pressed path, and the margin wipe. Writes `credit_pages_render.png`. |
| `tools/verify_win.py` | Runs the game's real win path (`0x568B`: screen 39, the HUD row template with the level name and the `*` winner marker) up to the patched copy at `0x56A7` and checks the 3x5 status row against an independent render of that template. Writes `win_render.png`. |
| `tools/verify_highscores.py` | Runs the real game to the title, then the game's own name-entry routine (keys fed from a queue; only the key wait, music and release-wait helpers are stubbed): checks the prompt and the three name slots after every keystroke, the 3-letter limit, three real insertions through the game's table-shift code (`0x5A49`), and the table screen against an independent render. Writes `highscores_render.png`. |
| `verify_gameover.py` | Runs the real game to the title, then replays the game-over sequence (`0x5A0C-0x5A3B`) with the game's own decode and summary routines for both halves of the skull flash; checks rows 44-55 against an independent semigraphics conversion, that nothing else in the playfield is touched, and the margin summary against an independent render. Writes `gameover_render.png`. |
| `tools/verify_margins.py` | Checks the HUD / credits margin cleanup: the gameplay blit must not wipe the HUD (no flicker); any other blit must wipe both margins; a pending credits wipe must still happen on the first gameplay blit. |

`tools/verify_font_cache.py` and `tools/verify_hud_render.py` test the old 8x8 font cache and HUD, which the 3x5 text renderer replaced; they no longer match the build.

**Generated, not checked in as source**: the Makefile keeps intermediate files in `assets/` (stage-one `.bin`/`.wav`, part `.bin`/`.wav`, HAL assembler outputs, RAM image, stamp, and fast/standard audio segments). `prod/` contains all `.vz` files and the distributable `ghost13_fast.wav` / `ghost13_fast_inv.wav`. Both directories are ignored by Git.

## Documentation

| File | Covers |
|---|---|
| `PORTING_NOTES.md` | Stage-1 findings: TRSDOS `.cmd` format, the `ghost13a`/`ghost13b` copy-protection-patch diff, entry point (`0x535A`), the external ROM/DOS call map. |
| `REAUDIT_v2.md` | The `0x7800` → `0x7AE8` relocation (ROM workspace collision + the CLOAD self-corruption bug it caused), the leftover-ROM-call reachability triage, and the toolchain verification (real `z88dk-z80asm`/`vzpack`/`vz2wav` vs. the `pasmo` stand-in). |
| `STAGE1_NOTES.md` | The bank 1 / bank 2 memory-aliasing hazard (from the RC39 `memory_map.md`), why the two-stage load fixes it, and the ROM-code-level emulator verification (all 8 boot-time bank states, real `TAPE_LOAD_COMMON`). |
| `PROGRESS.md` | Overall project log through the v2/v3 relocation and re-audit work. **Predates** the bank-aliasing fix and the font-cache work below — treat `STAGE1_NOTES.md` and this README as the more current sources for anything that conflicts. |
| `texmode-issues.md` | Your own doc on the text-mode/HUD rendering gap (semigraphics-only blitter drops ordinary text) and the original 8x8 `PRN_GFX_FONT` tile-cache plan. **Superseded** by the 3x5 renderer below (see "Text rendering"): the 8x8 cache and its HUD are gone. |
| `font-asset-research/` | The 3x5 bitmap font (`font_3x5.asm`, CC0, 64 glyphs x 2 bytes) the build now uses, plus the research that produced it. Ordinal 0x1F (`_`) was a copy of `<` and is fixed here. |

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

* text is drawn with the 3x5 font (see "Text rendering" below), not the VZ200 ROM
  font: the ROM table has 17 bad bytes in 10 glyphs, and an 8x8 cell only gives a
  16-character line;
* the first port inverted the sense of the any-key poll (`vz_check_fire`), which
  turned every wait-for-key loop inside out; it now returns NZ when any key
  is down, like the original;
* the original `push bc` before the video copy at `5577h` has to be kept
  (`vz_blit_site1`), because `5583h` pops it again.

Memory map after loading, original addresses unless noted: `4000` stub,
`4050-51FF` screens C, `5200-644A` game, `644B-67FF` screens A, `6800-77FF` VZ200
I/O + video RAM, `7AE8` stub, `7AF0-886B` screens B, `886C-CA05` game,
`CA12-E411` game buffers/table (runtime), `E420` replacement routines, `F400`
3x5 font cache (320 bytes), `F540` name-entry buffer (15 bytes), `F600-FBFF`
blit lookup tables (6 pages), stack from `FFFF`.

## Text rendering (3x5 font)

The semigraphics blitter (`vz_blit_frame`) only draws cells with bit 7 set, so the
game's ordinary text is drawn separately by `vz_draw3` / `vz_puts3` in
`hal_vz.asm`.  A glyph is 3 pixels of ink plus a blank column = 4 pixels = exactly
one byte in Mode 1, so every glyph row is one byte, every cell is byte-aligned
(no shifting) and a 128-pixel line holds **32 cells** (the old 8x8 font held 16).
The glyphs are stored packed (128 bytes) and expanded at boot into a 320-byte
cache at `F400h` (`vz_build_font3`).  The font has no lower case; `vz_draw3`
upper-cases.

| Where | What | How |
|---|---|---|
| Top margin (rows 0-7, ink rows 2-6, cells 7-23) | The 17-character level-name field of the game's HUD row (`DDE8h`), exactly as the game holds it, no label | `vz_draw_hud_row`, called from `vz_blit_site1` every gameplay frame |
| Bottom margin (rows 56-63, ink rows 57-61) | `SCORE ddddddddd LEVEL dd GH dd`: the whole 9-character score field (cols 8-16, the ones digit is never incremented), level, ghosts | same |
| Game over (top margin row 2, bottom margin row 57) | `FINAL SCORE ddddddddd` above the skull, `LEVEL dd  GHOSTS dd` below it, read from the buffer the game's `sub_5B6D` fills in. The skull's lower rows (12-15) are drawn by `vz_blit_rows4` | `vz_gameover_blit`, patched in at `0x5BA2` (replaces the copy to `3F00h`) |
| Win screen (screen 39) | The game's HUD row template (`61D5h`) as the usual two margin lines: level name `13 GHOSTS` on top, `SCORE *dddddddd LEVEL dd GH dd` below (the `*` is the winner marker the game puts in the first character of the score field) | `vz_win_row`, patched in at `0x56A7` (replaces the copy to `3FC0h`); shares `vz_hud_from_ix` with the gameplay HUD |
| Name entry (screen 37), rows 41-53 | `TYPE YOUR NAME, THEN RETURN` and three slots (`AB_`); names are **3 letters** now | `vz_name_cursor`, patched in at `0x5B31`; the typed name lives in `NAME_BUF` (`F540h`) instead of TRS-80 video RAM `3EE9h` (`0x5B2E`, `0x5AAF`, limit at `0x5B5B`) |
| High-score table (screen 38), rows 33-61 | Two columns of five lines, `rr nnn ssssssss` (rank, first 3 name characters, low 8 of the score field's 9 characters; a score of 100,000,000 or more, which should be unreachable, shows ` BUSTER!` instead; the game's `*` winner marker is drawn in the first blank cell of the score), 2-cell gutter; the screen's header underline (row 38) is cleared | `vz_hs_blit`, patched in at `0x5AFD` (inside `sub_5AE1`, used both after name entry and from the attract loop) |
| Title credits (rows 41-63, under the logo) | The full original credit text as **three pages** of up to three centred lines: page 1 after the slide-in (through the tune), page 2 when the idle wait for a key starts, page 3 after that wait's first pass (~2.8 s). The music engine is cycle-counted and is not touched; nothing is drawn while it plays | `vz_title_draw`, patched in at `0x5396` (the title's final static draw), and `vz_title_wait`, patched in at `0x53FF` in place of `call sub_c9eeh` (same polls, same ~5.6 s, same return convention) |

The HUD and credits live in the 8-row margins above and below the 48-row
playfield, which the screen blit never touches, so they would stay on screen
after the game moves on.  `vz_margin_dirty` handles that: `vz_draw_hud_row` sets
bit 1, `vz_title_draw` and `vz_gameover_blit` set bit 0, and the next `vz_blit_frame` that is **not**
the gameplay one (game over, demo end, any other screen) wipes both margins
first.  `vz_blit_site1` drops the HUD bit before each gameplay blit so the HUD is
never wiped (and flickers) mid-game, but leaves the credits bit so the first
gameplay frame removes the title credits.  `tools/verify_margins.py` checks this.

Game over: `sub_5B6D` writes `Final Score` (row 12, cols 2-12), the 9-character score (row 13, cols 3-11), `Ghost:  n` (row 12, cols 50-58) and `Level:  n` (row 13, cols 50-58) into rows 12-13 of buffer 0, then copies rows 12-15 to the screen.  The loop at `0x5A12` runs ten times, alternating the skull with the GAME OVER banner (screen 35) and the plain skull (screen 1E).  Only those four rows are redrawn each time; the rows above keep the last animation frame (screen 1D).

Not covered yet (all character-mode text the semigraphics blitter drops, or
direct TRS-80 video RAM access):
* name entry has no backspace: any control character restarts the entry (the
  game's own behaviour), so a typo means starting over;
* the start-of-game HUD row is written straight to `3FC0h` at `0x56A7`
  (not patched).

The TRSDOS high-score file is not saved.  Real hardware has not been tried.

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
