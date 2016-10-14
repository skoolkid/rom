#!/usr/bin/env python
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

SNAPSHOT = os.environ.get('ROM', '/usr/share/spectrum-roms/48.rom')

SKOOL = '../sources/rom.skool'

OUTPUT = """Using skool file: {skoolfile}
Using ref file: {reffile}
Parsing {skoolfile}
Creating directory {odir}/rom
Copying {SKOOLKIT_HOME}/skoolkit/resources/skoolkit.css to {odir}/rom/skoolkit.css
  Writing disassembly files in rom/asm
  Writing rom/maps/all.html
  Writing rom/maps/routines.html
  Writing rom/maps/data.html
  Writing rom/maps/messages.html
  Writing rom/maps/unused.html
  Writing rom/buffers/gbuffer.html
  Writing rom/reference/changelog.html
  Writing rom/index.html"""

write_tests(SKOOL, SNAPSHOT, OUTPUT, sna2skool_opts='-Ho 0')
