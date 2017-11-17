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

local _math = require "toybox.math"

local _M = {}

local point2d = _M
point2d.__index = point2d

setmetatable(point2d, {
	__call = function(tbl, x, y)
		return setmetatable({x = x, y = y}, point2d)
	end,
})

function point2d.__unm(obj)
	return point2d(-obj.x, -obj.y)
end

function point2d.__add(lhs, rhs)
	return point2d(lhs.x + rhs.x, lhs.y + rhs.y)
end

function point2d.__sub(lhs, rhs)
	return point2d(lhs.x - rhs.x, lhs.y - rhs.y)
end

function point2d.__eq(lhs, rhs)
	return _math.equals(lhs.x, rhs.x) and _math.equals(lhs.y, rhs.y)
end

function point2d.__tostring(self)
	return string.format("{%f, %f}", self.x, self.y)
end

return _M
