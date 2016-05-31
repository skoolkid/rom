#!/usr/bin/env python
import sys
import os
try:
    from StringIO import StringIO
except ImportError:
    from io import StringIO

ROM_HOME = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ROM_CTL = '{}/sources/48.rom.ctl'.format(ROM_HOME)
ROM = os.environ.get('ROM', '/usr/share/spectrum-roms/48.rom')
BUILD_DIR = '{}/build'.format(ROM_HOME)

SKOOLKIT_HOME = os.environ.get('SKOOLKIT_HOME')
if SKOOLKIT_HOME:
    if not os.path.isdir(SKOOLKIT_HOME):
        sys.stderr.write('SKOOLKIT_HOME={}: directory not found\n'.format(SKOOLKIT_HOME))
        sys.exit(1)
    sys.path.insert(0, SKOOLKIT_HOME)
    from skoolkit import skool2asm, skool2html, sna2skool
else:
    try:
        from skoolkit import skool2asm, skool2html, sna2skool
    except ImportError:
        sys.stderr.write('Error: SKOOLKIT_HOME is not set, and SkoolKit is not installed\n')
        sys.exit(1)

sys.stderr.write("Found SkoolKit in {}\n".format(skool2html.PACKAGE_DIR))

def write_skool():
    stdout = sys.stdout
    sys.stdout = StringIO()
    sna2skool.main(('-o', '0', '-H', '-c', ROM_CTL, ROM))
    if not os.path.isdir(BUILD_DIR):
        os.mkdir(BUILD_DIR)
    skoolfile = '{}/48.rom.skool'.format(BUILD_DIR)
    with open(skoolfile, 'wt') as f:
        f.write(sys.stdout.getvalue())
    sys.stdout = stdout
    return skoolfile

def run_skool2asm():
    args = sys.argv[1:] + [write_skool()]
    skool2asm.main(args)

def run_skool2html():
    skool2html_options = '-d {}/html'.format(BUILD_DIR)
    skool2html_options += ' -S {}/sources'.format(ROM_HOME)
    args = skool2html_options.split() + sys.argv[1:] + [write_skool()]
    skool2html.main(args)
