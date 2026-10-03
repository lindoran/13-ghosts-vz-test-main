# Text-mode issues and bitmap UI plan

## Current state: ordinary text is not rendered

The original TRS-80 screen is a 1 KB, 64 by 16 character buffer with two
meanings for its bytes:

- Bytes with bit 7 set are semigraphics characters.  Each represents a 2 by
  3 pixel block, giving the game a 128 by 48 effective graphics area.
- Bytes with bit 7 clear are ordinary characters.  The TRS-80 video hardware
  renders these from its character generator.  This is how the title,
  copyright text, score, level, and ghost count appear.

The VZ port's `vz_blit_frame` currently converts only the first category.  Its
per-character conversion begins with `or a` / `jp p,...`; consequently, every
ordinary (bit-7-clear) text byte emits background pixels.  The title and HUD
text are therefore not covered by the current HAL.

This is not a defect that can be fixed by copying raw character bytes to VZ
VRAM.  In MC6847 Mode 1, VRAM is bitmap data, not character codes.

## Do not use a raster-timed text/graphics mode split

The VZ text display has a different memory format and geometry from both the
TRS screen and VZ Mode 1.  In particular, a literal 64-column TRS text line
does not fit across the port's 128-pixel-wide Mode 1 playfield at a legible
character size.  Switching modes during display would be timing-sensitive,
would not reproduce the mixed TRS screen naturally, and would complicate the
gameplay display.

Keep the VZ in Mode 1 and draw any required UI as bitmap graphics.

## Available ROM font data

The VZ Level II BASIC ROM contains a suitable readable font table:

- `PRN_GFX_FONT` at ROM address `$3B94`.
- 64 glyphs, five bytes per glyph.
- The ROM printer graphics routine uses it for its character output path.

See `export.lst` around `PRN_GFX_FONT`.  This table is not the MC6847's
internal character-generator ROM, but it is program-visible ROM data and is
enough to avoid embedding a duplicate basic font in the game.

The table's bytes are glyph columns for printer output.  Initialization must
transpose them into rows and verify/invert the bit polarity as required by the
chosen Mode 1 foreground colour.

## RAM budget and cached tiles

The relocated game buffers occupy:

```text
$4000-$43FF  buffer 0
$4400-$47FF  buffer 1
$4800-$4BFF  buffer 2
$4C00-$4FFF  buffer 3
$5000-$53FF  buffer 4
$5400-$55FF  pointer table
```

The enabled 10 KB RAM window ends at `$67FF`, leaving `$5600-$67FF` (4.5 KB)
available for UI assets and scratch state.

A convenient cached tile format is an 8 by 8 glyph in Mode 1:

```text
8 pixels × 8 rows × 2 bits per pixel = 16 bytes per glyph
64 glyphs × 16 bytes = 1024 bytes
```

For example, `$5600-$59FF` can hold the whole pre-expanded glyph cache, with
the remaining space available for a cached title bitmap, dirty-state records,
and temporary rendering data.

## Recommended rendering model

At boot:

1. Copy/read the font source at `$3B94`.
2. Convert its 5 by 8 one-bit glyphs into cached 8 by 8 Mode 1 tiles.
3. Store the tiles in `$5600-$59FF`.

For each displayed game frame:

1. Run `vz_blit_frame` as today to convert the semigraphics playfield.
2. Draw the compact bitmap HUD over its reserved screen region.
3. Update only HUD tiles whose values changed, if performance warrants it.

The title screen can be constructed once from the cached tiles and retained as
a bitmap.  Static legal/copyright lines should be reflowed for the available
width.  The gameplay HUD should use a compact VZ-specific form, for example:

```text
S:1500  NIGHT  L:1  G:6
```

rather than attempting a literal 64-column reproduction.

## Score representation

The original game already produces score digits as screen characters, so a
first HUD implementation can render those existing character values.  A
separate BCD score representation is optional: it is useful if the port takes
full ownership of the HUD and wants to stop deriving display values from the
TRS screen buffer, but is not required for cached-tile rendering.

## Follow-up implementation work

- Confirm the `$3B94` font character-code mapping against the game strings.
- Confirm font bit polarity with a one-glyph Mode 1 test.
- Decide the compact HUD layout and reserve its bitmap rows.
- Add a tile-cache initialization routine and a small direct-to-VRAM glyph
  blitter.
- Handle title and credits as separately laid-out bitmap screens.
