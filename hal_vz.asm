; =============================================================================
; hal_vz.asm -- VZ200/RC39 replacement routines for 13 Ghosts (port v8)
;
; Assembled by port_13ghosts_v8.py at HAL_BASE together with the corrected font
; table and the compressed-screen list; the patched TRS-80 image calls into
; these routines.  EQUs (HAL_BASE, TILE_CACHE, ...) are emitted by the script.
; =============================================================================

; ---------------------------------------------------------------------------
; vz_boot -- runs once, after the last tape file (this one) has loaded.
; Everything else of the game is already at its ORIGINAL TRS-80 address
; (see port_13ghosts_v8.py); this routine only prepares the VZ200/RC39.
; ---------------------------------------------------------------------------
vz_boot:
	di
	ld	a, 008h
	out	(070h), a		; bank 0, RAM in the 10K window (stage 1 did this too)

	ld	a, 008h
	ld	(06800h), a		; MC6847: graphics mode 1 (128x64), green background

	ld	hl, 07000h		; clear VZ video RAM
	ld	de, 07001h
	ld	bc, 007ffh
	ld	(hl), 000h
	ldir

	ld	sp, 0ffffh		; same stack the original sets
	call	vz_build_font_cache
	jp	GAME_ENTRY

; ---------------------------------------------------------------------------
; vz_init_screen_table: the game's own table builder (0xC750) scanned one
; contiguous block of compressed screens; on the VZ200 that block can't sit
; contiguously (video/I-O hole at 0x6800-0x77FF), so the loader split it
; and the builder's scan is patched out (0xC750 jumps here instead).  This
; fills the same table (word per screen index -> stream pointer) from the
; list the patcher generated, and RETURNS TO THE CALLER OF THE BUILDER.
; It must run there, not at boot: the routine around 0xC744 first clears
; the game buffers/table area (call 0xC77E) and the table has to be built
; after that.
; ---------------------------------------------------------------------------
vz_init_screen_table:
	ld	hl, SCREEN_TABLE
	ld	de, SCREEN_TABLE+1
	ld	bc, 001ffh
	ld	(hl), 000h
	ldir
	ld	hl, vz_screen_list
vz_ist_loop:
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	ld	a, d
	and	e
	inc	a
	ret	z			; index word 0FFFFh = end of list
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	push	hl
	ex	de, hl			; HL = index
	add	hl, hl
	ld	de, SCREEN_TABLE
	add	hl, de
	ld	(hl), c
	inc	hl
	ld	(hl), b
	pop	hl
	jr	vz_ist_loop

; ---------------------------------------------------------------------------
; Sound.  The original drives the TRS-80 cassette/DAC port with a 2-bit
; pattern in A.  vz_snd_out_a maps it to the VZ200 speaker bits (0 and 5)
; in the 0x6800 latch (keeping graphics mode 1 = bit 3).  The game's own
; 'S' / 'T' sound-off / sound-on keys store 090h / 0FFh at SND_ENABLE.
; ---------------------------------------------------------------------------
vz_snd_out_a:
	push	af
	ld	a, (SND_ENABLE)
	cp	0ffh
	jr	nz, vz_so_off
	pop	af
	push	af
	and	003h
	jr	z, vz_so_off
	cp	001h
	jr	z, vz_so_1
	cp	002h
	jr	z, vz_so_2
	ld	a, 029h			; both speaker bits
	jr	vz_so_wr
vz_so_1:
	ld	a, 009h
	jr	vz_so_wr
vz_so_2:
	ld	a, 028h
	jr	vz_so_wr
vz_so_off:
	ld	a, 008h
vz_so_wr:
	ld	(06800h), a
	pop	af
	ret

; replaces  out (port),a / push bc / djnz $ x3 / pop bc   (original 0x5C1B)
vz_snd_burst:
	call	vz_snd_out_a
	push	bc
vz_sb1:	djnz	vz_sb1
vz_sb2:	djnz	vz_sb2
vz_sb3:	djnz	vz_sb3
	pop	bc
	ret

; replaces  xor a / out (port),a   (original 0x5C29)
vz_snd_silence:
	xor	a
	call	vz_snd_out_a
	xor	a
	ret

; replaces  ex af,af' / out (port),a / ex af,af'   (original 0xC7F6)
vz_snd_exaf:
	ex	af, af'
	call	vz_snd_out_a
	ex	af, af'
	ret

; replaces  out (port),a / jr 0xC7FC   (original 0xC807)
vz_snd_c807:
	call	vz_snd_out_a
	jp	0c7fch

; ---------------------------------------------------------------------------
; vz_check_fire: replaces the original keyboard poll sub_c9fdh, which was
;     ld a,(038ffh) / ld c,a / ld a,0ffh / cpl / or c / ret
; i.e. A = OR of every TRS-80 keyboard row  ->  NZ when ANY key is down.
; (The first port returned the inverted sense -- "Z = space pressed" --
; which turned every wait-for-key loop inside out.)
; The VZ200 keyboard is active-low: reading 0x6800 selects all rows at once.
; ---------------------------------------------------------------------------
vz_check_fire:
	ld	a, (06800h)
	cpl
	and	03fh			; low 6 bits = key columns; NZ = some key pressed
	ret

; ---------------------------------------------------------------------------
; vz_blit_site1: replaces, at original 0x5577,
;     ld de,3C00h / ld bc,0400h / push bc / ldir
; HL = buffer 4.  Blit + HUD, then do the `push bc` (BC = 0400h) the
; original did, because the code at 0x5583 pops it again.  The first port
; dropped that push; pop bc then took the buffer address as an LDIR count.
; ---------------------------------------------------------------------------
vz_blit_site1:
	call	vz_blit_frame
	call	vz_draw_hud_row
	pop	de			; our return address
	ld	bc, 00400h
	push	bc			; the original's `push bc`
	push	de
	ret

; ---------------------------------------------------------------------------
; vz_read_kbd_3804: replaces ld a,(3804h): 'S' -> 08h (sound off), 'T' -> 10h (sound on)
; ---------------------------------------------------------------------------
vz_read_kbd_3804:
	ld	a, (068fdh)		; Row A1
	bit	1, a			; 'S' -> sound off
	jr	nz, vz_no_s
	ld	a, 008h
	ret
vz_no_s:
	ld	a, (068feh)		; Row A0
	bit	0, a			; 'T' -> sound on
	jr	nz, vz_no_t
	ld	a, 010h
	ret
vz_no_t:
	xor	a
	ret

; ---------------------------------------------------------------------------
; vz_read_kbd_3840: Replaces reading 0x3840 (TRS-80 control row)
; TRS-80 bits:
;   bit 7 = Space (Fire)
;   bit 6 = Right Arrow (or 'X'/'D')
;   bit 5 = Left Arrow  (or 'Z'/'A')
;   bit 4 = Down Arrow  (or 'S')
;   bit 3 = Up Arrow    (or 'W')
;   bit 2 = Break (or 'Q')
;   bit 1 = Clear
;   bit 0 = Enter
; ---------------------------------------------------------------------------
vz_read_kbd_3840:
	push	bc
	ld	b, 000h		; Accumulated result in B

	; 1. Check Space (Fire -> bit 7)
	ld	a, (068efh)	; Row A4
	bit	4, a		; Bit 4 = Space
	jr	nz, vz_k_right
	set	7, b

vz_k_right:
	; 2. Check Right Arrow (bit 6):
	; Row A4: bit 3 = ',' (CTRL+, is right arrow)
	; Row A2: bit 1 = 'X'
	; Row A1: bit 3 = 'D'
	bit	3, a		; Row A4 bit 3 (comma)
	jr	z, vz_set_right
	ld	a, (068fbh)	; Row A2
	bit	1, a		; 'X'
	jr	z, vz_set_right
	ld	a, (068fdh)	; Row A1
	bit	3, a		; 'D'
	jr	nz, vz_k_left
vz_set_right:
	set	6, b

vz_k_left:
	; 3. Check Left Arrow (bit 5):
	; Row A4: bit 5 = 'M' (CTRL+M is left arrow)
	; Row A2: bit 4 = 'Z'
	; Row A1: bit 4 = 'A'
	ld	a, (068efh)	; Row A4
	bit	5, a		; 'M'
	jr	z, vz_set_left
	ld	a, (068fbh)	; Row A2
	bit	4, a		; 'Z'
	jr	z, vz_set_left
	ld	a, (068fdh)	; Row A1
	bit	4, a		; 'A'
	jr	nz, vz_k_down
vz_set_left:
	set	5, b

vz_k_down:
	; 4. Check Down Arrow (bit 4):
	; Row A1: bit 1 = 'S'
	ld	a, (068fdh)	; Row A1
	bit	1, a		; 'S'
	jr	nz, vz_k_up
	set	4, b

vz_k_up:
	; 5. Check Up Arrow (bit 3):
	; Row A4: bit 1 = '.' (CTRL+. is up arrow)
	; Row A0: bit 1 = 'W'
	ld	a, (068efh)	; Row A4
	bit	1, a		; '.'
	jr	z, vz_set_up
	ld	a, (068feh)	; Row A0
	bit	1, a		; 'W'
	jr	nz, vz_k_break
vz_set_up:
	set	3, b

vz_k_break:
	; 6. Check Break / Quit (bit 2):
	; Row A0: bit 4 = 'Q'
	ld	a, (068feh)	; Row A0
	bit	4, a		; 'Q'
	jr	nz, vz_k_enter
	set	2, b

vz_k_enter:
	; 7. Check Enter / Return (bit 0):
	; Row A6 (0x68BF): bit 2 = RETN
	ld	a, (068bfh)	; Row A6
	bit	2, a		; RETN
	jr	nz, vz_k_done
	set	0, b

vz_k_done:
	ld	a, b
	pop	bc
	or	a		; Set flags according to A
	ret

; ---------------------------------------------------------------------------
; vz_blit_frame:
; Fast converter from 1024-byte TRS-80 64x16 screen buffer (at HL)
; to VZ200 MC6847 Mode 1 128x64 display at 0x7000-0x77FF.
;
; Screen layout:
;   - Scanlines 0-7   (0x7000-0x70FF): Top margin
;   - Scanlines 8-55  (0x7100-0x76FF): 16 character rows * 3 scanlines/row
;     = 48 scanlines of 128-pixel playfield!
;   - Scanlines 56-63 (0x7700-0x77FF): Bottom margin
; ---------------------------------------------------------------------------
vz_blit_frame:
	push	af
	push	bc
	push	de
	push	hl

	; DE points to VRAM start of active playfield (Scanline 8 = 0x7100)
	ld	de, 07100h
	ld	b, 010h		; 16 character rows

vz_row_loop:
	push	bc		; Save row counter
	push	hl		; Save start of this character row in buffer

	; Each character row has 3 scanlines on VZ200:
	; Scanline 0: uses bits 0, 1 of each character
	; Scanline 1: uses bits 2, 3 of each character
	; Scanline 2: uses bits 4, 5 of each character

	; --- Scanline 0 ---
	ld	c, 020h		; 32 pairs of characters (64 chars total)
vz_sc0_loop:
	ld	a, (hl)		; Char 0
	inc	hl
	ld	b, (hl)		; Char 1
	inc	hl
	call	vz_conv_pair_row0
	ld	(de), a
	inc	de
	dec	c
	jr	nz, vz_sc0_loop

	; --- Scanline 1 ---
	pop	hl		; Restore start of character row
	push	hl
	ld	c, 020h
vz_sc1_loop:
	ld	a, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	call	vz_conv_pair_row1
	ld	(de), a
	inc	de
	dec	c
	jr	nz, vz_sc1_loop

	; --- Scanline 2 ---
	pop	hl		; Restore start of character row
	ld	c, 020h
vz_sc2_loop:
	ld	a, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	call	vz_conv_pair_row2
	ld	(de), a
	inc	de
	dec	c
	jr	nz, vz_sc2_loop

	pop	bc		; Restore row counter
	djnz	vz_row_loop

	pop	hl
	pop	de
	pop	bc
	pop	af
	ret

; Convert Char A (in register A) and Char B (in register B) to Mode 1 byte
; Row 0: Char A bits 0,1 -> pixels 0,1; Char B bits 0,1 -> pixels 2,3
; 2-bit color 3 (11b = Red or Yellow foreground)
vz_conv_pair_row0:
	push	bc
	ld	c, 000h		; Result
	or	a
	jp	p, vz_c0_p2
	rra			; Bit 0 into Carry
	jr	nc, vz_c0_b1
	set	7, c
	set	6, c
vz_c0_b1:
	rra			; Bit 1 into Carry
	jr	nc, vz_c0_p2
	set	5, c
	set	4, c
vz_c0_p2:
	ld	a, b		; Now test Char B
	or	a
	jp	p, vz_c0_done
	rra			; Bit 0 into Carry
	jr	nc, vz_c0_b3
	set	3, c
	set	2, c
vz_c0_b3:
	rra			; Bit 1 into Carry
	jr	nc, vz_c0_done
	set	1, c
	set	0, c
vz_c0_done:
	ld	a, c
	pop	bc
	ret

; Row 1: Char A bits 2,3 -> pixels 0,1; Char B bits 2,3 -> pixels 2,3
vz_conv_pair_row1:
	push	bc
	ld	c, 000h
	or	a
	jp	p, vz_c1_p2
	rrca			; Shift bits 2,3 into bits 0,1
	rrca
	rra
	jr	nc, vz_c1_b1
	set	7, c
	set	6, c
vz_c1_b1:
	rra
	jr	nc, vz_c1_p2
	set	5, c
	set	4, c
vz_c1_p2:
	ld	a, b
	or	a
	jp	p, vz_c1_done
	rrca
	rrca
	rra
	jr	nc, vz_c1_b3
	set	3, c
	set	2, c
vz_c1_b3:
	rra
	jr	nc, vz_c1_done
	set	1, c
	set	0, c
vz_c1_done:
	ld	a, c
	pop	bc
	ret

; Row 2: Char A bits 4,5 -> pixels 0,1; Char B bits 4,5 -> pixels 2,3
vz_conv_pair_row2:
	push	bc
	ld	c, 000h
	or	a
	jp	p, vz_c2_p2
	rrca
	rrca
	rrca
	rrca
	rra
	jr	nc, vz_c2_b1
	set	7, c
	set	6, c
vz_c2_b1:
	rra
	jr	nc, vz_c2_p2
	set	5, c
	set	4, c
vz_c2_p2:
	ld	a, b
	or	a
	jp	p, vz_c2_done
	rrca
	rrca
	rrca
	rrca
	rra
	jr	nc, vz_c2_b3
	set	3, c
	set	2, c
vz_c2_b3:
	rra
	jr	nc, vz_c2_done
	set	1, c
	set	0, c
vz_c2_done:
	ld	a, c
	pop	bc
	ret

; ---------------------------------------------------------------------------
; vz_draw_glyph: draws one cached 8x8 font tile to VRAM.
; In: A = char code (0-63, i.e. ascii AND 0x3Fh), DE = dest VRAM address
;     (top-left byte of the 8x8 cell; must be byte-aligned, i.e. an even
;     x-pixel boundary).
; Destroys AF, BC, HL. DE is preserved (walked forward internally to
; write all 8 rows, then restored) -- safe for a caller to reuse DE
; immediately after the call without reloading it.
;
; Verified in a Z80 emulator against the real ROM font, rendering to a
; decoded PNG for visual inspection ("HUD OK" test) -- caught a real bug
; this way (missing the second INC DE per row, which silently shifted
; every row after the first one byte early) before this was wired in.
; A second bug (DE not preserved, silently corrupting any caller that
; assumed it was) was caught the same way testing vz_draw_hud_row and
; fixed here rather than patched around at each call site.
; ---------------------------------------------------------------------------
vz_draw_glyph:
	push	af
	push	bc
	push	de
	ld	h, 0
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl		; hl = char_code * 16
	ld	bc, TILE_CACHE		; FONT_TILE_CACHE
	add	hl, bc
	ld	b, 8
vdg_row_loop:
	ld	a, (hl)
	ld	(de), a
	inc	hl
	inc	de
	ld	a, (hl)
	ld	(de), a
	inc	hl
	inc	de
	push	af
	ld	a, e
	add	a, 30
	ld	e, a
	ld	a, d
	adc	a, 0
	ld	d, a
	pop	af
	djnz	vdg_row_loop
	pop	de		; discard the walked value, restore caller's original DE
	pop	bc
	pop	af
	ret

; ---------------------------------------------------------------------------
; vz_draw_hud_row: renders a compact summary of the one-row HUD (buffer 4
; row 15, VZ 0x53C0-0x53FF -- see HUD_FIELDS.md) into the bottom VZ margin
; (0x7700-0x771F). Called once per frame from render site 1, right after
; vz_blit_frame blits buffer 4 -- this is the only site confirmed to be
; the live gameplay HUD (sites 2-4 blit buffer 0 for title/announcement
; screens; site 5 is an unrelated transition effect).
;
; 8px/cell (Option A), 16 cells available, 14 used:
;   cell:   0    1-5        6   7    8-9      10   11   12-13
;   text: 'S'  score(5)   sp  'L'  level(2)  sp  'G'  ghost(2)
; Score is the last 5 of the source field's 9 chars (right-justified,
; space-padded, ones digit fixed at the end -- taking the last 5 keeps
; that alignment and just caps displayable width at 99999).
;
; Destroys AF, BC, DE, HL.
; ---------------------------------------------------------------------------
vz_draw_hud_row:
	ld	de, 07700h
	ld	a, 013h		; 'S'
	call	vz_draw_glyph
	ld	hl, HUD_SCORE		; score field, last 5 chars (row cols 12-16)
	ld	de, 07702h
	ld	b, 5
vhr_score_loop:
	ld	a, (hl)
	and	03fh
	push	hl
	push	bc
	call	vz_draw_glyph	; DE is preserved by vz_draw_glyph itself
	pop	bc
	pop	hl
	inc	hl
	ld	a, e
	add	a, 2
	ld	e, a
	ld	a, d
	adc	a, 0
	ld	d, a
	djnz	vhr_score_loop
	; de is now 0770ch (cell 6) -- leave it blank as a separator
	ld	de, 0770eh		; cell 7
	ld	a, 00ch		; 'L'
	call	vz_draw_glyph
	ld	de, 07710h		; cell 8
	ld	a, (HUD_LEVEL10)		; level tens digit
	and	03fh
	call	vz_draw_glyph
	ld	de, 07712h		; cell 9
	ld	a, (HUD_LEVEL1)		; level ones digit
	and	03fh
	call	vz_draw_glyph
	; cell 10 left blank as a separator
	ld	de, 07716h		; cell 11
	ld	a, 007h		; 'G'
	call	vz_draw_glyph
	ld	de, 07718h		; cell 12
	ld	a, (HUD_GHOST10)		; ghost tens digit
	and	03fh
	call	vz_draw_glyph
	ld	de, 0771ah		; cell 13
	ld	a, (HUD_GHOST1)		; ghost ones digit
	and	03fh
	call	vz_draw_glyph
	ret

; ---------------------------------------------------------------------------
; Text-mode font cache (see texmode-issues.md).
;
; Converts the corrected PRN_GFX_FONT table (embedded at vz_font_src; the
; ROM copy at 0x3B94 has typos and is no longer read) (64 glyphs, 5
; bytes each, column-major, INVERTED polarity -- confirmed against the
; ROM's own "inverse character output" comment and the space glyph
; being 0xFF x5) into 64 cached 8x8 Mode-1 tiles (16 bytes each, 2
; bits/pixel) at FONT_TILE_CACHE. Source glyph is 5 columns wide,
; placed left-aligned in the 8-wide cell with 3 blank padding columns.
; "On" pixel = 2-bit value 3, matching vz_blit_frame's convention.
;
; Row-bit-order is bit0=top row, bit7=bottom row -- confirmed by
; rendering multiple asymmetric letters (U, L, P, F, A, B) both ways
; and comparing: bit7-top produced backwards/mirrored letterforms
; (U rendered as an arch, L as a mirrored Γ, etc.), bit0-top rendered
; all of them correctly. Symmetric letters like H or O look fine
; either way, which is why the original single-glyph 'H' test didn't
; catch this.
;
; Verified independently: ran this exact routine against the real
; ROM font bytes in a Z80 emulator and diffed the output byte-for-byte
; against a from-scratch Python reference implementation of the same
; spec -- exact match across all 64 glyphs (1024 bytes) before this
; was wired into the build.
; ---------------------------------------------------------------------------
vz_build_font_cache:
	ld	hl, vz_font_src	; corrected copy embedded below (NOT the ROM's)
	ld	de, TILE_CACHE		; FONT_TILE_CACHE
	ld	b, 64
fc_glyph_loop:
	push	bc
	push	hl
	push	de
	call	vz_convert_glyph
	pop	de
	pop	hl
	pop	bc
	ld	a,l
	add	a,5
	ld	l,a
	ld	a,h
	adc	a,0
	ld	h,a
	ld	a,e
	add	a,16
	ld	e,a
	ld	a,d
	adc	a,0
	ld	d,a
	djnz	fc_glyph_loop
	ret

; vz_convert_glyph: HL=src glyph(5 bytes), DE=dst tile(16 bytes).
; Both preserved (caller advances). Destroys AF,BC.
vz_convert_glyph:
	ld	(fc_src), hl
	ld	(fc_dst_row), de
	xor	a
	ld	(fc_row), a
fc_row_loop:
	ld	hl, fc_row
	ld	b,(hl)
	ld	a,001h
fc_mask_loop:
	ld	c,a
	ld	a,b
	or	a
	jr	z, fc_mask_done
	dec	b
	ld	a,c
	sla	a
	jr	fc_mask_loop
fc_mask_done:
	ld	a,c
	ld	(fc_rowmask), a

	xor	a
	ld	(fc_acc), a
	ld	hl,(fc_src)
	ld	a,(fc_rowmask)
	call	fc_pixel
	call	fc_accum
	inc	hl
	ld	a,(fc_rowmask)
	call	fc_pixel
	call	fc_accum
	inc	hl
	ld	a,(fc_rowmask)
	call	fc_pixel
	call	fc_accum
	inc	hl
	ld	a,(fc_rowmask)
	call	fc_pixel
	call	fc_accum
	ld	a,(fc_acc)
	ld	de,(fc_dst_row)
	ld	(de),a
	inc	de
	ld	(fc_dst_row),de

	xor	a
	ld	(fc_acc), a
	inc	hl
	ld	a,(fc_rowmask)
	call	fc_pixel
	call	fc_accum
	xor	a
	call	fc_accum
	xor	a
	call	fc_accum
	xor	a
	call	fc_accum
	ld	a,(fc_acc)
	ld	de,(fc_dst_row)
	ld	(de),a
	inc	de
	ld	(fc_dst_row),de

	ld	a,(fc_row)
	inc	a
	ld	(fc_row),a
	cp	8
	jp	nz, fc_row_loop
	ret

; fc_pixel: In HL->src byte, A=rowmask. Out A=0 or 3. Destroys B.
fc_pixel:
	ld	b,(hl)
	and	b
	jr	z, fc_pixel_on
	xor	a
	ret
fc_pixel_on:
	ld	a,3
	ret

; fc_accum: A_in=pixel(0/3). fc_acc = fc_acc*4 + A_in.
fc_accum:
	push	af
	ld	a,(fc_acc)
	sla	a
	sla	a
	ld	b,a
	pop	af
	or	b
	ld	(fc_acc), a
	ret

fc_src:      defw 0
fc_row:      defb 0
fc_rowmask:  defb 0
fc_acc:      defb 0
fc_dst_row:  defw 0

; End of HAL
