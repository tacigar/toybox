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

_ENV = setmetatable(require "toybox.oop.simple", {
	__index = _ENV,
})

class "point2d" {
	__init = function(self, x, y)
		self.x = x
		self.y = y
	end;
	get_x = function(self)
		return self.x
	end;
	get_y = function(self)
		return self.y
	end;
	set_x = function(self, x)
		self.x = x
	end;
	set_y = function(self, y)
		self.y = y
	end;
}

class "point3d" : extends "point2d" {
	__init = function(self, x, y, z)
		self.x = x
		self.y = y
		self.z = z
	end;
	get_z = function(self)
		return self.z
	end;
	set_z = function(self, z)
		self.z = z
	end;
}

local p1 = point2d(10, 20)
p1:set_x(5)
p1:set_y(10)
--p1:set_z(15) -- error
print(p1:get_x())
print(p1:get_y())
--print(p1:get_z()) -- error

local p2 = point3d(10, 20, 30)
p2:set_x(5)
p2:set_y(10)
p2:set_z(15)
print(p2:get_x())
print(p2:get_y())
print(p2:get_z())
