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
BLIT_PAGE EQU 0eeh		; 6 pages EE00-F3FF: blit lookup tables (runtime)

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
vz_blit_frame:
	push	af
	push	bc
	push	de
	push	hl
	push	ix
	ld	a, (vz_margin_dirty)	; HUD or title credits left in the margins?
	or	a
	call	nz, vz_margin_clear	; (preserves HL; BC/DE/A are reloaded below)
	ld	b, h
	ld	c, l			; BC = source
	ld	ix, 07100h		; first playfield scanline
	ld	h, BLIT_PAGE
	ld	d, BLIT_PAGE+3
	ld	a, 16			; 16 character rows
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

vz_draw_hud_row:
	ld	de, HUD_NAME_ADDR	; top margin: level-name string only, no label
	ld	hl, HUD_LEVELNAME
	ld	b, 17
vhr_name:
	ld	a, (hl)
	inc	hl
	call	vz_draw3
	djnz	vhr_name
	ld	de, HUD_ROW_ADDR
	ld	hl, hud_s_score
	call	vz_puts3
	ld	hl, HUD_SCORE
	ld	b, 9
vhr_score:
	ld	a, (hl)
	inc	hl
	call	vz_draw3
	djnz	vhr_score
	ld	hl, hud_s_level
	call	vz_puts3
	ld	a, (HUD_LEVEL10)
	call	vz_draw3
	ld	a, (HUD_LEVEL1)
	call	vz_draw3
	ld	hl, hud_s_ghosts
	call	vz_puts3
	ld	a, (HUD_GHOST10)
	call	vz_draw3
	ld	a, (HUD_GHOST1)
	call	vz_draw3
	ld	a, (vz_margin_dirty)	; HUD is on screen: the next blit that is not the
	or	2			; gameplay one (game over, demo end, any other
	ld	(vz_margin_dirty), a	; screen) wipes the margins
	ret

hud_s_score:	defm	"SCORE ", 0
hud_s_level:	defm	" LEVEL ", 0
hud_s_ghosts:	defm	" GH ", 0

; ---------------------------------------------------------------------------
; Title credits.  Patched in at 0x5396, the game's FINAL (static) draw of the
; title screen -- after the 15-step slide-in has put the 13 GHOSTS logo in its
; final position.  Runs the original sub_6012h (HL = screen list), then draws
; four centred 3x5 lines under the logo (logo ends on VZ row 39):
; ink rows 41-45, 47-51, 53-57, 59-63 (rows 56-63 are the bottom margin).
; vz_margin_dirty bit 0 makes the next vz_blit_frame (any screen) wipe the margins.
; ---------------------------------------------------------------------------
CRED_L1 EQU 07000h+41*32+3		; 25 chars, cell 3
CRED_L2 EQU 07000h+47*32+10		; 11 chars, cell 10
CRED_L3 EQU 07000h+53*32+3		; 26 chars, cell 3
CRED_L4 EQU 07000h+59*32+5		; 22 chars, cell 5

vz_title_draw:
	call	06012h
	push	af
	push	bc
	push	de
	push	hl
	ld	de, CRED_L1
	ld	hl, cred_s1
	call	vz_puts3
	ld	de, CRED_L2
	ld	hl, cred_s2
	call	vz_puts3
	ld	de, CRED_L3
	ld	hl, cred_s3
	call	vz_puts3
	ld	de, CRED_L4
	ld	hl, cred_s4
	call	vz_puts3
	ld	a, (vz_margin_dirty)
	or	1
	ld	(vz_margin_dirty), a
	pop	hl
	pop	de
	pop	bc
	pop	af
	ret

; vz_margin_clear: blank both 8-row margins (rows 0-7 = 7000h-70FFh, rows 56-63 =
; 7700h-77FFh), which the screen blit never touches, and clear the flags.
; The flag byte vz_margin_dirty: bit 0 = title credits drawn, bit 1 = gameplay HUD
; drawn (set by vz_draw_hud_row, dropped again by vz_blit_site1 every frame).
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

; End of HAL
