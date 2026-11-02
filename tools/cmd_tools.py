#!/usr/bin/env python3
"""
TRS-80 Model I/III .cmd (TRSDOS Load Module Format) parser.

Usage:
    python3 tools/cmd_tools.py <file.cmd> <output.bin>

Prints a record-by-record breakdown, then reassembles all type-01
(object code) records into one flat, contiguous binary image and writes
it to <output.bin>. The image's load origin (needed for a disassembler's
-g/--origin flag) is printed to stdout.

Format reference: TRSDOS/LDOS "CMD File Format" (Roy Soltoff, LDOS
Quarterly Vol.1 No.4, 1982); see also electrickery.nl/comp/trs80/
trs80Archeology/.

    01 LL AAAA DD..DD   object code block
                        LL = length of (address + data), little-endian
                             address first. LL in {0,1,2} means 256/257/258
                             -- the only way a single length byte can
                             express a full 256-byte block. Quirk applies
                             ONLY to type-01 records.
    02 LL AAAA          transfer address (entry point); LL is always 2
    05 LL NN..NN        program name (ASCII, length LL)
"""
import sys


def parse_records(fname, verbose=True):
    data = open(fname, 'rb').read()
    i, n = 0, len(data)
    blocks = []       # list of (load_addr, code_bytes)
    transfer = None
    name = None
    while i < n:
        rtype = data[i]
        if i + 1 >= n:
            break
        ll = data[i + 1]
        real_ll = ll
        if rtype == 0x01 and ll in (0, 1, 2):
            real_ll = 256 + ll
        start = i
        i += 2
        payload = data[i:i + real_ll]
        i += real_ll

        if rtype == 0x01 and len(payload) >= 2:
            addr = payload[0] | (payload[1] << 8)
            code = payload[2:]
            blocks.append((addr, code))
            if verbose:
                print(f"{start:#06x}: TYPE 01 object-code  addr={addr:#06x} "
                      f"len={len(code)}")
        elif rtype == 0x02 and len(payload) >= 2:
            transfer = payload[0] | (payload[1] << 8)
            if verbose:
                print(f"{start:#06x}: TYPE 02 transfer      addr={transfer:#06x}")
            break  # clean end of module
        elif rtype == 0x05:
            name = payload
            if verbose:
                print(f"{start:#06x}: TYPE 05 name          {payload!r}")
        else:
            if verbose:
                print(f"{start:#06x}: TYPE {rtype:#04x}           len={real_ll} "
                      f"{payload[:16]!r}{'...' if len(payload) > 16 else ''}")
    return blocks, transfer, name


def build_image(blocks):
    lo = min(a for a, c in blocks)
    hi = max(a + len(c) for a, c in blocks)
    img = bytearray(hi - lo)
    covered = bytearray(hi - lo)
    for addr, code in blocks:
        off = addr - lo
        img[off:off + len(code)] = code
        covered[off:off + len(code)] = b'\x01' * len(code)
    gaps, start = [], None
    for idx, v in enumerate(covered):
        if v == 0 and start is None:
            start = idx
        if v == 1 and start is not None:
            gaps.append((lo + start, lo + idx))
            start = None
    if start is not None:
        gaps.append((lo + start, lo + len(covered)))
    return lo, hi, bytes(img), gaps


def main():
    if len(sys.argv) != 3:
        print(__doc__)
        sys.exit(1)
    fname, outbin = sys.argv[1], sys.argv[2]

    blocks, transfer, name = parse_records(fname)
    print()
    if not blocks:
        print("No object-code records found.")
        sys.exit(1)

    lo, hi, img, gaps = build_image(blocks)
    print(f"Load span: {lo:#06x}-{hi:#06x} ({hi - lo} bytes)")
    print(f"Entry point (transfer address): "
          f"{transfer:#06x}" if transfer is not None else "No transfer record found")
    if name:
        print(f"Program name field: {name!r}")
    if gaps:
        print(f"WARNING: {len(gaps)} gap(s) in the address range - image "
              f"is not fully contiguous:")
        for g in gaps:
            print(f"  {g[0]:#06x}-{g[1]:#06x}")
    else:
        print("Fully contiguous - no gaps.")

    with open(outbin, 'wb') as f:
        f.write(img)
    print(f"\nWrote {len(img)} bytes to {outbin}")
    print(f"Disassemble with: z80dasm -a -l -u -t -g {lo:#06x} -o out.asm {outbin}")


if __name__ == '__main__':
    main()
