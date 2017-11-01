# Copyright 2017 Richard Dymond (rjdymond@gmail.com)
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <http://www.gnu.org/licenses/>.

from skoolkit.skoolasm import AsmWriter
from skoolkit.skoolhtml import HtmlWriter
from skoolkit.skoolmacro import parse_brackets

SYSVARS = {
    'KSTATE': 0x5C00,
    'LAST-K': 0x5C08,
    'REPDEL': 0x5C09,
    'REPPER': 0x5C0A,
    'DEFADD': 0x5C0B,
    'K-DATA': 0x5C0D,
    'TVDATA': 0x5C0E,
    'STRMS': 0x5C10,
    'CHARS': 0x5C36,
    'RASP': 0x5C38,
    'PIP': 0x5C39,
    'ERR-NR': 0x5C3A,
    'FLAGS': 0x5C3B,
    'TV-FLAG': 0x5C3C,
    'ERR-SP': 0x5C3D,
    'LIST-SP': 0x5C3F,
    'MODE': 0x5C41,
    'NEWPPC': 0x5C42,
    'NSPPC': 0x5C44,
    'PPC': 0x5C45,
    'SUBPPC': 0x5C47,
    'BORDCR': 0x5C48,
    'E-PPC': 0x5C49,
    'VARS': 0x5C4B,
    'DEST': 0x5C4D,
    'CHANS': 0x5C4F,
    'CURCHL': 0x5C51,
    'PROG': 0x5C53,
    'NXTLIN': 0x5C55,
    'DATADD': 0x5C57,
    'E-LINE': 0x5C59,
    'K-CUR': 0x5C5B,
    'CH-ADD': 0x5C5D,
    'X-PTR': 0x5C5F,
    'WORKSP': 0x5C61,
    'STKBOT': 0x5C63,
    'STKEND': 0x5C65,
    'BREG': 0x5C67,
    'MEM': 0x5C68,
    'FLAGS2': 0x5C6A,
    'DF-SZ': 0x5C6B,
    'S-TOP': 0x5C6C,
    'OLDPPC': 0x5C6E,
    'OSPCC': 0x5C70,
    'FLAGX': 0x5C71,
    'STRLEN': 0x5C72,
    'T-ADDR': 0x5C74,
    'SEED': 0x5C76,
    'FRAMES': 0x5C78,
    'UDG': 0x5C7B,
    'COORDS': 0x5C7D,
    'P-POSN': 0x5C7F,
    'PR-CC': 0x5C80,
    'ECHO-E': 0x5C82,
    'DF-CC': 0x5C84,
    'DF-CCL': 0x5C86,
    'S-POSN': 0x5C88,
    'S-POSNL': 0x5C8A,
    'SCR-CT': 0x5C8C,
    'ATTR-P': 0x5C8D,
    'MASK-P': 0x5C8E,
    'ATTR-T': 0x5C8F,
    'MASK-T': 0x5C90,
    'P-FLAG': 0x5C91,
    'MEMBOT': 0x5C92,
    'NMIADD': 0x5CB0,
    'RAMTOP': 0x5CB2,
    'P-RAMT': 0x5CB4,
    'CHINFO': 0x5CB6
}

class ROMWriter:
    def expand_s(self, text, index, cwd=None):
        # #S/text/
        sep = text[index]
        end, s = parse_brackets(text, index, '', sep, sep)
        return end, s.lower() if self.case == 1 else s

    def expand_sysvar(self, text, index, cwd=None):
        # #SYSVAR(varname)
        varname = parse_brackets(text, index)[1]
        if varname.endswith(('-lo', '-hi')):
            varname = varname[:-3]
        return index, '#R{}'.format(SYSVARS[varname])

class ROMHtmlWriter(HtmlWriter, ROMWriter):
    pass

class ROMAsmWriter(AsmWriter, ROMWriter):
    pass
