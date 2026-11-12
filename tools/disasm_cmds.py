#!/usr/bin/env python3
"""
tools/disasm_cmds.py -- Unpack TRS-80 Model I/III .cmd files and disassemble to .asm and .sym

Takes TRS-80 .cmd files (from ./cmds/ by default), computes and verifies their cryptographic
hashes, extracts flat memory binaries at load origin 0x5200, and disassembles them with
z80dasm to produce ghost13a.asm / ghost13b.asm and their corresponding .sym files.

Documented CMD file hashes:
  cmds/ghost13a.cmd:
    Size:   32000 bytes
    MD5:    8b379fd2ea901e36a12116c349fd975a
    SHA1:   02c28cf65aa42f34e16cde5f1761608dc2ee44bd
    SHA256: 3ac9080f984cc865918f4068862ff5cfb9dbc349a20cc8b7c2f84a62ab8526fd

  cmds/ghost13b.cmd:
    Size:   31214 bytes
    MD5:    8b64617be60aa89b6bf1fd283d5cf6cb
    SHA1:   b2b017c6a80767969b6383444f53ee5f8d10c495
    SHA256: e77967ecb811807f87a686fb1c64dc13826c9f1c70c11ce1940ea93886ad3880

Note on symbol files (.sym):
  Symbol files (ghost13a.sym, ghost13b.sym) are generated directly by z80dasm via the
  -s flag during disassembly, NOT by port_13ghosts_v8.py.
"""

import argparse
import hashlib
import os
import shutil
import subprocess
import sys
import tempfile

# Add repo tools/ to sys.path so cmd_tools can be imported cleanly
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.dirname(SCRIPT_DIR)
sys.path.insert(0, SCRIPT_DIR)

from cmd_tools import build_image, parse_records

EXPECTED_HASHES = {
    "ghost13a.cmd": {
        "size": 32000,
        "md5": "8b379fd2ea901e36a12116c349fd975a",
        "sha1": "02c28cf65aa42f34e16cde5f1761608dc2ee44bd",
        "sha256": "3ac9080f984cc865918f4068862ff5cfb9dbc349a20cc8b7c2f84a62ab8526fd",
        "asm_sha256": "288351adb55cf9b7bd676e13b3c244b160f4cc9eabedbb570f3983d55e86d47e",
        "sym_sha256": "3f6d28d0c79491da02750d081f2593b7b38e885fe3e5b0dfc94587cdc5a6bcc4",
    },
    "ghost13b.cmd": {
        "size": 31214,
        "md5": "8b64617be60aa89b6bf1fd283d5cf6cb",
        "sha1": "b2b017c6a80767969b6383444f53ee5f8d10c495",
        "sha256": "e77967ecb811807f87a686fb1c64dc13826c9f1c70c11ce1940ea93886ad3880",
        "asm_sha256": "340dc495b2f82944b4d2cb89f27a0b19afcfdd1775d5ea2f7f58bd71875a00de",
        "sym_sha256": "3f6d28d0c79491da02750d081f2593b7b38e885fe3e5b0dfc94587cdc5a6bcc4",
    },
}


def hash_file(path):
    """Compute size, md5, sha1, and sha256 for a file."""
    md5 = hashlib.md5()
    sha1 = hashlib.sha1()
    sha256 = hashlib.sha256()
    size = 0
    with open(path, "rb") as f:
        while chunk := f.read(65536):
            size += len(chunk)
            md5.update(chunk)
            sha1.update(chunk)
            sha256.update(chunk)
    return {
        "size": size,
        "md5": md5.hexdigest(),
        "sha1": sha1.hexdigest(),
        "sha256": sha256.hexdigest(),
    }


def verify_z80dasm():
    """Ensure z80dasm binary is available."""
    z80dasm_path = shutil.which("z80dasm")
    if not z80dasm_path:
        sys.exit(
            "ERROR: 'z80dasm' was not found on PATH.\n"
            "Please install z80dasm (e.g. 'sudo apt install z80dasm' on Debian/Ubuntu)\n"
            "or place z80dasm in your PATH."
        )
    return z80dasm_path


def process_cmd(cmd_path, output_dir=REPO_ROOT, verbose=True):
    base_name = os.path.basename(cmd_path)
    stem, _ = os.path.splitext(base_name)
    if stem.endswith(".cmd"):
        stem = stem[:-4]

    if verbose:
        print(f"=== Processing {cmd_path} ===")

    hashes = hash_file(cmd_path)
    if verbose:
        print(f"  Size:   {hashes['size']} bytes")
        print(f"  MD5:    {hashes['md5']}")
        print(f"  SHA1:   {hashes['sha1']}")
        print(f"  SHA256: {hashes['sha256']}")

    expected = EXPECTED_HASHES.get(base_name)
    if expected:
        if (
            hashes["size"] == expected["size"]
            and hashes["sha256"] == expected["sha256"]
        ):
            if verbose:
                print("  [OK] Hash matches documented reference file.")
        else:
            print("  [WARNING] File hash does NOT match documented reference!")

    # 1. Parse .cmd and build flat binary
    blocks, transfer, prog_name = parse_records(cmd_path, verbose=False)
    if not blocks:
        sys.exit(f"ERROR: No object-code records found in {cmd_path}")

    lo, hi, img, gaps = build_image(blocks)
    if verbose:
        print(f"  Load origin: {lo:#06x}, end: {hi:#06x} ({len(img)} bytes)")
        if gaps:
            print(f"  WARNING: {len(gaps)} gaps detected in image!")

    # 2. Disassemble using z80dasm in a temp directory to match exact invocation flags and headers
    asm_dest = os.path.join(output_dir, f"{stem}.asm")
    sym_dest = os.path.join(output_dir, f"{stem}.sym")

    with tempfile.TemporaryDirectory() as tmpdir:
        bin_tmp = os.path.join(tmpdir, f"{stem}.bin")
        sym_tmp = os.path.join(tmpdir, f"{stem}.sym")
        # Note: the original build used -o <stem>_full.asm <stem>.bin then moved to <stem>.asm
        full_asm_tmp = os.path.join(tmpdir, f"{stem}_full.asm")

        with open(bin_tmp, "wb") as f:
            f.write(img)

        # Run z80dasm inside tmpdir so the header comment matches the original invocation
        cmd = [
            "z80dasm",
            "-a",
            "-l",
            "-u",
            "-t",
            "-g",
            f"{lo:#06x}",
            "-s",
            f"{stem}.sym",
            "-o",
            f"{stem}_full.asm",
            f"{stem}.bin",
        ]
        res = subprocess.run(cmd, cwd=tmpdir, capture_output=True, text=True)
        if res.returncode != 0:
            sys.exit(f"ERROR: z80dasm failed:\n{res.stdout}\n{res.stderr}")

        shutil.copyfile(full_asm_tmp, asm_dest)
        shutil.copyfile(sym_tmp, sym_dest)

    out_asm_hashes = hash_file(asm_dest)
    out_sym_hashes = hash_file(sym_dest)

    if verbose:
        print(f"  Wrote: {asm_dest} (SHA256: {out_asm_hashes['sha256']})")
        print(f"  Wrote: {sym_dest} (SHA256: {out_sym_hashes['sha256']})")
        if expected:
            if (
                out_asm_hashes["sha256"] == expected["asm_sha256"]
                and out_sym_hashes["sha256"] == expected["sym_sha256"]
            ):
                print("  [OK] Output .asm and .sym match exact byte-for-byte reference!")
        print()


def main():
    parser = argparse.ArgumentParser(
        description="Unpack TRS-80 Model I/III .cmd files into .asm and .sym files."
    )
    parser.add_argument(
        "cmd_files",
        nargs="*",
        help="Path to .cmd file(s). Defaults to cmds/ghost13a.cmd and cmds/ghost13b.cmd.",
    )
    parser.add_argument(
        "-o",
        "--outdir",
        default=REPO_ROOT,
        help=f"Directory to write .asm and .sym files to (default: {REPO_ROOT})",
    )
    parser.add_argument(
        "--hash-only",
        action="store_true",
        help="Only display hashes of input .cmd files without extracting or disassembling.",
    )

    args = parser.parse_args()

    cmd_files = args.cmd_files
    if not cmd_files:
        cmd_files = [
            os.path.join(REPO_ROOT, "cmds", "ghost13a.cmd"),
            os.path.join(REPO_ROOT, "cmds", "ghost13b.cmd"),
        ]

    for cf in cmd_files:
        if not os.path.exists(cf):
            sys.exit(f"ERROR: Input file not found: {cf}")

    if args.hash_only:
        print("=== File Hashes ===")
        for cf in cmd_files:
            h = hash_file(cf)
            print(f"File:   {cf}")
            print(f"  Size:   {h['size']} bytes")
            print(f"  MD5:    {h['md5']}")
            print(f"  SHA1:   {h['sha1']}")
            print(f"  SHA256: {h['sha256']}\n")
        return

    verify_z80dasm()
    os.makedirs(args.outdir, exist_ok=True)

    for cf in cmd_files:
        process_cmd(cf, output_dir=args.outdir)


if __name__ == "__main__":
    main()
