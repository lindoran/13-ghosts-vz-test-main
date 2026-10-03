#!/bin/bash
# Verifies the toolbox works on this machine. Exit 0 = good.
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
cd "$HERE"; VZ_TOOLBOX="$HERE"; . "$HERE/env.sh"
chmod +x bin/* 2>/dev/null || true
W=$(mktemp -d); cp selftest/stage1.asm "$W/"; cd "$W"
z88dk-z80asm -b stage1.asm
# same parameters the project Makefile uses for stage 1
"$VZPACK" --in-bin stage1.bin -s 0x7AE8 -o stage1.vz -t mc -n STAGE1 >/dev/null
"$VZ2WAV" stage1.vz stage1.wav >/dev/null
echo "stage1.bin bytes:$(od -An -tx1 stage1.bin | tr -s ' ')"
ok=1
for f in stage1.bin stage1.vz stage1.wav; do
  want=$(grep " $f\$" "$HERE/selftest/expected.md5" | cut -d' ' -f1)
  got=$(md5sum < $f | cut -d' ' -f1)
  if [ "$want" = "$got" ]; then echo "PASS  $f"; else echo "FAIL  $f"; ok=0; fi
done
rm -rf "$W"
[ $ok = 1 ] && echo "toolbox OK" || { echo "toolbox FAILED"; exit 1; }
