# =============================================================================
# Makefile for 13 Ghosts VZ200/RC39 port (v8) -- four-file tape, three encodings
.DEFAULT_GOAL := all
#
#   make            all three tapes below
#   make standard   assets/ghost13_two_stage.wav   normal-speed ROM-format tape (the original)
#   make fast       prod/ghost13_fast.wav          fast loader, normal phase (stock VZ200, emulators)
#   make fast-inv   prod/ghost13_fast_inv.wav      fast loader, inverted phase (--fast-invert, for
#                                           machines whose tape input inverts the signal,
#                                           e.g. the RC39/HB200 homebrew)
#
#   All three use the same stage 1 (a normal ROM-format block) and the same three parts; only
#   the way the parts are put on tape differs. In the fast tapes each part is a self-booting
#   fast block (vz2wav --fast --fast-vram) and the tiny stubs at the start of parts 1 and 2
#   still chain to the next part through the ROM loader.
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
ASSETS_DIR = assets
PROD_DIR   = prod
STAGE1_BIN = $(ASSETS_DIR)/stage1.bin
STAGE1_VZ  = $(PROD_DIR)/stage1.vz
STAGE1_WAV = $(ASSETS_DIR)/stage1.wav

PORT_SCRIPT = port_13ghosts_v8.py
PORT_DEPS   = $(PORT_SCRIPT) ghost13b.asm hal_vz.asm VZ200_basic_ROM_listing/corrected_table.asm
PARTS       = ghost13_p1 ghost13_p2 ghost13_p3
PART_VZ     = $(addprefix $(PROD_DIR)/,$(addsuffix .vz,$(PARTS)))
PART_WAV    = $(addprefix $(ASSETS_DIR)/,$(addsuffix .wav,$(PARTS)))

FINAL_WAV      = $(ASSETS_DIR)/ghost13_two_stage.wav
FAST_WAV       = $(PROD_DIR)/ghost13_fast.wav
FAST_INV_WAV   = $(PROD_DIR)/ghost13_fast_inv.wav

# Fast encodings. --fast-vram is required for this game: parts 2 and 3 reach above 0xC000, which
# the default receiver placement cannot reach; --fast-vram puts the receiver and its stack in
# unused video RAM (0x7200-0x77FF), which the game never loads into.
FAST_FLAGS     ?= --fast --fast-vram
FAST_PART_WAV     = $(addprefix $(ASSETS_DIR)/,$(addsuffix _fast.wav,$(PARTS)))
FAST_INV_PART_WAV = $(addprefix $(ASSETS_DIR)/,$(addsuffix _fast_inv.wav,$(PARTS)))

.PHONY: all standard fast fast-inv stage1 parts clean

$(ASSETS_DIR) $(PROD_DIR):
	mkdir -p $@

all: $(FINAL_WAV) $(FAST_WAV) $(FAST_INV_WAV)

standard: $(FINAL_WAV)
fast: $(FAST_WAV)
fast-inv: $(FAST_INV_WAV)

# ---- stage 1 ----
$(STAGE1_BIN): $(STAGE1_ASM) | $(ASSETS_DIR)
	@if command -v $(ASM) >/dev/null 2>&1; then \
		echo "assembling stage1 with $(ASM)" ; \
		$(ASM) -b -o$(STAGE1_BIN) $(STAGE1_ASM) || exit $$? ; \
		if [ -f stage1.o ]; then mv -f stage1.o $(ASSETS_DIR)/stage1.o; fi ; \
	else \
		echo "$(ASM) not found; using pasmo instead" ; \
		pasmo $(STAGE1_ASM) $(STAGE1_BIN) $(ASSETS_DIR)/stage1.sym ; \
	fi

$(STAGE1_VZ): $(STAGE1_BIN) | $(PROD_DIR)
	$(VZPACK) --in-bin $(STAGE1_BIN) -s $(LOAD_ORG) -o $(STAGE1_VZ) -t mc -n STAGE1

$(STAGE1_WAV): $(STAGE1_VZ)
	$(VZ2WAV) $(STAGE1_VZ) $(STAGE1_WAV)

stage1: $(STAGE1_WAV)

# ---- the game: one script run produces all three .vz parts ----
$(ASSETS_DIR)/ghost13_parts.stamp: $(PORT_DEPS) | $(ASSETS_DIR) $(PROD_DIR)
	$(PYTHON) $(PORT_SCRIPT)
	@touch $@

$(PART_VZ): $(ASSETS_DIR)/ghost13_parts.stamp ;

# normal-speed part audio (ghost13_p1.wav ...)
$(ASSETS_DIR)/%.wav: $(PROD_DIR)/%.vz | $(ASSETS_DIR)
	$(VZ2WAV) $< $@

# fast-loader part audio, normal phase (ghost13_p1_fast.wav ...)
$(ASSETS_DIR)/%_fast.wav: $(PROD_DIR)/%.vz | $(ASSETS_DIR)
	$(VZ2WAV) $(FAST_FLAGS) --fast-normal $< $@

# fast-loader part audio, inverted phase (ghost13_p1_fast_inv.wav ...)
$(ASSETS_DIR)/%_fast_inv.wav: $(PROD_DIR)/%.vz | $(ASSETS_DIR)
	$(VZ2WAV) $(FAST_FLAGS) --fast-invert $< $@

parts: $(PART_VZ)

# ---- final tape: stage 1, then the three parts, back to back ----
$(FINAL_WAV): $(STAGE1_WAV) $(PART_WAV)
	$(PYTHON) splice_wav.py $(STAGE1_WAV) $(PART_WAV) $(FINAL_WAV)

# stage 1 is a normal ROM-format block in every variant; only the parts change
$(FAST_WAV): $(STAGE1_WAV) $(FAST_PART_WAV)
	$(PYTHON) splice_wav.py $(STAGE1_WAV) $(FAST_PART_WAV) $(FAST_WAV)

$(FAST_INV_WAV): $(STAGE1_WAV) $(FAST_INV_PART_WAV)
	$(PYTHON) splice_wav.py $(STAGE1_WAV) $(FAST_INV_PART_WAV) $(FAST_INV_WAV)

clean:
	rm -f $(ASSETS_DIR)/stage1.bin $(ASSETS_DIR)/stage1.vz $(ASSETS_DIR)/stage1.wav \
	      $(ASSETS_DIR)/stage1.o $(ASSETS_DIR)/stage1.sym \
	      $(ASSETS_DIR)/ghost13_p*.bin $(ASSETS_DIR)/ghost13_p*.wav \
	      $(ASSETS_DIR)/ghost13_parts.stamp $(ASSETS_DIR)/ghost13_hal.asm \
	      $(ASSETS_DIR)/ghost13_hal.bin $(ASSETS_DIR)/ghost13_hal.map \
	      $(ASSETS_DIR)/ghost13_hal.o $(ASSETS_DIR)/ghost13_ram.bin \
	      $(ASSETS_DIR)/ghost13_two_stage.wav \
	      $(ASSETS_DIR)/ghost13_p*_fast.wav $(ASSETS_DIR)/ghost13_p*_fast_inv.wav \
	      $(PROD_DIR)/stage1.vz $(PROD_DIR)/ghost13_p*.vz \
	      $(PROD_DIR)/ghost13_fast.wav $(PROD_DIR)/ghost13_fast_inv.wav \
	      stage1.bin stage1.vz stage1.wav stage1.o stage1.sym ghost13_p*.bin \
	      ghost13_p*.vz ghost13_p*.wav ghost13_parts.stamp ghost13_hal.asm \
	      ghost13_hal.bin ghost13_hal.map ghost13_hal.o ghost13_ram.bin \
	      ghost13_two_stage.wav ghost13_fast.wav ghost13_fast_inv.wav \
	      ghost13_p*_fast.wav ghost13_p*_fast_inv.wav
