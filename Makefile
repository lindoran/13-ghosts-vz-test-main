# =============================================================================
# Makefile for 13 Ghosts VZ200/RC39 port (v8) -- four-file tape
#
#   stage1  (7AE8)  forces bank 0 and the 10K RAM window, loads the next file
#   part 1  (4000)  stub + compressed screens + original game bytes 5200-644A
#   part 2  (7AE8)  stub + compressed screens + original game bytes 886C-CA05
#   part 3  (E420)  replacement routines (hal_vz.asm), font, screen list;
#                   its start address is vz_boot, which jumps into the game
#
# port_13ghosts_v8.py does NOT relocate the game: see its docstring.
# =============================================================================

PYTHON  = python3
VZPACK  ?= ./vz-toolbox/bin/vzpack
VZ2WAV  ?= ./vz-toolbox/bin/vz2wav
ASM	 ?= ./vz-toolbox/bin/z88dk-z80asm
export VZPACK VZ2WAV ASM

# stage 1 loads at LOAD_ORG; must match `org` in stage1.asm
LOAD_ORG = 0x7AE8

STAGE1_ASM = stage1.asm
STAGE1_BIN = stage1.bin
STAGE1_VZ  = stage1.vz
STAGE1_WAV = stage1.wav

PORT_SCRIPT = port_13ghosts_v8.py
PORT_DEPS   = $(PORT_SCRIPT) ghost13b.asm hal_vz.asm VZ200_basic_ROM_listing/corrected_table.asm
PARTS       = ghost13_p1 ghost13_p2 ghost13_p3
PART_VZ     = $(addsuffix .vz,$(PARTS))
PART_WAV    = $(addsuffix .wav,$(PARTS))

FINAL_WAV = ghost13_two_stage.wav

.PHONY: all stage1 parts clean

all: $(FINAL_WAV)

# ---- stage 1 ----
$(STAGE1_BIN): $(STAGE1_ASM)
	@if command -v $(ASM) >/dev/null 2>&1; then \
		echo "assembling stage1 with $(ASM)" ; \
		$(ASM) -b $(STAGE1_ASM) ; \
	else \
		echo "$(ASM) not found; using pasmo instead" ; \
		pasmo $(STAGE1_ASM) $(STAGE1_BIN) stage1.sym ; \
	fi

$(STAGE1_VZ): $(STAGE1_BIN)
	$(VZPACK) --in-bin $(STAGE1_BIN) -s $(LOAD_ORG) -o $(STAGE1_VZ) -t mc -n STAGE1

$(STAGE1_WAV): $(STAGE1_VZ)
	$(VZ2WAV) $(STAGE1_VZ) $(STAGE1_WAV)

stage1: $(STAGE1_WAV)

# ---- the game: one script run produces all three .vz parts ----
ghost13_parts.stamp: $(PORT_DEPS)
	$(PYTHON) $(PORT_SCRIPT)
	@touch $@

$(PART_VZ): ghost13_parts.stamp ;

%.wav: %.vz
	$(VZ2WAV) $< $@

parts: $(PART_VZ)

# ---- final tape: stage 1, then the three parts, back to back ----
$(FINAL_WAV): $(STAGE1_WAV) $(PART_WAV)
	$(PYTHON) splice_wav.py $(STAGE1_WAV) $(PART_WAV) $(FINAL_WAV)

clean:
	rm -f stage1.bin stage1.vz stage1.wav stage1.o ghost13_p*.bin ghost13_p*.vz ghost13_p*.wav \
	      ghost13_parts.stamp ghost13_hal.asm ghost13_hal.bin ghost13_hal.map ghost13_hal.o \
	      ghost13_ram.bin $(FINAL_WAV)
