package = "toybox"
version = "0.1-0"

source = {
	url = "git://github.com/tacigar/lua-hatenablog",
	tag = "v0.1",
}

description = {
	summary = "Lua Utility Modules",
     	detailed = "This library provides Lua Utility Modules",
     	homepage = "https://github.com/tacigar/toybox",
     	license = "GPLv3",
}

dependencies = {
	"lua >= 5.1, < 5.4"
}

build = {
	type = "builtin",
	modules = {
		["toybox.geom"] = "toybox/geom.lua",
		["toybox.geom.point2d"] = "toybox/geom/point2d.lua",
		["toybox.math"] = "toybox/math.lua",
		["toybox.math.functions"] = "toybox/math/functions.lua",
		["toybox.string"] = "toybox/string.lua",
		["toybox.string.functions"] = "toybox/string/functions.lua",
		["toybox.string.extension"] = "toybox/string/extension.lua",
		["toybox.string.extension.char_at"] = "toybox/string/extension/char_at.lua",
		["toybox.string.extension.functions"] = "toybox/string/extension/functions.lua",
		["toybox.string.extension.range"] = "toybox/string/extension/range.lua",
		["toybox.uuid"] = "toybox/uuid.lua",
		["toybox.uuid.core"] = "toybox/uuid/core.c",
	},
}
