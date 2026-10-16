; 3x5 uppercase ASCII font for the VZ200 CG2 viewport.
; Rasterized from the supplied "my 3x5 tiny mono pixel font.ttf".
; Each glyph is 15 row-major pixels packed into two bytes:
;   bit 14 = top-left, bits 14..12 = row 0, bits 2..0 = row 4.
;   In each row, bit 2 is the left pixel and bit 0 is the right pixel.
; The unused high bit is zero. Glyphs are stored in corrected ordinal order:
; 0x00..0x1F = @, A-Z, [, \, ], ^, _, 0x20..0x3F = space..?
; This keeps the packed 15-pixel row-major bit layout unchanged.
; Glyph cell pitch is 4x6 pixels: 3x5 ink plus one blank column and row.
; Total font data: 64 glyphs * 2 bytes = 128 bytes.

FONT5X3_COUNT EQU 0x40
FONT5X3_DATA:
              DEFB  0x2B,0x63 ; ordinal 0x00 @
              DEFB  0x2B,0xED ; ordinal 0x01 A
              DEFB  0x6B,0xAE ; ordinal 0x02 B
              DEFB  0x39,0x23 ; ordinal 0x03 C
              DEFB  0x6B,0x6E ; ordinal 0x04 D
              DEFB  0x79,0xA7 ; ordinal 0x05 E
              DEFB  0x79,0xA4 ; ordinal 0x06 F
              DEFB  0x39,0x6B ; ordinal 0x07 G
              DEFB  0x5B,0xED ; ordinal 0x08 H
              DEFB  0x74,0x97 ; ordinal 0x09 I
              DEFB  0x12,0x6A ; ordinal 0x0A J
              DEFB  0x5B,0xAD ; ordinal 0x0B K
              DEFB  0x49,0x27 ; ordinal 0x0C L
              DEFB  0x5F,0xED ; ordinal 0x0D M
              DEFB  0x7B,0x6D ; ordinal 0x0E N
              DEFB  0x2B,0x6A ; ordinal 0x0F O
              DEFB  0x7B,0xE4 ; ordinal 0x10 P
              DEFB  0x3B,0x73 ; ordinal 0x11 Q
              DEFB  0x7B,0xAD ; ordinal 0x12 R
              DEFB  0x39,0xCE ; ordinal 0x13 S
              DEFB  0x74,0x92 ; ordinal 0x14 T
              DEFB  0x5B,0x6F ; ordinal 0x15 U
              DEFB  0x5B,0x52 ; ordinal 0x16 V
              DEFB  0x5B,0xFD ; ordinal 0x17 W
              DEFB  0x5A,0xAD ; ordinal 0x18 X
              DEFB  0x5A,0x92 ; ordinal 0x19 Y
              DEFB  0x72,0xA7 ; ordinal 0x1A Z
              DEFB  0x69,0x26 ; ordinal 0x1B [
              DEFB  0x48,0x89 ; ordinal 0x1C \
              DEFB  0x32,0x4B ; ordinal 0x1D ]
              DEFB  0x2A,0x00 ; ordinal 0x1E ^
              DEFB  0x15,0x11 ; ordinal 0x1F <
              DEFB  0x00,0x00 ; ordinal 0x20 SPACE
              DEFB  0x24,0x82 ; ordinal 0x21 !
              DEFB  0x5A,0x00 ; ordinal 0x22 "
              DEFB  0x5F,0x7D ; ordinal 0x23 #
              DEFB  0x3C,0xFA ; ordinal 0x24 $
              DEFB  0x52,0xA5 ; ordinal 0x25 %
              DEFB  0x3C,0xEB ; ordinal 0x26 &
              DEFB  0x24,0x00 ; ordinal 0x27 '
              DEFB  0x29,0x22 ; ordinal 0x28 (
              DEFB  0x22,0x4A ; ordinal 0x29 )
              DEFB  0x55,0x40 ; ordinal 0x2A *
              DEFB  0x05,0xD0 ; ordinal 0x2B +
              DEFB  0x00,0x14 ; ordinal 0x2C ,
              DEFB  0x00,0xC0 ; ordinal 0x2D -
              DEFB  0x00,0x02 ; ordinal 0x2E .
              DEFB  0x12,0xA4 ; ordinal 0x2F /
              DEFB  0x7B,0x6F ; ordinal 0x30 0
              DEFB  0x64,0x97 ; ordinal 0x31 1
              DEFB  0x73,0xE7 ; ordinal 0x32 2
              DEFB  0x72,0xCF ; ordinal 0x33 3
              DEFB  0x5B,0xC9 ; ordinal 0x34 4
              DEFB  0x79,0xCF ; ordinal 0x35 5
              DEFB  0x79,0xEF ; ordinal 0x36 6
              DEFB  0x72,0x49 ; ordinal 0x37 7
              DEFB  0x7B,0xEF ; ordinal 0x38 8
              DEFB  0x7B,0xCF ; ordinal 0x39 9
              DEFB  0x04,0x10 ; ordinal 0x3A :
              DEFB  0x04,0x14 ; ordinal 0x3B ;
              DEFB  0x15,0x11 ; ordinal 0x3C <
              DEFB  0x0E,0x38 ; ordinal 0x3D =
              DEFB  0x44,0x54 ; ordinal 0x3E >
              DEFB  0x72,0xC2 ; ordinal 0x3F ?
FONT5X3_DATA_END:

; Input:  A = ASCII character
; Output: HL = address of its two-byte packed glyph
; Invalid characters map to '?'.
; Clobbers: AF, DE
FONT5X3_GET:
              CP    0x20
              JR    C,FONT5X3_GET_INVALID
              CP    0x60
              JR    NC,FONT5X3_GET_INVALID
              CP    0x40
              JR    C,FONT5X3_GET_INDEX      ; 0x20..0x3F -> same ordinal index
              SUB   0x40                     ; 0x40..0x5F -> 0x00..0x1F
              JR    FONT5X3_GET_INDEX
FONT5X3_GET_INVALID:
              LD    A,0x3F                   ; '?'
FONT5X3_GET_INDEX:
              ADD   A,A                      ; two bytes per glyph
              LD    E,A
              LD    D,0
              LD    HL,FONT5X3_DATA
              ADD   HL,DE
              RET
