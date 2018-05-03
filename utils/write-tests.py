#!/usr/bin/env python3
import sys
import os

SKOOLKIT_HOME = os.environ.get('SKOOLKIT_HOME')
if not SKOOLKIT_HOME:
    sys.stderr.write('SKOOLKIT_HOME is not set; aborting\n')
    sys.exit(1)
if not os.path.isdir(SKOOLKIT_HOME):
    sys.stderr.write('SKOOLKIT_HOME={}: directory not found\n'.format(SKOOLKIT_HOME))
    sys.exit(1)
sys.path.insert(0, '{}/tools'.format(SKOOLKIT_HOME))
from testwriter import write_tests

SNAPSHOT = 'build/rom+sysvars.bin'

SKOOL = 'rom.skool'

OUTPUT = """Using ref files: {reffile}, bugs.ref, changelog.ref
Parsing {skoolfile}
Output directory: {odir}/rom
Copying {SKOOLKIT_HOME}/skoolkit/resources/skoolkit.css to skoolkit.css
Copying rom.css to rom.css
Writing disassembly files in asm
Writing maps/all.html
Writing maps/routines.html
Writing maps/data.html
Writing maps/messages.html
Writing maps/unused.html
Writing buffers/sysvars.html
Writing reference/bugs.html
Writing reference/changelog.html
Writing index.html"""

write_tests(SKOOL, SNAPSHOT, OUTPUT, '-Ho 0')
