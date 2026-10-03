# 13 Ghosts — TRS-80 → VZ200 Port

Porting the 1982 TRS-80 game *13 Ghosts* (Software Affair) to the VZ200 /
RC39 Backplane Clone (Z80, MC6847 Mode 1). This README is a map of the
repository — what's current, what's historical, and how to build the
final tape image.

## Architecture, in one paragraph

The game is disassembled TRS-80 Z80 code with a hand-written VZ200
hardware-abstraction layer (video blit, keyboard, sound, font cache)
appended to it, patched and reassembled to run at `0x7AE8`. It loads in
**two stages** over cassette: a tiny bootstrap (`stage1`) loads first,
forces the RC39's bank register to bank 0 (the only bank with no memory
aliasing hazards — see `STAGE1_NOTES.md`), then calls back into the
VZ200 ROM's own tape loader to load the game itself. The two stages are
packed and encoded separately, then their WAV audio is concatenated
into one continuous tape image.

## Quick start

```
make VZPACK=/path/to/vzpack VZ2WAV=/path/to/vz2wav
```

Produces `ghost13_two_stage.wav` — the file to actually load on
hardware or an emulator. `make stage1` / `make stage2` build just one
side; `make clean` removes all generated output. `VZPACK`/`VZ2WAV`
default to the paths in the `Makefile`; override them if yours live
elsewhere.

Needs one of `z88dk-z80asm` (preferred) or `pasmo` on `PATH` for
assembly — both have been verified to produce byte-identical output
for this source.

---

## Current pipeline (what the build actually uses)

| File | What it is |
|---|---|
| `cmd_tools.py` | Parses TRS-80 TRSDOS `.cmd` load-module format, reassembles a flat memory image. Standalone; not part of the VZ200 build itself, but what originally produced `ghost13b.asm`'s source bytes. |
| `ghost13b.asm` | Full `z80dasm` disassembly of the original TRS-80 game (the un-protection-patched variant — see `PORTING_NOTES.md`). This is the **input** `port_13ghosts_v4.py` patches into the VZ200 build. |
| `port_13ghosts_v4.py` | **Current** porting script. Patches `ghost13b.asm` (buffer remaps, keyboard/sound HAL calls, TRSDOS bypasses, font-cache init) into `ghost13_vz.asm`, assembles it, and (when it can find real `vzpack`/`vz2wav` at the hardcoded paths) packs and encodes it too — the `Makefile` rules are what's authoritative, this is a convenience for running the script directly. |
| `stage1.asm` | The two-stage-load bootstrap (11 bytes): force bank 0, call the ROM's `TAPE_LOAD_COMMON` to load stage 2. |
| `Makefile` | The build chain. `make` → `ghost13_two_stage.wav`. |
| `splice_wav.py` | Concatenates stage1.wav + stage2.wav into the final tape image. Generic — works for any number of same-format WAV segments. |

**Generated, not checked in as source** (produced by the Makefile — listed here so the names are recognizable if you see them on disk): `ghost13_vz.asm`, `stage1.bin`/`.vz`/`.wav`, `ghost13_vz.bin`/`.vz`/`.wav`, `ghost13_two_stage.wav`, `*.sym`, `*.o`.

## Documentation

| File | Covers |
|---|---|
| `PORTING_NOTES.md` | Stage-1 findings: TRSDOS `.cmd` format, the `ghost13a`/`ghost13b` copy-protection-patch diff, entry point (`0x535A`), the external ROM/DOS call map. |
| `REAUDIT_v2.md` | The `0x7800` → `0x7AE8` relocation (ROM workspace collision + the CLOAD self-corruption bug it caused), the leftover-ROM-call reachability triage, and the toolchain verification (real `z88dk-z80asm`/`vzpack`/`vz2wav` vs. the `pasmo` stand-in). |
| `STAGE1_NOTES.md` | The bank 1 / bank 2 memory-aliasing hazard (from the RC39 `memory_map.md`), why the two-stage load fixes it, and the ROM-code-level emulator verification (all 8 boot-time bank states, real `TAPE_LOAD_COMMON`). |
| `PROGRESS.md` | Overall project log through the v2/v3 relocation and re-audit work. **Predates** the bank-aliasing fix and the font-cache work below — treat `STAGE1_NOTES.md` and this README as the more current sources for anything that conflicts. |
| `texmode-issues.md` | Your own doc on the text-mode/HUD rendering gap (semigraphics-only blitter drops ordinary text) and the `PRN_GFX_FONT` tile-cache plan. The cache itself (`vz_build_font_cache` etc.) is implemented in `port_13ghosts_v4.py`'s HAL section and emulator-verified against that plan; the actual HUD *renderer* described in this doc's later sections is still open. |

## Reference material (not part of this repo — inputs from elsewhere)

- `export.lst` — full disassembly of the VZ200 BASIC ROM. Load-bearing reference for nearly everything above the CMD-parsing stage: the RST-vector/DCB workspace layout, `TAPE_LOAD_COMMON` and everything it calls, `PRN_GFX_FONT`, keyboard matrix addresses. Extracted as a raw 16K ROM binary (parser handles the listing's primary + continuation hex-dump lines) for the emulator verification in `STAGE1_NOTES.md`.
- `RC39-Backplane-System-for-VZ200-main/` (your repo) — `documents/memory_map.md` and the Banking/Decode GAL CUPL sources are what `REAUDIT_v2.md` and `STAGE1_NOTES.md` verify against. Not duplicated here; refer to your own copy.
- `vz2wav-decompile-main/` (your repo) — source for `vzpack`/`vz2wav`/`wav2vz`. `dist/linux.zip` has working prebuilt x86-64 binaries despite the `ia64-linux` directory name.
- `z88dk-master.zip` — source for `z88dk-z80asm`. Needs 4 git submodules (`uthash`, `optparse`, `regex`, `UNIXem`) that a plain GitHub zip download doesn't include.

---

## Superseded — moved to `archive/`

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
