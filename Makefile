# =============================================================================
# Makefile for 13 Ghosts VZ200 Port -- two-stage tape load
#
# Stage 1 (bootstrap) forces bank 0 before calling back into the ROM's
# tape loader for stage 2 (the game), so stage 2 always lands in the
# one bank with no aliasing hazards, regardless of the RC39's undefined
# boot-time bank state. See STAGE1_NOTES.md for why this exists.
# =============================================================================

PYTHON  = python3
VZPACK  = /home/david/Documents/vz2wav-decompile/bin/ia64-linux/vzpack
VZ2WAV  = /home/david/Documents/vz2wav-decompile/bin/ia64-linux/vz2wav

# Single source of truth for the load address -- must match LOAD_ORG in
# port_13ghosts_v4.py and the `org` in stage1.asm. This is the address
# the RC39 ROM documents as the start of free user RAM, clear of the
# RST-vector/DCB workspace at 0x7800-0x785C (see PROGRESS.md / REAUDIT_v2.md).
LOAD_ORG = 0x7AE8

# ---- stage 1: bootstrap ----
STAGE1_ASM = stage1.asm
STAGE1_BIN = stage1.bin
STAGE1_VZ  = stage1.vz
STAGE1_WAV = stage1.wav

# ---- stage 2: the game ----
STAGE2_PORT_SCRIPT = port_13ghosts_v7.py
STAGE2_SRC_ASM     = ghost13b.asm
STAGE2_ASM = ghost13_vz.asm
STAGE2_BIN = ghost13_vz.bin
STAGE2_VZ  = ghost13_vz.vz
STAGE2_WAV = ghost13_vz.wav

# ---- final: the actual tape image to load on hardware/emulator ----
FINAL_WAV = ghost13_two_stage.wav

.PHONY: all stage1 stage2 wav clean

all: $(FINAL_WAV)

# ---------------------------------------------------------------------------
# Stage 1
# ---------------------------------------------------------------------------
$(STAGE1_BIN): $(STAGE1_ASM)
	@if command -v z88dk-z80asm >/dev/null 2>&1; then \
		z88dk-z80asm -b $(STAGE1_ASM) ; \
	else \
		echo "z88dk-z80asm not found; using pasmo instead" ; \
		pasmo $(STAGE1_ASM) $(STAGE1_BIN) stage1.sym ; \
	fi

$(STAGE1_VZ): $(STAGE1_BIN)
	$(VZPACK) --in-bin $(STAGE1_BIN) -s $(LOAD_ORG) -o $(STAGE1_VZ) -t mc -n STAGE1

$(STAGE1_WAV): $(STAGE1_VZ)
	$(VZ2WAV) $(STAGE1_VZ) $(STAGE1_WAV)

stage1: $(STAGE1_WAV)

# ---------------------------------------------------------------------------
# Stage 2 -- port_13ghosts_v4.py generates the .asm and .bin, and (when it
# can find the real VZPACK/VZ2WAV at the hardcoded paths above) also packs
# and encodes them itself as a convenience for running the script directly
# without make. The rules below are what make actually relies on; they're
# idempotent against the script's own output since both use LOAD_ORG.
# ---------------------------------------------------------------------------
$(STAGE2_BIN): $(STAGE2_PORT_SCRIPT) $(STAGE2_SRC_ASM)
	$(PYTHON) $(STAGE2_PORT_SCRIPT)

$(STAGE2_VZ): $(STAGE2_BIN)
	$(VZPACK) --in-bin $(STAGE2_BIN) -s $(LOAD_ORG) -o $(STAGE2_VZ) -t mc -n 13GHOSTS

$(STAGE2_WAV): $(STAGE2_VZ)
	$(VZ2WAV) $(STAGE2_VZ) $(STAGE2_WAV)

stage2: $(STAGE2_WAV)

# ---------------------------------------------------------------------------
# Final: splice the two tape segments into one continuous WAV. Each
# segment already carries vz2wav's own leader/sync silence, so no extra
# gap is inserted -- see splice_wav.py.
# ---------------------------------------------------------------------------
$(FINAL_WAV): $(STAGE1_WAV) $(STAGE2_WAV) splice_wav.py
	$(PYTHON) splice_wav.py $(STAGE1_WAV) $(STAGE2_WAV) $(FINAL_WAV)

wav: $(FINAL_WAV)

clean:
	rm -f $(STAGE1_BIN) $(STAGE1_VZ) $(STAGE1_WAV) stage1.sym
	rm -f $(STAGE2_ASM) $(STAGE2_BIN) $(STAGE2_VZ) $(STAGE2_WAV) ghost13_vz.sym *.o
	rm -f $(FINAL_WAV)
