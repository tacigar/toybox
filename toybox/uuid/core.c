/* ==================================================================
 * toybox
 * Copyright (C) 2017 tacigar
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * ================================================================== */

#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
#include <string.h>
#include <uuid/uuid.h>

#define UUID_CLASS "toybox.uuid.core.uuid"

typedef struct uuid_class_ {
	uuid_t id_;
} uuid_class;

static uuid_class *new_uuid(lua_State *L) {
	uuid_class *obj;
	obj = (uuid_class *)lua_newuserdata(L, sizeof(uuid_class));

	luaL_getmetatable(L, UUID_CLASS);
	lua_setmetatable(L, -2);
	return obj;
}

static int generate(lua_State *L) {
	uuid_t id;
	uuid_class *obj;

	uuid_generate(id);
	obj = new_uuid(L);
	uuid_copy(obj->id_, id);

	return 1;
}

static int clone(lua_State *L) {
	uuid_t id;
	uuid_class *obj;

	obj = luaL_checkudata(L, 1, UUID_CLASS);
	uuid_copy(id, obj->id_);

	obj = new_uuid(L);
	uuid_copy(obj->id_, id);

	return 1;
}

static int unparse(lua_State *L) {
	uuid_class *obj;
	uuid_string_t str;

	obj = luaL_checkudata(L, 1, UUID_CLASS);
	if (lua_isstring(L, 2) == 1) {
		const char *op = lua_tostring(L, 2);
		if (strcmp(op, "upper")) {
			uuid_unparse_upper(obj->id_, str);
		} else if(strcmp(op, "lower")) {
			uuid_unparse_lower(obj->id_, str);
		} else {
			uuid_unparse(obj->id_, str);
		}
	} else {
		uuid_unparse(obj->id_, str);
	}

	lua_pushstring(L, (const char *)str);
	return 1;
}

static int compare(lua_State *L) {
	uuid_class *lhs;
	uuid_class *rhs;

	lhs = luaL_checkudata(L, 1, UUID_CLASS);
	rhs = luaL_checkudata(L, 2, UUID_CLASS);

	lua_pushboolean(L, uuid_compare(lhs->id_, rhs->id_) == 0);
	return 1;
}

static int parse(lua_State *L) {
	uuid_t id;
	uuid_class *obj;

	const char *str = luaL_checkstring(L, 1);
	uuid_parse(str, id);

	obj = new_uuid(L);
	uuid_copy(obj->id_, id);

	return 1;
}

static int clear(lua_State *L) {
	uuid_class *obj;
	obj = luaL_checkudata(L, 1, UUID_CLASS);
	uuid_clear(obj->id_);
	return 0;
}

static int is_null(lua_State *L) {
	uuid_class *obj;
	obj = luaL_checkudata(L, 1, UUID_CLASS);
	lua_pushboolean(L, uuid_is_null(obj->id_));
	return 1;
}

static const luaL_Reg methods[] = {
	{ "clone",    clone   },
	{ "unparse",  unparse },
	{ "clear",    clear   },
	{ "is_null",  is_null },
	{ "compare",  compare },
	{ "__eq",     compare },
	{ NULL, NULL }
};

static void register_methods(lua_State *L) {
	luaL_newmetatable(L, UUID_CLASS);
	lua_pushvalue(L, -1);
	lua_setfield(L, -2, "__index");
	luaL_setfuncs(L, methods, 0);
	lua_pop(L, 1);
}

static const luaL_Reg functions[] = {
	{ "generate", generate },
	{ "parse",    parse    },
	{ NULL, NULL }
};

LUALIB_API int luaopen_toybox_uuid_core(lua_State *L) {
	register_methods(L);
	luaL_newlib(L, functions);
	return 1;
}
