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

local pre_class = {}
pre_class.__index = pre_class

function pre_class:extends(class_name)
	table.insert(self.parents, class_name)
	return self
end

function pre_class:__call(methods)
	_ENV[self.name] = methods
	local new_class = _ENV[self.name]

	setmetatable(new_class, {
		__call = function(_, ...)
			local new_obj = {}
			if methods["__init"] then
				methods["__init"](new_obj, ...)
			end

			return setmetatable(new_obj, {
				__index = function(t, k)
					if rawget(t, k) then
						return rawget(t, k)
					end

					if methods[k] then
						return methods[k]
					end

					for _, parent in ipairs(self.parents) do
						if type(_ENV[parent]) == "table" then
							if _ENV[parent][k] then
								return _ENV[parent][k]
							end
						end
					end
				end,
			})
		end
	})
end

return function(class_name)
	return setmetatable({
		name = class_name,
		parents = {},
	}, pre_class)
end
