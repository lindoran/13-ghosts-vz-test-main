# Two-Stage Load: Bank 1/2 Hazard Fix

## The problem this replaces

The single-stage build (v3) probed all 8 banks at runtime to find wherever
CLOAD happened to write the game's C000+ tail, since the RC39's bank
register has no defined boot-time state. That handled "which bank has
the data" — but not what happens *after*: two of the eight banks
physically alias other memory, per `memory_map.md`:

- **Bank 1**: bottom 10K aliases the 10K RAM window (`0x4000-0x67FF`).
  If the game lands here, `vz_boot`'s own buffer-clear step (filling
  `0x4000-0x55FF` with `0x80`) physically overwrites the game's own
  tail code — same physical bytes, two addresses.
- **Bank 2**: full 16K aliases fixed RAM (`0x8000-0xBFFF`), *unconditionally*,
  with no port-0x70 bit gating it. If bank 2 is the undefined boot-time
  state, the corruption happens **during the load itself** — later file
  bytes streaming into the aliased `0xC000+` window overwrite earlier
  file bytes already sitting at `0x8000-0xBFFF`, before any of our code
  ever runs. No post-load fix can recover from this.

## The fix

A tiny stage-1 bootstrap (11 bytes) loads first, forces bank 0 (the one
bank with zero aliasing against anything), then calls straight into the
ROM's real tape-loading routine to load the actual game — which now
always lands in the one safe bank, deterministically, regardless of
whatever the undefined boot state was:

```
stage1_entry:
    xor  a
    out  (070h), a        ; force bank 0
    ld   hl, empty_name    ; -> 0x00: "load next file, any name"
    call 0365fh              ; TAPE_LOAD_COMMON (real ROM routine)
    halt                     ; unreachable on success
empty_name: defb 0
```

This also makes the 8-way runtime probe from v3 unnecessary — stage 2
(`ghost13_vz` v4) goes back to a plain `jp vz_boot` entry, ~48 bytes
smaller than v3.

## How this was verified

Not just assembled and eyeballed — run against **real ROM code**, not a
reimplementation. Extracted the actual VZ200 ROM as a raw binary
straight from `export.lst` (a general address+hex-dump parser, handling
both primary and continuation lines in the listing; cross-checked
against the already-verified `PRN_GFX_FONT` table extraction — exact
match, 100% of the 16K ROM accounted for, zero gaps).

Loaded that real ROM into the Z80 emulator and ran the actual
`TAPE_LOAD_COMMON` → `TAPE_FIND_PROGRAM` → `TAPE_READ_BYTE` →
`TAPE_CALC_CHECKSUM` chain genuinely — traced the real disassembly to
find the one place worth substituting a mock: `TAPE_READ_BIT`, the
lowest-level routine that measures analog pulse timing on the cassette
port. That's real hardware timing I'm not attempting to simulate;
everything above it (search/sync detection, name matching, checksum
verification, the final `jp (hl)` handoff to the loaded program) is
genuine ROM logic, untouched.

Two bugs turned up in the test harness itself along the way, both
informative:
- `OUT (n),A` drives the accumulator onto the port address's upper
  byte (real Z80 behavior) — first pass showed ports `0x70, 0x170,
  0x270...` instead of a clean `0x70`. Confirmed from the Decode Logic
  GAL's own CUPL source that the RC39's port-70 decode only checks
  `A4-A7`, never the upper byte — real hardware doesn't care, this was
  purely a test-harness gap.
- `CHECK_BREAK_STOP` (called at the top of every tape search) reads
  keyboard rows `0x68FD`/`0x68DF` to check for the BREAK key. Left
  unmocked, those read as all-zero, which an active-low keyboard
  matrix reads as "BREAK held down" — causing every search attempt to
  abort into the BASIC error handler. Fixed by mocking the keyboard
  MMIO page to read as "nothing pressed."

With both fixed, ran the full load sequence — real ROM sync detection,
name matching (empty name matches anything), start/end address read,
byte-by-byte payload transfer into simulated banked memory, checksum
verify, and the final jump to the loaded program — across **all 8
possible pre-stage-1 boot states** (0 through 7, including both
hazardous banks 1 and 2). All 8 passed: final bank is always 0, the
payload lands byte-for-byte correct, and a marker written by the
loaded test program at its designated address is exactly what was
expected — proof the CPU is not just holding correct bytes but genuinely
executing the freshly-loaded code.

Audio-level check too: packed and encoded both stages with the real
`vzpack`/`vz2wav`, spliced the two WAVs together (same format — 8-bit
mono 22050Hz, straightforward concatenation, no new container format
needed), then ran the real `wav2vz` against the spliced file and
confirmed it decodes stage 1 correctly from the front, byte-for-byte
against the original.

## Files

- `stage1.asm` / `.bin` / `.vz` / `.wav` — the bootstrap
- `port_13ghosts_v4.py` — stage-2 generator, probe removed
- `ghost13_vz_v4.asm` / `.bin` / `.vz` — the game itself (31,313 bytes,
  48 bytes smaller than v3 without the probe stub)
- `ghost13_two_stage.wav` — **the actual tape image to use**: stage 1
  followed by stage 2, ready to load as one continuous play

## What's not covered

The `TAPE_READ_BIT` mock proves the *protocol* is correct — real
ROM code correctly drives a real load given correct bit timing. It
doesn't prove the *physical* audio (amplitude, frequency accuracy,
noise tolerance) will decode correctly on real hardware or a real
tape deck; that still needs an actual test. `vz2wav --robust` is
available if a real deck needs more tolerant timing.
