# VZ200 toolbox (prebuilt, no compiling needed)

Prebuilt Linux x86-64 tools for the 13 Ghosts / VZ200 port. Nothing here needs
to be built, and **you should not download or rebuild anything** (no z88dk
source, no git submodules). Just unpack, run the self-test, and use it.

## Setup (for the AI / user)

```bash
unzip vz-toolbox.zip && cd vz-toolbox
chmod +x selftest.sh bin/*      # only if the executable bit was lost
./selftest.sh                   # must end with "toolbox OK"
. ./env.sh                      # puts bin/ on PATH, sets VZPACK / VZ2WAV
```

`env.sh` locates itself automatically in bash and zsh. In plain `sh`/dash it
cannot, so pass the path: `VZ_TOOLBOX=/path/to/vz-toolbox . /path/to/vz-toolbox/env.sh`.

The self-test assembles a known 11-byte bootstrap and checks the `.bin`, `.vz`
and `.wav` md5s against a verified reference build. If it passes, the toolchain
is byte-identical to the one used for the reference production files.

## Contents (`bin/`)

| Tool | What it is |
|---|---|
| `z88dk-z80asm` | z88dk 2.4 Z80 assembler (built from the upstream 2.4 source, stripped). Standalone; needs no z88dk install or env vars. Use `z88dk-z80asm -b file.asm` to produce `file.bin`. |
| `vzpack` | raw binary / BASIC -> `.vz` tape image |
| `vz2wav` | `.vz` -> WAV tape audio |
| `wav2vz`, `vzexport`, `text2bas-vz`, `text2bas-cg` | other vz2wav-decompile tools, included for completeness |

The directory name in the original repo is `ia64-linux`, but these are plain
x86-64 ELF binaries (libc only; z80asm also needs libstdc++).

## Building the 13 Ghosts project

The project's `Makefile` hardcodes `/home/david/...` tool paths, so override
them on the command line (do not edit the Makefile). `z88dk-z80asm` is found
via PATH.

```bash
. /path/to/vz-toolbox/env.sh
cd 13-ghosts-vz-test
make clean && make VZPACK="$VZPACK" VZ2WAV="$VZ2WAV"
```

Output: `ghost13_two_stage.wav` (normal speed), `ghost13_fast.wav` (fast loader, normal
phase) and `ghost13_fast_inv.wav` (fast loader, inverted phase). Expected md5s of every
generated file for the reference build are in `selftest/expected_13ghosts.md5`:

```bash
cd 13-ghosts-vz-test && md5sum -c /path/to/vz-toolbox/selftest/expected_13ghosts.md5
```

Harmless noise: "modification time in the future" / "Clock skew detected" if the
project files came from a zip with odd timestamps.

## emulator needs to be built 
./build.sh should do the trick - you may just need the dev kit dependancies. 

## Provenance / licenses

See `licenses/`. z80asm is Artistic License 2.0 (Paulo Custodio / z88dk);
the vz2wav tools are under their own UNLICENSE/NOTICE.
