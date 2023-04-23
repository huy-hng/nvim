---@class Map
local Map = {}

local mappers = require('modules.keymap.mappers')

Map.create = mappers.map_creator
Map.map = mappers.map

Map.nv = mappers.map_creator { 'n', 'v' }
Map.n = mappers.map_creator('n')
Map.v = mappers.map_creator('v')
Map.i = mappers.map_creator('i')
Map.s = mappers.map_creator('s')
Map.x = mappers.map_creator('x')
Map.o = mappers.map_creator('o')
Map.ic = mappers.map_creator('!')
Map.c = mappers.map_creator('c')
Map.t = mappers.map_creator('t')

Map.unmap = mappers.unmap
Map.del = mappers.unmap

Map.meta = require('modules.keymap.metamap')

local nvo = mappers.map_creator { 'n', 'v', 'o' }
function Map:call(...) nvo(...) end

return setmetatable(Map, {
	__call = Map.call,
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
