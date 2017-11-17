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

local string_mt = getmetatable("")
local old_index = string_mt.__index

function string_mt.__index(s, k)
	if type(k) == "table" then
		if k[1] == nil then
			k[1] = 1
		end
		if k[2] == nil then
			k[2] = string.len(s)
		end
		return string.sub(s, k[1], k[2])
	else
		if type(old_index) == "function" then
			return old_index(s, k)
		elseif type(old_index) == "table" then
			return old_index[k]
		end
	end
end
