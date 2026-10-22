; =============================================================================
; hal_vz.asm -- VZ200/RC39 replacement routines for 13 Ghosts (port v8)
;
; Assembled by port_13ghosts_v8.py at HAL_BASE together with the corrected font
; table and the compressed-screen list; the patched TRS-80 image calls into
; these routines.  EQUs (HAL_BASE, FONT3_CACHE, ...) are emitted by the script.
; =============================================================================

; ---------------------------------------------------------------------------
; vz_boot -- runs once, after the last tape file (this one) has loaded.
; Everything else of the game is already at its ORIGINAL TRS-80 address
; (see port_13ghosts_v8.py); this routine only prepares the VZ200/RC39.
; ---------------------------------------------------------------------------
BLIT_PAGE EQU 0f6h		; 6 pages F600-FBFF: blit lookup tables (runtime)

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
	call	vz_build_font3
	call	vz_build_blit_tables
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
; sound handler (sub_5507h, driven by 'T' through vz_read_kbd_3804) stores 090h / 0FFh at SND_ENABLE.
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
	; T-toggle latch (see vz_read_kbd_3804): re-arm it whenever T is up.  While T
	; is down during the demo, hold it disarmed so the key that leaves the demo
	; doesn't also toggle the sound once the game starts.
	ld	a, (068feh)		; Row A0: 'T' = bit 0, active low
	rra				; carry = 1 when T is up
	jr	c, vz_cf_tup
	ld	a, (061cfh)		; game flags: bit 0 = demo running
	rra
	jr	nc, vz_cf_scan		; in a real game: leave the latch alone
	ld	a, 001h			; demo: swallow this press
	jr	vz_cf_set
vz_cf_tup:
	xor	a				; T up: re-arm
vz_cf_set:
	ld	(vz_t_down), a
vz_cf_scan:
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
	ld	a, (vz_margin_dirty)	; gameplay redraws the HUD every frame, so it must NOT
	and	1			; be wiped here: drop the HUD bit, keep a pending credits wipe
	ld	(vz_margin_dirty), a
	call	vz_blit_frame
	call	vz_draw_hud_row
	pop	de			; our return address
	ld	bc, 00400h
	push	bc			; the original's `push bc`
	push	de
	ret

; ---------------------------------------------------------------------------
; Keyboard.  Controls:  W / A / S / D = up / left / down / right,
; Space = fire, Ctrl+Q = restart, Return = enter, T = toggle sound on/off.
; (The VZ200 keyboard is active-low: a pressed key reads as 0.)
; ---------------------------------------------------------------------------

; ---------------------------------------------------------------------------
; vz_read_kbd_3804: replaces ld a,(3804h), which the game's S/T handler
; (sub_5507h) reads as 08h = sound off, 10h = sound on.  'T' is a toggle: on
; each fresh press this returns 08h if sound is currently on (SND_ENABLE = 0FFh)
; and 10h if it is off, so the game's own handler stores the opposite value.
; Returns 0 while T is up or still held from an earlier poll.  vz_t_down is
; the "already toggled for this press" latch; vz_check_fire re-arms it.
; ---------------------------------------------------------------------------
vz_read_kbd_3804:
	ld	a, (068feh)		; Row A0
	bit	0, a			; 'T'
	jr	nz, vz_no_t		; not pressed
	ld	a, (vz_t_down)
	or	a
	jr	nz, vz_no_t		; still held: already toggled for this press
	inc	a
	ld	(vz_t_down), a
	ld	a, (SND_ENABLE)
	cp	0ffh
	ld	a, 008h			; sound is on  -> ask the game for "off"
	ret	z
	ld	a, 010h			; sound is off -> ask the game for "on"
	ret
vz_no_t:
	xor	a
	ret

vz_t_down:
	defb	000h

; ---------------------------------------------------------------------------
; vz_read_kbd_3840: Replaces reading 0x3840 (TRS-80 control row)
; TRS-80 bits:
;   bit 7 = Space  (Fire)
;   bit 6 = Right  ('D')
;   bit 5 = Left   ('A')
;   bit 4 = Down   ('S')
;   bit 3 = Up     ('W')
;   bit 2 = Break  (Ctrl+Q)
;   bit 1 = Clear  (Ctrl+Q)
;   bit 0 = Enter  (Return)
; Ctrl+Q sets Break and Clear together: the TRS-80's own Clear+Break chord, which
; the game's main loop tests for as exactly 06h and answers by restarting at the
; title (jp 537Dh).  Q on its own does nothing, so it can't be hit by accident.
; ---------------------------------------------------------------------------
vz_read_kbd_3840:
	push	bc
	ld	b, 000h		; Accumulated result in B

	; 1. Space (Fire -> bit 7).  Row A4: bit 4 = Space
	ld	a, (068efh)	; Row A4
	bit	4, a
	jr	nz, vz_k_right
	set	7, b

vz_k_right:
	; 2. Row A1 (0x68FD): bit 3 = 'D' (right), bit 4 = 'A' (left), bit 1 = 'S' (down)
	ld	a, (068fdh)	; Row A1
	ld	c, a		; keep it: bit 2 = CTRL, used for Ctrl+Q below
	bit	3, a		; 'D'
	jr	nz, vz_k_left
	set	6, b

vz_k_left:
	bit	4, a		; 'A'
	jr	nz, vz_k_down
	set	5, b

vz_k_down:
	bit	1, a		; 'S'
	jr	nz, vz_k_up
	set	4, b

vz_k_up:
	; 3. Row A0 (0x68FE): bit 1 = 'W' (up), bit 4 = 'Q' (restart, only with CTRL)
	ld	a, (068feh)	; Row A0
	bit	1, a		; 'W'
	jr	nz, vz_k_break
	set	3, b

vz_k_break:
	bit	4, a		; 'Q'
	jr	nz, vz_k_enter
	bit	2, c		; CTRL (Row A1 bit 2, active low)
	jr	nz, vz_k_enter
	set	2, b		; Break
	set	1, b		; + Clear

vz_k_enter:
	; 4. Enter / Return (bit 0).  Row A6 (0x68BF): bit 2 = RETN
	ld	a, (068bfh)	; Row A6
	bit	2, a		; RETN
	jr	nz, vz_k_done
	set	0, b

vz_k_done:
	ld	a, b
	pop	bc
	or	a		; Set flags according to A
	ret

; ==== BEGIN GENERATED BLIT (gen_blit.py) ====
; ---------------------------------------------------------------------------
; vz_blit_frame:  1024-byte TRS-80 64x16 screen buffer (HL) -> VZ200 MC6847
; mode 1 (128x64) at 0x7100-0x76FF.  Preserves AF BC DE HL IX.
;
; Each TRS-80 graphics char (bit 7 set) holds a 2x3 block; chars with bit 7
; clear draw blank (same as the first version).  One VRAM byte = 2 chars x
; 2 pixels x 2 bits, so each scanline byte is  HI[chA] | LO[chB]  where HI/LO
; are 256-byte page-aligned tables built at boot by vz_build_blit_tables:
;     page BLIT_PAGE+r    : HI form for scanline r (left char:  bits 7-4)
;     page BLIT_PAGE+3+r  : LO form for scanline r (right char: bits 3-0)
; H/D hold the table pages, L/E the chars.  The 32 pairs of a row are fully
; unrolled (dest = IX+n) and the scanline order zigzags 0-1-2 / 2-1-0 so
; the table pages never need resetting.  ~150 T-states per pair-of-3-scanlines
; versus ~620 average before.
; ---------------------------------------------------------------------------
; vz_blit_rows4: partial blit of the BOTTOM FOUR character rows (rows 12-15 =
; VZ scanlines 44-55).  HL = source of char row 12 (the game's 0CD12h for the
; game-over summary), i.e. the 256 bytes the original LDIR'd to 3F00h.
; Same margin-flag check and register contract as vz_blit_frame.
vz_blit_rows4:
	push	af
	push	bc
	push	de
	push	hl
	push	ix
	ld	a, (vz_margin_dirty)	; HUD or title credits left in the margins?
	or	a
	call	nz, vz_margin_clear	; (preserves HL)
	ld	ix, 07100h+12*96	; scanline 36 of the playfield
	ld	a, 4			; 4 character rows
	jp	vz_bl_go

vz_blit_frame:
	push	af
	push	bc
	push	de
	push	hl
	push	ix
	ld	a, (vz_margin_dirty)	; HUD or title credits left in the margins?
	or	a
	call	nz, vz_margin_clear	; (preserves HL; BC/DE/A are reloaded below)
	ld	ix, 07100h		; first playfield scanline
	ld	a, 16			; 16 character rows
vz_bl_go:
	ld	b, h
	ld	c, l			; BC = source
	ld	h, BLIT_PAGE
	ld	d, BLIT_PAGE+3
	push	af			; row counter lives on the stack
vz_bl_row:
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+0), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+32), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+64), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+65), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+33), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+1), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+2), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+34), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+66), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+67), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+35), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+3), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+4), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+36), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+68), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+69), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+37), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+5), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+6), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+38), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+70), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+71), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+39), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+7), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+8), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+40), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+72), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+73), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+41), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+9), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+10), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+42), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+74), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+75), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+43), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+11), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+12), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+44), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+76), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+77), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+45), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+13), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+14), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+46), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+78), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+79), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+47), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+15), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+16), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+48), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+80), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+81), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+49), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+17), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+18), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+50), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+82), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+83), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+51), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+19), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+20), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+52), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+84), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+85), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+53), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+21), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+22), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+54), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+86), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+87), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+55), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+23), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+24), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+56), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+88), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+89), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+57), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+25), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+26), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+58), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+90), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+91), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+59), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+27), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+28), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+60), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+92), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+93), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+61), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+29), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+30), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+62), a
	inc	h
	inc	d
	ld	a, (de)
	or	(hl)
	ld	(ix+94), a
	ld	a, (bc)
	inc	bc
	ld	l, a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	a, (de)
	or	(hl)
	ld	(ix+95), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+63), a
	dec	h
	dec	d
	ld	a, (de)
	or	(hl)
	ld	(ix+31), a
	push	de
	ld	de, 96			; next character row = 3 scanlines * 32 bytes
	add	ix, de
	pop	de
	pop	af
	dec	a
	push	af
	jp	nz, vz_bl_row
	pop	af
	pop	ix
	pop	hl
	pop	de
	pop	bc
	pop	af
	ret

; ---------------------------------------------------------------------------
; vz_build_blit_tables: fills the six 256-byte pages at BLIT_PAGE (runs once,
; from vz_boot).  Char c -> s = c if bit 7 set else 0.  For scanline r the
; two bits (s >> 2r) & 3 give  HI = (b0 ? C0h : 0) | (b1 ? 30h : 0),  LO = HI >> 4.
; ---------------------------------------------------------------------------
vz_build_blit_tables:
	ld	c, 0
vbt_char:
	ld	a, c
	bit	7, a
	jr	nz, vbt_ok
	xor	a
vbt_ok:
	ld	b, a			; B = effective char
	ld	h, BLIT_PAGE
	ld	l, c
	ld	a, b
	call	vbt_pair		; scanline 0
	inc	h
	ld	a, b
	srl	a
	srl	a
	call	vbt_pair		; scanline 1
	inc	h
	ld	a, b
	srl	a
	srl	a
	srl	a
	srl	a
	call	vbt_pair		; scanline 2
	inc	c
	jr	nz, vbt_char
	ret

; A = (char >> 2r); writes HI form to (HL) and LO form to (HL+0300h). Keeps HL.
vbt_pair:
	ld	e, 0
	rra
	jr	nc, vbp1
	ld	e, 0c0h
vbp1:
	rra
	jr	nc, vbp2
	set	5, e
	set	4, e
vbp2:
	ld	(hl), e
	ld	a, e
	rrca
	rrca
	rrca
	rrca
	push	hl
	push	de
	ld	de, 00300h
	add	hl, de
	pop	de
	ld	(hl), a
	pop	hl
	ret
; ==== END GENERATED BLIT ====


; ---------------------------------------------------------------------------
; 3x5 HUD font (font-asset-research/font_3x5.asm, CC0, A. Earfalas).
;
; A glyph is 3 pixels of ink + 1 blank pixel = 4 pixels = exactly ONE byte in
; Mode 1 (2 bits/pixel), so every glyph row is one byte and every cell is
; byte-aligned: no shifting, 32 cells per 128-pixel line.  Cell pitch is 4x6.
;
; vz_font3_src holds 64 glyphs packed 15 bits in 2 bytes (see the generated
; table at the end of this file).  vz_build_font3 expands them at boot into
; FONT3_CACHE: 64 glyphs x 5 bytes (one byte per glyph row, ink = pixel value
; 3, left pixel in bits 7-6, 4th pixel blank) = 320 bytes.
;
; Character index = ASCII & 3Fh after upper-casing: 20h-3Fh -> 20h-3Fh
; (space, digits, punctuation), 40h-5Fh -> 00h-1Fh (@, A-Z, ...).
; ---------------------------------------------------------------------------
vz_build_font3:
	ld	hl, vz_font3_src
	ld	ix, FONT3_CACHE
	ld	a, 64
	ld	(f3_cnt), a
f3_glyph:
	ld	b, (hl)			; BC = 15-bit glyph, row 0 in bits 14-12
	inc	hl
	ld	c, (hl)
	inc	hl
	push	hl
	call	f3_next
	ld	(ix+4), a		; bits 2-0   = row 4
	call	f3_next
	ld	(ix+3), a
	call	f3_next
	ld	(ix+2), a
	call	f3_next
	ld	(ix+1), a
	call	f3_next
	ld	(ix+0), a		; bits 14-12 = row 0
	ld	de, 5
	add	ix, de
	pop	hl
	ld	a, (f3_cnt)
	dec	a
	ld	(f3_cnt), a
	jr	nz, f3_glyph
	ret

; f3_next: A = Mode 1 byte for the low 3 bits of BC (bit 2 = left pixel),
; then BC >>= 3.  Destroys DE, HL.
f3_next:
	ld	a, c
	and	7
	ld	e, a
	ld	d, 0
	ld	hl, f3_exp
	add	hl, de
	ld	a, (hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ret

f3_exp:	defb	000h, 00ch, 030h, 03ch, 0c0h, 0cch, 0f0h, 0fch	; 3 pixels -> byte
f3_cnt:	defb	0

; ---------------------------------------------------------------------------
; vz_draw3: draw one 3x5 glyph.
; In:  A = TRS-80 screen character (lower case is upper-cased), DE = VRAM
;      address of the cell's first scanline byte.
; Out: DE = address of the next cell (DE+1).  Preserves AF? no: destroys AF;
;      preserves BC, HL.  Writes 5 bytes, 32 apart.
; ---------------------------------------------------------------------------
vz_draw3:
	push	hl
	push	bc
	cp	060h
	jr	c, v3_up
	sub	020h			; a-z -> A-Z
v3_up:
	and	03fh
	ld	l, a
	ld	h, 0
	ld	c, l
	ld	b, h
	add	hl, hl
	add	hl, hl
	add	hl, bc			; HL = index * 5
	ld	bc, FONT3_CACHE
	add	hl, bc
	push	de
	ld	b, 5
v3_row:
	ld	a, (hl)
	ld	(de), a
	inc	hl
	ld	a, e
	add	a, 32
	ld	e, a
	ld	a, d
	adc	a, 0
	ld	d, a
	djnz	v3_row
	pop	de
	inc	de
	pop	bc
	pop	hl
	ret

; vz_puts3: draw a zero-terminated string.  HL = string, DE = first cell.
; Out: DE = next cell.  Destroys AF, HL.
vz_puts3:
	ld	a, (hl)
	or	a
	ret	z
	inc	hl
	call	vz_draw3
	jr	vz_puts3

; ---------------------------------------------------------------------------
; vz_draw_hud_row: two-line HUD, called once per frame from render site 1 right after
; vz_blit_frame.  Ink rows are 57-61 (one blank scanline above, two below);
; cell 0 and cell 31 stay blank as side margins.
;
;   Top margin (VZ rows 0-7, ink rows 2-6): the game's 17-character level-name
;   field (HUD row cols 22-38: "13 GHOSTS", "Dead of Night", ...) exactly as
;   the game holds it -- it is already space-padded/centred -- in cells 7-23.
;   No label.  Lower case is upper-cased by vz_draw3.
;
;   Bottom margin (VZ rows 56-63, 0x7700-0x77FF), ink rows 57-61:
;   cell: 1     6 7-15       16     22 23-24    25  28 29-30
;   text: SCORE_ ddddddddd   _LEVEL_ dd       _GH_  dd              (30 cells)
;
; Score = the game's whole 9-character score field (template cols 8-16, space
; padded; the ones digit is never incremented, so it is always 0).  The game's
; carry stops at col 7 (the ':' of "Score:", which would become ';') -- outside
; the field, only reachable past 999,999,999.
; Destroys AF, BC, DE, HL.
; ---------------------------------------------------------------------------
HUD_ROW_ADDR EQU 07721h		; row 57, cell 1
HUD_NAME_ADDR EQU 07047h		; row 2, cell 7 (17 cells: 7-23)
HUD_ROW_BASE EQU 0DDD2h		; buffer 4 row 15: the game's per-frame copy of its HUD row template

vz_draw_hud_row:
	push	ix
	ld	ix, HUD_ROW_BASE	; buffer 4 row 15, refreshed from the template every frame
	call	vz_hud_from_ix
	pop	ix
	ret

; vz_hud_from_ix: draw the two HUD lines from a 64-byte HUD row at IX (buffer 4's
; copy at DDD2h during play, the game's own template at 61D5h on the win screen).
; Field offsets in the row: score +8 (9 chars), level name +22 (17), level digits
; +50/+51, ghost digits +61/+62.  Destroys AF, BC, DE, HL (IX untouched).
vz_hud_from_ix:
	push	ix
	pop	hl
	ld	bc, 22
	add	hl, bc			; HL = level-name field
	ld	de, HUD_NAME_ADDR	; top margin: level-name string only, no label
	ld	b, 17
vhr_name:
	ld	a, (hl)
	inc	hl
	call	vz_draw3
	djnz	vhr_name
	ld	de, HUD_ROW_ADDR
	ld	hl, hud_s_score
	call	vz_puts3
	push	ix
	pop	hl
	ld	bc, 8
	add	hl, bc			; HL = score field
	ld	b, 9
vhr_score:
	ld	a, (hl)
	inc	hl
	call	vz_draw3
	djnz	vhr_score
	ld	hl, hud_s_level
	call	vz_puts3
	ld	a, (ix+50)
	call	vz_draw3
	ld	a, (ix+51)
	call	vz_draw3
	ld	hl, hud_s_ghosts
	call	vz_puts3
	ld	a, (ix+61)
	call	vz_draw3
	ld	a, (ix+62)
	call	vz_draw3
	ld	a, (vz_margin_dirty)	; HUD is on screen: the next blit that is not the
	or	2			; gameplay one (game over, demo end, any other
	ld	(vz_margin_dirty), a	; screen) wipes the margins
	ret

; ---------------------------------------------------------------------------
; Win screen status row.  After the last level the game draws screen 39
; ("YOU BEAT 13 GHOSTS!"), puts the first level-name string ("13 GHOSTS") and a
; '*' (the winner marker, first character of the score field) into its HUD row
; template at 61D5h, and copied the 64-byte row to the TRS-80 screen at 3FC0h
; (0x56A7, `ld de,3FC0h / ld bc,0040h / ldir`, HL = 61D5h).  Patched to draw it
; with the HUD routine instead.  Bit 0 keeps it until the next non-gameplay blit.
; ---------------------------------------------------------------------------
vz_win_row:
	push	af
	push	bc
	push	de
	push	hl
	push	ix
	push	hl
	pop	ix			; IX = the game's HUD row template
	call	vz_hud_from_ix
	ld	a, (vz_margin_dirty)
	or	1
	ld	(vz_margin_dirty), a
	pop	ix
	pop	hl
	pop	de
	pop	bc
	pop	af
	ret

hud_s_score:	defm	"SCORE ", 0
hud_s_level:	defm	" LEVEL ", 0
hud_s_ghosts:	defm	" GH ", 0

; ---------------------------------------------------------------------------
; Title credits, three pages of up to three centred 3x5 lines in rows 41-63
; (the logo ends on VZ row 39).  The full original credit text is kept, split
; into pages that follow the title's own timeline:
;   page 1  after the slide-in has put the logo in place (vz_title_draw, patched
;           in at 0x5396, the game's FINAL static draw), shown through the tune;
;   page 2  as the idle wait for a key starts (vz_title_wait, patched in at
;           0x53FF in place of `call sub_c9eeh`, B = 2);
;   page 3  after the first of that wait's two ~2.8 s passes.
; The music engine is not touched: it is cycle-counted, so nothing is drawn
; while it runs.  Rows 56-63 are the bottom margin, so bit 0 of
; vz_margin_dirty makes the next vz_blit_frame (any screen) wipe them.
; ---------------------------------------------------------------------------
vz_title_draw:
	call	06012h			; the original draw (HL = screen list)
	push	hl
	ld	hl, cred_p1
	call	vz_credits_page
	ld	a, (vz_margin_dirty)
	or	1
	ld	(vz_margin_dirty), a
	pop	hl
	ret

; vz_title_wait: same two passes of 65536 key polls as sub_c9eeh (B = 2 on entry),
; same return convention (NZ + A = key, or Z + A = 0 on timeout), with the pages
; flipped on the way.  The poll loop has the same instructions as the original.
vz_title_wait:
	ld	hl, cred_p2
	call	vz_credits_page
	ld	de, 0
vtw_poll:
	call	0c9fdh			; sub_c9fdh: the key poll (patched to vz_check_fire)
	ret	nz
	dec	de
	ld	a, e
	or	d
	jr	nz, vtw_poll
	ld	a, b			; end of a pass: after the first one (B = 2) show page 3
	cp	2
	jr	nz, vtw_next
	ld	hl, cred_p3
	call	vz_credits_page
vtw_next:
	djnz	vtw_poll
	xor	a			; timed out: Z, A = 0 like the original
	ret

; vz_credits_page: HL = page (word pairs: row base address, string; ended by 0).
; Blanks rows 41-63 first, then draws every line centred.  Preserves all registers.
vz_credits_page:
	push	af
	push	bc
	push	de
	push	hl
	push	hl
	ld	hl, 07000h+41*32
	ld	de, 07000h+41*32+1
	ld	bc, 23*32-1
	ld	(hl), 0
	ldir
	pop	hl
vcp_line:
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	ld	a, d
	or	e
	jr	z, vcp_done
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	push	hl
	ld	h, b
	ld	l, c
	call	vz_puts3c
	pop	hl
	jr	vcp_line
vcp_done:
	pop	hl
	pop	de
	pop	bc
	pop	af
	ret

; vz_puts3c: draw the zero-terminated string at HL centred on the 32-cell line
; whose first cell is at DE.  Destroys AF, BC, DE, HL.
vz_puts3c:
	push	hl
	ld	b, 0
vpc_len:
	ld	a, (hl)
	or	a
	jr	z, vpc_go
	inc	hl
	inc	b
	jr	vpc_len
vpc_go:
	ld	a, 32
	sub	b
	srl	a			; (32 - length) / 2
	add	a, e
	ld	e, a
	jr	nc, vpc_nc
	inc	d
vpc_nc:
	pop	hl
	jp	vz_puts3

; pages: lines are 6 rows apart; three lines start on row 44, two on row 47
cred_p1:	defw	07000h+44*32, cred_s1, 07000h+50*32, cred_s2, 07000h+56*32, cred_s3, 0
cred_p2:	defw	07000h+44*32, cred_s4, 07000h+50*32, cred_s5, 07000h+56*32, cred_s6, 0
cred_p3:	defw	07000h+47*32, cred_s7, 07000h+53*32, cred_s8, 0

; vz_margin_clear: blank both 8-row margins (rows 0-7 = 7000h-70FFh, rows 56-63 =
; 7700h-77FFh), which the screen blit never touches, and clear the flags.
; The flag byte vz_margin_dirty: bit 0 = title credits drawn, bit 1 = gameplay HUD
; drawn (set by vz_draw_hud_row, dropped again by vz_blit_site1 every frame).
; Bit 0 also covers the game-over summary (vz_gameover_blit).
; Preserves HL; destroys AF, BC, DE.
vz_margin_clear:
	push	hl
	ld	hl, 07000h
	ld	de, 07001h
	ld	bc, 000ffh
	ld	(hl), 0
	ldir
	ld	hl, 07700h
	ld	de, 07701h
	ld	bc, 000ffh
	ld	(hl), 0
	ldir
	xor	a
	ld	(vz_margin_dirty), a
	pop	hl
	ret

vz_margin_dirty:	defb	0
cred_s1:	defm	"(C) 1983 BRYAN EGGERS AND", 0
cred_s2:	defm	"LARRY PAYNE", 0
cred_s3:	defm	"MUSIC AND SOUND BY FANFARE", 0
cred_s4:	defm	"(C) 1982 JON BOKELMAN.", 0
cred_s5:	defb	34, "13 GHOSTS", 34, " AND ", 34, "FANFARE", 34, " ARE", 0	; "13 GHOSTS" AND "FANFARE" ARE
cred_s6:	defm	"TRADEMARKS OF SOFTWARE AFFAIR.", 0
cred_s7:	defm	"LICENSED TO TANDY CORPORATION -", 0
cred_s8:	defm	"ALL RIGHTS RESERVED.", 0

; ---------------------------------------------------------------------------
; Game-over summary.  sub_5b6dh builds "Final Score / score", "Ghost: n" and
; "Level: n" as TRS-80 text in rows 12-13 of buffer 0 (0CD12h = row 12), then
; copies rows 12-15 to the TRS-80 screen (3F00h).  Patched in at 0x5BA2,
; replacing that `ld de,3F00h / ld bc,0100h / ldir`; HL = 0CD12h.
;   1. vz_blit_rows4 draws rows 12-15 (the skull's jaw / GAME OVER banner;
;      the text cells are bit-7-clear, so they come out blank);
;   2. the summary is redrawn in 3x5 in the free margins, reading the live
;      digits out of the buffer the game just filled in:
;        top margin    (row 2, cell 5):   FINAL SCORE ddddddddd
;        bottom margin (row 57, cell 6):  LEVEL dd  GHOSTS dd
; The game-over loop calls this ten times (banner and plain skull alternate);
; the text is identical every time.  Bit 0 of vz_margin_dirty keeps it until the
; next screen that is not gameplay wipes the margins.
; Buffer offsets from 0CD12h: score +67 (9 chars), ghost digits +57/+58,
; level digits +121/+122.
; ---------------------------------------------------------------------------
GO_LINE1 EQU 07000h+2*32+5
GO_LINE2 EQU 07000h+57*32+6

vz_gameover_blit:
	push	af
	push	bc
	push	de
	push	hl
	push	ix
	push	hl
	pop	ix			; IX = buffer row 12
	call	vz_blit_rows4		; (preserves HL)
	ld	de, GO_LINE1
	ld	hl, go_s_final
	call	vz_puts3
	push	ix
	pop	hl
	ld	bc, 67
	add	hl, bc			; HL = score field
	ld	b, 9
go_score:
	ld	a, (hl)
	inc	hl
	call	vz_draw3
	djnz	go_score
	ld	de, GO_LINE2
	ld	hl, go_s_level
	call	vz_puts3
	ld	a, (ix+121)
	call	vz_draw3
	ld	a, (ix+122)
	call	vz_draw3
	ld	hl, go_s_ghosts
	call	vz_puts3
	ld	a, (ix+57)
	call	vz_draw3
	ld	a, (ix+58)
	call	vz_draw3
	ld	a, (vz_margin_dirty)
	or	1
	ld	(vz_margin_dirty), a
	pop	ix
	pop	hl
	pop	de
	pop	bc
	pop	af
	ret

go_s_final:	defm	"FINAL SCORE ", 0
go_s_level:	defm	"LEVEL ", 0
go_s_ghosts:	defm	"  GHOSTS ", 0

; ---------------------------------------------------------------------------
; High scores.
;
; The table (game data, not moved) is 10 entries x 24 bytes at HS_TABLE: a
; 15-character name followed by the 9-character score field.  Names are now
; entered as 3 letters, so only the first 3 name characters are used/shown.
;
; Name entry (sub_5b2eh) used to type straight into TRS-80 video RAM at
; 3EE9h-3EF7h, which is ROM on the VZ.  The reads/writes now use NAME_BUF
; (0x5B2E, 0x5AAF), the limit is NAME_BUF+3 (0x5B5B), and the cursor store at
; 0x5B31 calls vz_name_cursor, which draws "TYPE YOUR NAME, THEN RETURN" and the
; three letters (typed ones, '_' for the rest) over the GREAT SCORE screen.
; ---------------------------------------------------------------------------
HS_TABLE EQU 0634Bh
NAME_PROMPT_ADDR EQU 07000h+41*32+2	; 27 cells (2-28)
NAME_FIELD_ADDR  EQU 07000h+49*32+14	; 3 cells (14-16)

; vz_name_cursor: replaces `ld (hl),8Fh / call sub_603ah` at 0x5B31.  HL = the
; cursor position in NAME_BUF.  Preserves everything the caller needs.
vz_name_cursor:
	push	af
	push	bc
	push	de
	push	hl
	ld	de, NAME_BUF
	or	a
	sbc	hl, de			; HL = letters typed so far
	jr	nz, vnc_draw
	ld	hl, NAME_BUF		; first call (or restart): blank the buffer
	ld	b, 15
vnc_blank:
	ld	(hl), 020h
	inc	hl
	djnz	vnc_blank
	ld	hl, 0
vnc_draw:
	ld	c, l			; C = letters typed
	ld	de, NAME_PROMPT_ADDR
	ld	hl, nm_s_prompt
	call	vz_puts3
	ld	de, NAME_FIELD_ADDR
	ld	hl, NAME_BUF
	ld	b, 3
vnc_ch:
	ld	a, 3
	sub	b			; A = slot 0..2
	cp	c
	ld	a, '_'
	jr	nc, vnc_put		; not typed yet: placeholder
	ld	a, (hl)
vnc_put:
	call	vz_draw3
	inc	hl
	djnz	vnc_ch
	pop	hl
	ld	(hl), 08fh		; the original cursor store
	pop	de
	pop	bc
	pop	af
	jp	0603ah			; the original call: wait for key release (returns to our caller)

nm_s_prompt:	defm	"TYPE YOUR NAME, THEN RETURN", 0

; ---------------------------------------------------------------------------
; vz_hs_blit: replaces the buffer->screen copy at 0x5AFD in sub_5ae1h (HL =
; 0CA12h, the decoded screen 38).  Draws the screen, then the table from
; HS_TABLE as two columns of five lines (rows 33-61, ink rows 33-37, 39-43,
; ..., 57-61); each line is 15 cells:   rr nnn ssssssss   (rank right-aligned
; in 2, 3 name letters, the LOW 8 of the score field's 9 characters).  The top
; character (hundreds of millions) is blank unless the score is out of range
; (>= 100,000,000, practically unreachable): then the 8 cells show " BUSTER!").
; A '*' in that first character is the game's winner marker: it is drawn in the
; first blank cell of the 8 instead.
; Left column cells 0-14, a 2-cell gutter, right column cells 17-31.  The screen's own text
; (header, ranks, names) is bit-7-clear and came out blank.  Row 38 holds the
; header underline of screen 38, which would cut through the first lines: cleared.
; Lines 57-61 sit in the bottom margin, so bit 0 of vz_margin_dirty is set.
; ---------------------------------------------------------------------------
vz_hs_blit:
	push	af
	push	bc
	push	de
	push	hl
	push	ix
	push	iy
	call	vz_blit_frame		; (preserves all)
	ld	hl, 07000h+38*32
	ld	de, 07000h+38*32+1
	ld	bc, 31
	ld	(hl), 0
	ldir
	ld	ix, HS_TABLE
	ld	iy, hs_dst
	ld	b, 10			; entries left
	ld	c, 1			; rank
hs_ent:
	ld	e, (iy+0)
	ld	d, (iy+1)
	inc	iy
	inc	iy
	ld	a, c
	cp	10
	jr	z, hs_ten
	ld	a, ' '
	call	vz_draw3
	ld	a, c
	add	a, '0'
	call	vz_draw3
	jr	hs_name
hs_ten:
	ld	a, '1'
	call	vz_draw3
	ld	a, '0'
	call	vz_draw3
hs_name:
	ld	a, ' '
	call	vz_draw3
	ld	a, (ix+0)
	call	vz_draw3
	ld	a, (ix+1)
	call	vz_draw3
	ld	a, (ix+2)
	call	vz_draw3
	ld	a, ' '
	call	vz_draw3
	ld	a, (ix+15)		; first character of the 9-character score field
	cp	' '
	jr	z, hs_num		; blank: the score fits the 8 shown characters
	cp	'*'
	jr	z, hs_num		; '*' = the game's winner marker (see vz_win_row), not a digit
	ld	hl, hs_s_buster		; a digit: >= 100,000,000, out of range, show the string instead
	call	vz_puts3
	jr	hs_next
hs_num:
	push	ix
	pop	hl
	push	bc
	ld	bc, 16
	add	hl, bc			; HL = score field + 1 (low 8 of the 9 characters)
	ld	b, 8
	ld	a, (ix+15)
	cp	'*'
	jr	nz, hs_score
	ld	a, (hl)			; winner: put the star in the first blank cell of the score
	cp	' '
	jr	nz, hs_score
	ld	a, '*'
	call	vz_draw3
	inc	hl
	dec	b
hs_score:
	ld	a, (hl)
	inc	hl
	call	vz_draw3
	djnz	hs_score
	pop	bc
hs_next:
	ld	de, 24
	add	ix, de
	inc	c
	dec	b			; (djnz is out of range now: the loop body grew)
	jp	nz, hs_ent
	ld	a, (vz_margin_dirty)
	or	1
	ld	(vz_margin_dirty), a
	pop	iy
	pop	ix
	pop	hl
	pop	de
	pop	bc
	pop	af
	ret

; destination of each entry's first cell: left column (entries 1-5), right column (6-10)
hs_s_buster:	defm	" BUSTER!", 0

hs_dst:	defw	07000h+33*32, 07000h+39*32, 07000h+45*32, 07000h+51*32, 07000h+57*32
	defw	07000h+33*32+17, 07000h+39*32+17, 07000h+45*32+17, 07000h+51*32+17, 07000h+57*32+17

; End of HAL
