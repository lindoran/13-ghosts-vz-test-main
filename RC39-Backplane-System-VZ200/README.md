<p align="center">
  <img src="documents/LOGO.png" alt="HB200 Logo">
</p>

# RC39 Backplane for VZ200 Clone Workalike

This project is an **RC39-based backplane** designed for building home computer workalikes. The current focus is on creating a **VZ200 clone workalike**.

<p align="center">
  <img src="documents/Front%20View.jpg" width="30%" alt="Front View">
  <br>
  <em>The completed RC39 Backplane system in its REV 2 configuration.</em>
</p>

## REV 2 
Rev 2 boards have been released! These are very much functional and can load data from the tape port. The minimum required boards for a functional system is four, plus the backplane and I/O shelf. The board is designed to operate with the stock 2.0 Level II BASIC BIOS (not provided here).

- The **[backplane](Schematics/REV%202%20RC39%20-VZ%20Compatible%20Backplane.pdf)** is a 100x100 PCB and interconnects all the cards on a standard bus. The backplane has a few safeguards. It uses USB Mini-B as a power connector; this physically prevents the backplane from taking more than 5V, being connected backwards, or otherwise hooked up wrong. A toggle switch is in place to make it easy to switch the power on and off at the unit's "back". Simple M3 holes provide a way to mount standoffs and lock in the analog board, which interfaces headers on the PCB. The reset circuit is a simple 555 timer with an open-collector transistor at its output. The timing delay is a simple RC to Schmitt trigger design that brings the reset switch to the front of the board. All of the footprints are designed to use low-profile components so the analog board can fit on top without shorting out.
- The **[I/O shelf](Schematics/REV%202%20RC39%20Bus%20Media%20Shelf%20(VZ%20compatible%20simple%20Video%20Board).pdf)** contains all of the analog ports, along with its own 5V RC-filtered power plane. This provides a display image as well as tape use that is free from noise on the 5V plane. Specific [PCB modification instructions](documents/analog-shelf-pcb-mods.md) for different types of output can be found in the [documents](documents/) directory. Currently, I have had to move the composite-only output board to REV 3, which is on hold while I consider a digital output solution. This means the only way to get video out of the chip at this time is 15kHz YPbPr. Very similar to component video, but **does require a video transcoder to work**. While 480i is typically compatible with most modern TVs, a lot of them won't work with 15kHz video. Products that do this affordably can be found on retailers like Amazon. I use a [Mcbazel ODV-II Component/AV/CVBS/S-Video to Component Converter](https://www.amazon.com/Mcbazel-Component-S-Video-Converter-Console/dp/B0B2WFTDGF). These are honestly overpriced for what they are, and you can get by with much less. You simply need something that will take 15kHz component (like the PS2 or GameCube use) and convert that to regular Component or HDMI. If you have one, the 6-pin analog board for the RGB2HDMI project is compatible and can be used as well; just don't build the video section on the analog board.
- The **[CPU Card](Schematics/REV%201%20RC39%20Bus%20Z80%20CPU%20_%20Clock%20Card.pdf)** contains the clock circuit and jumpers for maintaining all of the control lines. This was the only design from Rev 1 that needed no modifications; it allows you to use either a DIP-type oscillator package or a 74HCU04-based Pierce oscillator setup with a crystal. The computer is designed to run the whole clock off of the NTSC color burst frequency, which is 3.579545 MHz. Since the system clock source location is agnostic in RC39, future video boards could source the system clock from any location; however, for now, the CPU card can source the clock for the whole computer. The tradeoff between the two clock options is clock stability over a large bus layout. The discrete oscillator package may have less current-carrying stability vs. the 74-series design—however, the 74-series design uses considerably more current (a few more mA), so it's a tradeoff.
- The **[RAM / ROM card](Schematics/REV%202%20RC39%20Bus%20GAL%20based%20RAM%20_%20ROM%20Card.pdf)** contains two 128 KB memories: a flash chip and an SRAM. The flash chip is technically system-programmable with a set jumper, but no software is written yet. This card has two GAL chips which handle all the glue-selection logic and memory banking for 128 KB RAM, with jumpers for ROM programming and bank selection. Supports multiple banking modes (see [Memory Map](documents/memory_map.md)).
- The **[Graphics Card](Schematics/REV%202%20RC39%20VZ%20Compatible%202K%206847%20VDG%20Card.pdf)** contains a real 6847 VDG as well as a 2K dual-port SRAM. This card only supports NTSC, and the timing delay produced is faster than the PAL delay (60 Hz vs. 50 Hz). This, along with the on-board GAL, provides flicker-free video that can be piped to the analog board over a 6-pin ribbon cable or connected to an appropriately configured RGB2HDMI board (untested as of yet, but the pinout is compatible; it should work with any RGB2HDMI configured for the CoCo). The graphics card also provides the needed control signal for the I/O card.
- The **[Serial Card](Schematics/REV%202%20RC39%20Serial%20Card.pdf)** provides a 6850 UART with GAL-based selection logic. It was designed to troubleshoot and debug the chipset and is not required to operate the computer. It is currently configured for port 0x80, but future firmware patches are planned to use it as a modem interface. While it is currently a lower priority, it is very useful for firmware development.
- The **[I/O board](Schematics/REV%202%20RC39%20VZ%20Compatible%20IO%20interface.pdf)** contains an RP2040 Pico, an output register, and sound output. This is possibly the most complex card in the system, as it manages 3.3V levels as well as amplified sound for the computer. You can connect a small 1W speaker and amp or go with a standard passive buzzer. The I/O card feeds a 4-wire JST dongle (direct soldered) which feeds back to the I/O shelf for tape I/O.

## GAL Backend for the VZ-200
The VZ-200 has a relatively [simple chipset](https://hackaday.io/page/399728-the-curious-case-of-the-vz-200-chipset-part-1) without overstating it. This is possibly the simplest way to make a fully-fledged home computer using off-the-shelf discrete parts. The only thing that comes close is the hugely popular ZX Spectrum, which has its own bespoke ULA. To that end, it was not difficult to go looking for [source material](https://github.com/rweather/vz200-restoration) to work off of. However, the modularity of RC2014 lets us build a system with universal cards that can be swapped out for experimentation; that's a real advantage. To that end, I wanted something that would allow the whole CPU to be swapped out, so the subsequent parts could be either used in place or reprogrammed without too much fuss, giving an opportunity to really play around with the architecture. 

In the video board, I had to design a [small state machine](https://hackaday.io/page/399746-the-curious-case-of-the-vz200-chip-set-part-2) to control the way the dual-port RAM works. This was done to eliminate video flicker (like seen in a PC CGA card). This is common on shared RAM designs which force the video generator off the bus while the CPU is updating RAM. This design only pushes the VDG off the RAM access if the specifically addressed RAM cell that is being read is being updated.

Development for the GALs was done graphically in [H. Neemann's Digital](https://github.com/hneemann/digital). I used a custom version that I modified to allow the Q pin to be used as a general-purpose I/O pin for some of the designs. You can see [my fork here](https://github.com/lindoran/digital). This fork is VERY hacky but it builds the files needed to burn the GALs; it's just not ready to be sent as a pull request yet. I would want to test further to see if it breaks other things and fix the dialogs so you can select how you want Q to behave.

Every GAL in the design is a standard 22V10, chosen because of its larger cell count and availability from new parts retailers like Mouser.

You can find the screenshots, design files, and .JED files for burning the various chips in your programmer of choice in the [Digital Simulations for GAL](/Digital%20Simulations%20for%20GAL/) folder.

## Backplane Features
- **Power Input:** 5V supplied via USB Mini-B Jack, with on-board power switch or remote switch header.
- **Reset Circuit (Standard):** 555 timer-based reset design.  
- **Mounting:** Lugs for an I/O shelf above the expansion header, positioned at the back of the board, with reset switch accessible from the front.  
- **Expansion Connectors:**  
  - Five 39-pin RC39-compliant connectors for expansion cards.  
  - I/O expansion header updated to the same 32-pin header, but bottom-facing to allow the computer to "straddle" a large expansion card.  
  - RC39 is essentially the RC2014 bus with one pin removed, allowing connectors to fit on a 100mm × 100mm PCB.  
- **Card Size:** All cards are 100mm × 100mm (or smaller), with two-layer artwork or less, keeping manufacturing costs low for a complete set of boards.  

## Current Cards
- **CPU / Clock Board**  
- **Serial Card:** 6850 UART with GAL-based selection logic (optional, good for debugging; firmware for modem support coming!). 
- **RAM / ROM Card:** Includes GAL-based selection and banking logic.  
- **Display Card:** MC6847 video chip with dual-port RAM and GAL selection logic.  
- **I/O Interface Card (3V):**  
  - Beeper, tape, and sound support.  
  - Built-in modern RP2040 I/O interface.  
  - Front-facing design.  
  - RP2040 controls the computer keyboard via HID over USB (a certain modicum of support is implied; see [Keymap](documents/keymap.md) for details).  

## Documentation
- **[Memory Map](documents/memory_map.md)**: Detailed memory layout for the VZ200 workalike.
- **[Keymap](documents/keymap.md)**: Keyboard mapping for the RP2040 I/O interface.
- **[VZ200 Technical Reference Manual](documents/VZ200_technical_reference_manual.pdf)**: Original technical documentation for the VZ200.
- **[Analog Board Mod Guide](documents/analog-shelf-pcb-mods.md)**: Instructions for Tape I/O and PC Line-In modifications.
- **[TODO List](documents/TODO.md)**: Current status and future plans.

## Schematics / Design Files
You can build your own! The board design files are all provided as open hardware. Please review the [CERN-OHL-P license](HARDWARE-LICENSE) for what you can do with produced boards (it's a lot). The software and firmware are all released under the [GPL 3.0](LICENSE).

I would describe some of the soldering as challenging; specifically, the through-hole transistors require flux and a fine-tip soldering iron. Most of these are on the analog board. The rest of the design uses simple 2-layer through-hole ellipse pattern solder pads.  The biggest gotcha is that the bus connector must be soldered on the front side of the card. If it’s soldered on the back, the cards won’t fit into the backplane when fully assembled.

- **[REV 2 Schematics](/Schematics/)**: Detailed schematics for the REV 2 release.
- **[3D CAD Renders](/Schematics/Renders/)**: 3D renders of the boards.
- **[Gerber Files](/Gerbers/)**: Production files for PCB manufacturing.
- **[GAL Firmware](/Digital%20Simulations%20for%20GAL/)**: Each GAL chip has its own folder.
- **[VZ200 Level II BASIC V2 ROM](http://Google.com)**: Can be found on the web; burn this to your flash ROM at 0x0000 and jumper the card appropriately.

## Firmware Handling and Production
The RP2040 can be burned with a USB-C to A cable, using only a PC and freely available Arduino software. The GAL and flash chips can be burned with most modern USB-based chip burners (confirm all the chip models needed are supported before buying). You can also use the [relatively universal EEPROM burner project](https://github.com/AndersBNielsen/Relatively-Universal-ROM-Programmer) by Anders Nielsen, or [afterburner](https://github.com/ole00/afterburner) by ole00 for GALs, both of which use a low-cost Arduino Uno board. The ROM card can be set to work with a 28-pin EEPROM, meaning you could (if you wanted) use [OneROM](https://github.com/piersfinlayson/one-rom) to host the firmware.

## Sponsorship
This project is graciously sponsored by [PCBWay](http://www.pcbway.com)! Please check out their website for all your PCB, 3D printing, injection molding, and 3D print fabrication needs! They continue to be such a wonderful partner in retro, and I am proud to have them along for the ride.  

<p align="center">
  <img src="documents/small_pcbway.png" alt="PCBWay Logo">
</p>

## License
The project software and firmware equations are licensed under the **GNU General Public License v3.0 (GPL-3.0)**.  

You are free to use, modify, and distribute this project under the terms of the GPL.  
See the [LICENSE](LICENSE) file or the [GNU website](https://www.gnu.org/licenses/gpl-3.0.en.html) for full details.

The project hardware designs are licensed under the [CERN-OHL-P v2 (Permissive)](HARDWARE-LICENSE). Full context of the license can be viewed on the [CERN website](https://gitlab.com/ohwr/project/cernohl/-/wikis/Documents/CERN-OHL-version-2).
