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

def parse_s(text, index, case):
    sep = text[index]
    end, s = parse_brackets(text, index, '', sep, sep)
    return end, s.lower() if case == 1 else s

class ROMHtmlWriter(HtmlWriter):
    def expand_s(self, text, index, cwd):
        # #S/text/
        return parse_s(text, index, self.case)

class ROMAsmWriter(AsmWriter):
    def expand_s(self, text, index):
        # #S/text/
        return parse_s(text, index, self.case)
