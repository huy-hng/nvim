---@diagnostic disable: duplicate-set-field

---@class map
local map = {}

local mappers = require('modules.keymap.mappers')

map.create = mappers.map_creator
map.parse = mappers.parse_map
map.map = mappers.map

map.nv = mappers.map_creator { 'n', 'x' }
map.nvo = mappers.map_creator { 'n', 'x', 'o' }
map.n = mappers.map_creator('n')
map.v = mappers.map_creator('x')
map.i = mappers.map_creator('i')
map.s = mappers.map_creator('s')
map.x = mappers.map_creator('v')
map.o = mappers.map_creator('o')
map.vo = mappers.map_creator { 'o', 'x' }
map.ov = mappers.map_creator { 'o', 'x' }
map.ic = mappers.map_creator('!')
map.c = mappers.map_creator('c')
map.t = mappers.map_creator('t')

map.unmap = mappers.unmap
map.del = mappers.unmap

map.ctrl = function(key) return string.format('<C-%s>', key) end
map.alt = function(key) return string.format('<A-%s>', key) end

map.meta = require('modules.keymap.metamap')

function map:call(...) self.nvo(...) end

return setmetatable(map, {
	__call = map.call,
	-- __index = function(self, name)
	-- 	P(self, name)

	-- 	local index_fn = getmetatable(self).__index
	-- 	getmetatable(self).__index = nil
	-- 	local method = Map[name]
	-- 	local index_fn = getmetatable(self).__index

	-- 	return method or 'oien'
	-- end,
	-- __newindex = function(self, key, value)
	-- 	getmetatable(self).__newindex = nil

	-- 	local newindex_fn = getmetatable(self).__newindex
	-- 	-- self[key] = function(lhs, rhs, desc) P(lhs, rhs, desc) end
	-- 	local mode, lhs_prefix, desc_prefix, outer_opts = unpack(value)
	-- 	self[key] = mappers.map_creator(mode, lhs_prefix, desc_prefix, outer_opts)

	-- 	getmetatable(self).__newindex = newindex_fn
	-- end,
})
