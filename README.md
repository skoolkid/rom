Spectrum ROM disassembly
========================

A disassembly of the 48K [Spectrum](https://en.wikipedia.org/wiki/ZX_Spectrum)
ROM, created using [SkoolKit](https://skoolkit.ca).

Decide which number base you prefer and then click the corresponding link below
to browse the latest release:

* [The Complete Spectrum ROM Disassembly](https://skoolkid.github.io/rom/) (hexadecimal)
* [The Complete Spectrum ROM Disassembly](https://skoolkid.github.io/rom/dec/) (decimal)

To build the current development version of the disassembly, first obtain the
development version of [SkoolKit](https://github.com/skoolkid/skoolkit). Then:

    $ skool2html.py -a sources/rom.skool

To build an assembly language source file that can be fed to an assembler:

    $ skool2asm.py sources/rom.skool > rom.asm
