# 2D CAD for the Keyboard Overlay Stickers in .SVG
Design work to create sticker overlays for most cheap wireless USB keyboards, including resources for keycaps, etc. This is my wheelhouse; it's probably about a weekend's worth of work.

# FIRMWARE / ROM INVESTIGATION — TODO
This is started; see [VZ200 LEVEL II BASIC Disassembly on GitHub](https://github.com/lindoran/VZ200-Level-II-BASIC-Disasembly).

[1] Cartridge ROM Space Exploration
    - Investigate whether firmware can open up the ROM region for external cartridges.
    - Determine if the ROM area is hard-coded, mirrored, or gated.

[2] Boot-Time ROM Checks
    - Examine the disassembly to see whether the ROM performs any calls, checks, or integrity tests on the cartridge ROM area during boot.
    - Identify any vectors or jump tables that might redirect into cartridge space.

[3] Continue Disassembly Work
    - Push further on the ROM disassembly to map:
        * Startup vectors
        * Memory-map assumptions
        * Any hidden or undocumented ROM hooks
    - Document all findings for future firmware patches.

# REV 3 Plans

[1] Vague "digital" video board for the expansion header
    - Might involve integrating I/O controller into one design as a 100x100 or similar form-factor expansion.
    - This will likely be VGA, but may also be HDMI.
    - Instead, may work around an analog front end that is more modern for things like 100% accurate Composite Artifact Color.

[2] Vintage composite output analog board.
    - May move to a Rev 2.1 release depending on testing results.
    - Use a vintage encoder IC.
    - Produce a much more standard but lower-quality output.
    - Possible "Mega Drive" style DIN connector for video cables to keep footprint small.

# Tape Loading from SD Card with Enhanced TZXDuino Mods / Exploration
[1] Use uncovered fast-loading potential already in system ROM.
[2] Build a better TZXDuino:
    - Different microcontroller support.
    - Better front end that mimics the source computer output and subsequent tape output accurately using DACs.
    - Less jumbled codebase.
