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

local _M = {}

function _M.printf(f, ...)
	io.write(string.format(f, ...))
end

local colors_escape_sequences = {
	["foreground"] = {
		["black"]   = "\x1b[30m",
		["red"]     = "\x1b[31m",
		["green"]   = "\x1b[32m",
		["yellow"]  = "\x1b[33m",
		["blue"]    = "\x1b[34m",
		["magenta"] = "\x1b[35m",
		["cyan"]    = "\x1b[36m",
		["white"]   = "\x1b[37m",
		["default"] = "\x1b[39m",
	},
	["background"] = {
		["black"]   = "\x1b[40m",
		["red"]     = "\x1b[41m",
		["green"]   = "\x1b[42m",
		["yellow"]  = "\x1b[43m",
		["blue"]    = "\x1b[43m",
		["magenta"] = "\x1b[45m",
		["cyan"]    = "\x1b[46m",
		["white"]   = "\x1b[47m",
		["default"] = "\x1b[49m",
	},
}

function _M.print_with_colors(s, colors)
	if (not colors) then
		print(s)
		return
	end

	local fseq, bseq = "", ""

	if type(colors) == "string" then
		fseq = colors_escape_sequences["foreground"][colors]
	elseif type(colors) == "table" then
		local fcolor, bcolor = colors["foreground"], colors["background"]

		if fcolor then
			fseq = colors_escape_sequences["foreground"][fcolor] or ""
		end
		if bcolor then
			bseq = colors_escape_sequences["background"][bcolor] or ""
		end
	end

	io.write(fseq..bseq)
	io.write(s)
	io.write("\x1b[39m\x1b[49m\n")
end

function _M.print_alert(s)
	_M.print_with_colors(s, {
		foreground = "red",
		background = "white",
	})
end

return _M
