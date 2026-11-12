# TRS-80 Original CMD Files

This directory is where the original TRS-80 Model I/III *13 Ghosts* (Software Affair / Radio Shack, 1982) TRSDOS `.cmd` load-module binaries should be placed.

These files are copyrighted commercial software and are **not** distributed with this repository.

## Required Files

Place the following files in this directory:

* **`ghost13a.cmd`** — Original TRS-80 release (with copy-protection intact).
* **`ghost13b.cmd`** — Un-protected / bypass-patched TRS-80 release. **This is the variant required by the VZ200 build chain.**

## Expected File Checksums

| File | Size (bytes) | MD5 | SHA-1 | SHA-256 |
|---|---|---|---|---|
| `ghost13a.cmd` | 32,000 | `8b379fd2ea901e36a12116c349fd975a` | `02c28cf65aa42f34e16cde5f1761608dc2ee44bd` | `3ac9080f984cc865918f4068862ff5cfb9dbc349a20cc8b7c2f84a62ab8526fd` |
| `ghost13b.cmd` | 31,214 | `8b64617be60aa89b6bf1fd283d5cf6cb` | `b2b017c6a80767969b6383444f53ee5f8d10c495` | `e77967ecb811807f87a686fb1c64dc13826c9f1c70c11ce1940ea93886ad3880` |

Source archive reference: `13_Ghosts__1982__Software_Affair-Tandy__CMD_.zip`

## Generating the Disassembly

Once the `.cmd` files are placed here, generate the assembly listings and symbol tables:

```bash
make disasm
```

or directly:

```bash
python3 tools/disasm_cmds.py
```

This verifies the `.cmd` checksums, extracts contiguous memory binaries loaded at `0x5200`, and invokes `z80dasm` to produce:
* `ghost13a.asm` and `ghost13a.sym`
* `ghost13b.asm` and `ghost13b.sym`

The generated `.asm` and `.sym` files are ignored by git so the repository stays clean.
