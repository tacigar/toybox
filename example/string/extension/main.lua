---------------------------------------------------------------------
-- dustbox
-- Copyright (C) 2017 tacigar
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
---------------------------------------------------------------------

require "toybox.string.extension"

local s = "ABCDEFG"

print(s[2]) -- B
print(s[5]) -- E

print(s[{2; 5}]) -- BCDE
print(s[{_; 5}]) -- ABCDE
print(s[{2}]) -- BCDEFG

print(s:len())
print(s:char_at(2))
