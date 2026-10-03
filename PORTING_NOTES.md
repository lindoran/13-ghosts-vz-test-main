# 13 Ghosts (1982, Software Affair / Radio Shack) — Disassembly Notes

Source: `13_Ghosts__1982__Software_Affair-Tandy__CMD_.zip`, containing
`ghost13a.cmd` and `ghost13b.cmd`. Confirmed platform: **TRS-80 Model I/III**
(Z80, RS catalog #26-1927), a "Ghost Blaster" shooting-gallery game by
Berta Eggers and Larry Payne.

Good news for a VZ200 port: same CPU family (Z80), so the game logic itself
is directly readable/portable at the source level — it's the platform layer
(video, keyboard, sound) that needs a full rewrite.

## CMD container format

TRS-80 `.cmd` files are TRSDOS "Load Module Format" — a sequence of
type-tagged records, not a flat binary:

```
01 LL AAAA DD...DD   object-code block: LL = length incl. 2-byte address
                     (LSB,MSB); LL values of 0/1/2 mean 256/257/258 — the
                     only way to express a full 256-byte data block in one
                     length byte. Only applies to type 01 records.
02 LL AAAA           transfer-address (entry point) record, LL is always 2
05 LL NN..NN         optional program-name record
```

Both files are ~120 sequential 256-byte object blocks. I wrote a small
parser (`cmd_tools.py`, included) that walks the records and reassembles a
flat memory image:

| File | Object blocks | Load span | Entry point |
|---|---|---|---|
| ghost13a.cmd | 121 | `0x5200`–`0xCA06` (30,726 bytes), contiguous | `0x535A` |
| ghost13b.cmd | 121 | `0x5200`–`0xCA06` (30,726 bytes), contiguous | `0x535A` |

`ghost13a.cmd` is 786 bytes longer on disk than `ghost13b.cmd`, but that's
just trailing sector padding (zeros then `0xE5` filler) after a clean `02`
end record — not program content.

## a vs. b: not two different disks — a 10-byte protection patch

Byte-for-byte, the two reconstructed memory images are identical except at
5 locations (10 bytes total):

| Address | `a` | `b` | Meaning |
|---|---|---|---|
| `0x5C1C`, `0x5C2B`, `0xC7F8`, `0xC808` | `D3 00` | `D3 80` | `OUT (n),A` — port operand `00`→`80` |
| `0x5DC2`, `0x5F31`, `0xCA01` | `DB 00` | `3E FF` | `IN A,(0)` → `LD A,0FFh` (hardware port read replaced with a hard-coded "always true" value) |

The `IN A,(0)` → `LD A,0FFh` substitution is the classic shape of a disk
copy-protection bypass: a routine that reads a port (used at 3 separate
call sites, so probably an inlined check) has been neutered so it always
returns the "pass" value. `ghost13a.cmd` still has the genuine port I/O;
`ghost13b.cmd` has the patched/bypassed version. Worth keeping in mind if
you archive or redistribute either — they aren't interchangeable "just
pick one" copies, `a` is the one closer to the original release.

## Disassembly

Ran through `z80dasm` (labels, addresses, hex bytes, undocumented opcodes
inline) at origin `0x5200` for both variants. z80dasm does a blind linear
sweep — it can't tell code from data — so two things to know before you
read the `.asm` files:

- **`0x5200`–`0x5359`** disassembles as nonsense: this is actual data
  (almost certainly level/sprite tables) that precedes the real code. The
  entry point is `0x535A` — start reading there.
- z80dasm flagged **self-modifying code** and several **undocumented
  opcodes**, and a few `CALL` targets land in the `0xC000+`/high range in
  a way that looks like more data getting mis-decoded as instructions
  mid-stream. Treat any block that looks like garbage as a candidate data
  region, not a disassembly bug.

External `CALL` targets (i.e. addresses outside the `0x5200–0xCA06` module
itself) cluster in two places, which tells you where the platform
dependencies are:

- **`0x0049, 0x0060, 0x0090, 0x00AB, 0x01AA, 0x0295, 0x02AA, 0x02AB,
  0x02BF, 0x03AA`** — low addresses in TRS-80 ROM range. These are Level
  II ROM routine calls (screen/keyboard/cassette primitives).
- **`0x4420, 0x4424, 0x4428, 0x4436, 0x4439, 0x4554`** — a tight cluster
  right below the program's own load address, consistent with calls into
  the resident DOS's console-driver/SVC dispatcher (TRSDOS/NEWDOS screen
  and keyboard services) rather than raw hardware access.

That second cluster matters most for porting: it means the game leans on
OS-provided I/O services, not just ROM calls, so you'll need to trace each
of those call sites and reimplement the equivalent (cursor positioning,
char output, key scan, etc.) against VZ200 primitives rather than assuming
it's self-contained.

## Files

- `ghost13a.bin` / `ghost13b.bin` — flat memory images, load at `0x5200`
- `ghost13a.asm` / `ghost13b.asm` — full z80dasm listing (labels, hex,
  addresses) for each variant
- `ghost13a.sym` / `ghost13b.sym` — label/symbol tables z80dasm generated
- `cmd_tools.py` — the CMD-record parser + flat-image extractor, in case
  you want to re-run it against other Model I/III `.cmd` dumps

## Suggested next steps for the VZ200 port

1. Start reading at `0x535A` in `ghost13b.asm` (the un-patched-protection
   one won't matter for porting — just use whichever is easier to read;
   the 10-byte diff is irrelevant to game logic).
2. Trace and label the `0x4420–0x4554` DOS-SVC calls first — that tells
   you exactly what platform services the game actually needs (almost
   certainly: clear screen, position cursor, print char/string, scan
   keyboard, maybe cassette/disk-adjacent calls you can just strip).
3. Separate the ROM-call sites (`0x0049` etc.) the same way — some may be
   pure delay-loop/timing calls you can drop, others are real I/O.
4. Once the DOS/ROM calls are mapped to intent, the actual game logic
   (ghost spawn/movement, collision, scoring, level table walk) is
   ordinary Z80 and should port close to as-is — that's the bulk of the
   30 KB image.
5. Screen output is the big rewrite: TRS-80 text/semigraphics video RAM
   (`0x3C00`-based) has nothing in common with the VZ200's 6847-based
   modes, so any routine that pokes video RAM directly (rather than
   through the DOS console driver) needs to be found and replaced with a
   VZ-appropriate equivalent — worth grep'ing the `.asm` for direct
   `(0x3C..)`-range memory writes as a first pass.
