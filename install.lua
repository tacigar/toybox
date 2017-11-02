
local path = "/usr/local/share/lua/%s/dustbox"

if _VERSION == "Lua 5.1" then
	path = string.format(path, "5.1")
elseif _VERSION == "Lua 5.2" then
	path = string.format(path, "5.2")
elseif _VERSION == "Lua 5.3" then
	path = string.format(path, "5.3")
end

io.popen("cp -r ./ " .. path)
