# 13 Ghosts — TRS-80 → VZ200 Port: Progress Log

**Status as of this writing:** core relocation bug fixed and verified
end-to-end against the real toolchain. Game has not been run on real
hardware or an emulator — everything below is static/build-level
verification, not confirmation that it plays correctly.

---

## 1. Source material

Original upload: `13_Ghosts__1982__Software_Affair-Tandy__CMD_.zip`,
containing `ghost13a.cmd` and `ghost13b.cmd`.

- Platform confirmed: **TRS-80 Model I/III** (Z80), "13 Ghosts" (1982,
  Software Affair / Radio Shack #26-1927).
- TRSDOS `.cmd` files are record-based (type/length/address blocks),
  not flat binaries. Wrote `cmd_tools.py` to parse the format and
  reassemble a flat memory image.
- Both files reassemble to the same 30,726-byte image, load span
  `0x5200`–`0xCA06`, entry point `0x535A`.
- `ghost13a.cmd` and `ghost13b.cmd` differ by exactly 10 bytes across
  5 addresses — the shape of a disk copy-protection patch (`IN A,(0)`
  → `LD A,0FFh`, `OUT (0),A` → `OUT (80h),A`). `ghost13a` retains the
  genuine hardware I/O; `ghost13b` has it bypassed. Used `ghost13b` as
  the base for porting (irrelevant to game logic either way).
- Disassembled both with `z80dasm` (labels, hex, addresses). Flagged
  self-modifying code and undocumented opcodes. `0x5200`–`0x5359` is
  data (misdecoded as garbage by the linear disassembler), not code.
- Identified the external dependency surface: TRS-80 ROM calls in the
  `0x0000`–`0x03FF` range, and a DOS/SVC console-driver call cluster
  at `0x4420`–`0x4554` (screen/keyboard services via TRSDOS/NEWDOS).

**Deliverables from this stage:** `ghost13a.asm`/`.bin`/`.sym`,
`ghost13b.asm`/`.bin`/`.sym`, `cmd_tools.py`, `PORTING_NOTES.md`.

---

## 2. Initial VZ200 port (v1) — review findings

You brought back a working first port attempt: `port_13ghosts.py`
(patches `ghost13b.asm` into a VZ200-targeted build), plus the
assembled `ghost13_vz.asm`/`.bin`/`.vz`/`.wav` and a `Makefile`.

Verified with `pasmo` (no `z88dk-z80asm` available at the time) —
output was **byte-for-byte identical** to your original build, so all
findings below apply to the real toolchain's output too, not just a
substitute.

**Confirmed correctly wired:**
- All 5 raw TRS-80 keyboard-read sites (`0x3804`/`0x3840`) except one
  converted to VZ200 keyboard-matrix calls.
- All 4 TRS-80 sound-port (`OUT (0x80)`) sites converted to VZ200
  piezo-speaker output.
- Both TRSDOS SVC bypass blocks (high-score disk read/write at
  `0x536D` and `0x5ACA`) cleanly swallow every call in their range.
- `vz_check_fire` correctly wired via the `sub_c9fdh` label — reaches
  all 8 call sites automatically since it patches the label body
  rather than each call site.
- All 12 old TRS-80 video-buffer addresses (`0xCA12` etc.) remapped
  into the new `0x4000`–`0x55FF` buffer region with no leftovers.

**Confirmed gaps (both traced to inside a misdecoded data region, not
reachable code — low severity, not fixed):**
- One `ld a,(03804h)` keyboard-read (original addr `0x8495`) missed
  by the script's `idx < 500` guard.
- One `call po,04554h` TRSDOS-range call (original addr `0x8491`)
  never bypassed.
- ~15 more leftover calls into the TRS-80 ROM's `0x0000`–`0x03FF`
  range across 8 other addresses, never translated by the script.

---

## 3. Critical bug: load address collided with ROM workspace

You supplied `export.lst`, a full disassembly of the actual VZ200
BASIC ROM. Cross-checking the port against it found a load-time bug,
not just a style issue:

- The ROM's own comments/init code confirm RAM `0x7800`–`0x785C` is
  live workspace: the RST-vector jump table, DCB blocks, and
  keyboard-debounce state, all written by `BASIC_INIT_1` on every cold
  boot.
- Worse: CLOAD's machine-code loader stores the tape header's declared
  start address at RAM `0x781E`, then reads it back **after** the
  transfer to know where to jump. Since the transfer's write pointer
  starts at the load address and walks upward, and the port's
  `org 0x7800` put that pointer 30 bytes before `0x781E`, the load's
  own data silently overwrote its own hand-off cell.
- Traced it with the actual bytes: as built, the ROM would have read
  back `0x2108` (garbage, mid-ROM) instead of jumping to `vz_boot`
  (`0xEFEE`). **CLOAD would not have started the game at all.**

**Fix:** relocated `org` to `0x7AE8` — the address the ROM itself
documents as the start of free user RAM (`export.lst`, `0x00A8`).
This clears the whole workspace region, and since the load pointer
never goes near `0x781E` anymore, the corruption is structurally
impossible regardless of binary content.

**Re-audit of the leftover ROM-range calls** (using `export.lst` to
identify what each address actually does on VZ200 hardware), 3 tiers:

| Tier | Addresses | Verdict |
|---|---|---|
| Coincidentally fine | `0x0060` (5 sites) | VZ200 ROM has an identical-convention `DELAY_LOOP` at the same address — every site preloads `BC` with a count first, exactly matching. |
| Probably fine | `0x0049` (1 site) | Matches VZ200's `KBD_WAIT` calling convention (return ASCII in A); worth a play-test smoke-check since scancodes may differ. |
| Very likely dead code | `0x0090`, `0x00AB`, `0x01AA`, `0x0295`, `0x02AA`, `0x02AB`, `0x02BF`, `0x03AA` (~15 sites) | Every sampled site sits in the same kind of incoherent instruction jumble already identified as misdecoded level/sprite data. Not exhaustively verified individually — would need the real TRS-80 ROM reference or emulator execution tracing to be 100% certain. |

None of the three tiers were patched — the first two don't obviously
need it, and guessing at fixes for the third without solid grounds
risks introducing new bugs.

**Deliverables:** `port_13ghosts_v2.py`, `ghost13_vz_v2.asm/.bin`,
`REAUDIT_v2.md`.

---

## 4. Toolchain verification (real tools, not substitutes)

Two further uploads let every substitute tool used above get replaced
with the real thing and cross-checked:

- **`vz2wav-decompile-main.zip`** (source for `vzpack`/`vz2wav`):
  `dist/linux.zip` had working prebuilt x86-64 Linux binaries
  ("ia64-linux" is just their own directory-naming convention, not
  actual Itanium).
  - Repacked the v2 binary with the real `vzpack`: **byte-for-byte
    identical** to the hand-rolled `.vz` container used as a stand-in.
  - Generated real cassette audio with `vz2wav`.
  - Round-tripped it back through `wav2vz` (noise-tolerant capture
    mode): reconstructed a `.vz` **byte-for-byte identical** to the
    source, with the tool's own checksum check passing. Confirms the
    audio encoding is self-consistent and lossless — not a hardware
    guarantee, but the strongest check possible without real/emulated
    hardware.

- **`z88dk-master.zip`** (source for `z88dk-z80asm`): the GitHub zip
  download didn't include 4 git submodules (`uthash`, `optparse`,
  `regex`, `UNIXem` — submodule content isn't in a plain zip export),
  so those were pulled from their own repos before building. Built
  just the `z88dk-z80asm` target and ran it against `ghost13_vz.asm`:
  **byte-for-byte identical** to the `pasmo` build already in hand.

Net result: every artifact in `ghost13_vz_v2.*` is now confirmed
against the actual toolchain end to end (asm → bin → vz → wav), not
resting on "should be equivalent to pasmo/hand-rolled."

**Deliverables:** `ghost13_vz_v2.vz` (repacked), `ghost13_vz_v2.wav`
(real audio).

---

## 5. Makefile bugs

Verifying the `Makefile` against everything above found two more real
bugs, both confirmed by actually running it against the real
toolchain (not just reading it):

1. **Still built the broken v1.** `$(TARGET_BIN)` called
   `port_13ghosts.py`, not `_v2.py`. A fresh `make` run reproduced the
   exact `0x7800`-collision build from §3.
2. **`vzpack` recipe hardcoded `-s 0x7800`**, independent of whatever
   address the `.bin` was actually assembled at. Proved this by
   feeding the *correct* v2 binary through the Makefile's own recipe
   in isolation and getting a `.vz` header claiming the wrong start
   address — the kind of thing that silently corrupts a load if
   anyone ever runs `make vz` alone (e.g. after deleting just the
   `.vz`).

**Fix:** `Makefile.fixed` — points at `port_13ghosts_v2.py`, and pulls
the load address from a single `LOAD_ORG` variable used by both the
script and the `vzpack` recipe, so they can't drift apart again.
Verified empirically: full build matches the delivered v2 artifacts
byte-for-byte, and the isolated "delete `.vz`, run `make vz`" trap now
correctly packs `0x7AE8`.

---

## 6. Open items / not yet done

- **No hardware or emulator run.** Nothing above proves the game
  actually plays correctly — only that the build pipeline produces a
  self-consistent, correctly-addressed binary that should at least
  *start* without CLOAD corrupting itself. Blitter output, keyboard
  mapping, sound, and the ~15 "very likely dead code" ROM calls from
  §3 are all unverified at runtime.
- **Test harness:** asked about, checked everywhere across the
  original upload — doesn't exist in any of the files provided.
  Either it wasn't included or it's from a session I haven't seen.
- **`Makefile.fixed`** hasn't been renamed over the real `Makefile` in
  your working copy yet — it's a sibling file pending your review.

---

## 7. File inventory

| File | What it is |
|---|---|
| `cmd_tools.py` | TRS-80 `.cmd` record-format parser / flat-image extractor |
| `ghost13a.*` / `ghost13b.*` | TRS-80 disassembly (asm/bin/sym) for both protection-patch variants |
| `PORTING_NOTES.md` | Stage-1 findings: CMD format, protection-patch diff, entry point, external-call map |
| `port_13ghosts.py` | Original (v1) porting script — **has the `org 0x7800` bug, superseded** |
| `port_13ghosts_v2.py` | Fixed porting script — `org 0x7AE8`, tries `z88dk-z80asm` then falls back to `pasmo` |
| `ghost13_vz_v2.asm/.bin/.vz/.wav/.sym` | Current, verified port build |
| `REAUDIT_v2.md` | Relocation fix rationale + ROM-call reachability triage + toolchain verification log |
| `Makefile` | Original build pipeline — **has the two bugs from §5** |
| `Makefile.fixed` | Corrected build pipeline, pending your review/rename |
| `export.lst` | VZ200 BASIC ROM disassembly (your upload) — reference for everything in §3 |
