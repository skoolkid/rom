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

SNAPSHOT = '../build/rom+sysvars.bin'

SKOOL = '../sources/rom.skool'

OUTPUT = """Using skool file: {skoolfile}
Using ref files: {reffile}, ../sources/bugs.ref, ../sources/changelog.ref
Parsing {skoolfile}
Creating directory {odir}/rom
Copying {SKOOLKIT_HOME}/skoolkit/resources/skoolkit.css to {odir}/rom/skoolkit.css
Copying ../sources/rom.css to {odir}/rom/rom.css
  Writing disassembly files in rom/asm
  Writing rom/maps/all.html
  Writing rom/maps/routines.html
  Writing rom/maps/data.html
  Writing rom/maps/messages.html
  Writing rom/maps/unused.html
  Writing rom/buffers/sysvars.html
  Writing rom/reference/bugs.html
  Writing rom/reference/changelog.html
  Writing rom/index.html"""

write_tests(SKOOL, SNAPSHOT, OUTPUT, sna2skool_opts='-Ho 0')
