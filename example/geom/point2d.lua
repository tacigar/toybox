---------------------------------------------------------------------
-- toybox
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

local geom = require "toybox.geom"

local p1 = geom.point2d(10, 20)
local p2 = geom.point2d(60, 70)
print(p1)
print(p2)
local p3 = p1 + p2
print(p3)
print(p3 == geom.point2d(70, 90))
local p4 = p2 - p1
print(p4)
print(p4 == geom.point2d(50, 50))
local p5 = -p1
print(p5)
print(p5 == geom.point2d(-10, -20))
