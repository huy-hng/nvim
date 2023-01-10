local utils = require('metamap.utils')
-- local MapCreator = require('metamap.prefix_mapper')

---@alias mapper fun(mode:mode, lhs: lhs, rhs: rhs, desc: desc?, opts: opts?)


---@param mode mode the mode to map to
---@param lhs lhs keymap
---@param rhs rhs action
---@param desc desc description
---@param opts opts options
local function mapper(mode, lhs, rhs, desc, opts) end

---@param mode mode the mode to map to
---@param lhs lhs keymap
---@param rhs rhs action
---@param desc desc description
---@param opts opts options
---@overload fun(mode: mode, lhs: lhs, rhs: rhs, desc: desc?, opts: table?)
local function mapper(mode, lhs, rhs, opts)
	opts = opts or {}

	if type(rhs) == 'table' then --
		rhs = utils.table_to_function(rhs)
	end

	if opts.callback then
		opts.expr = opts.expr == nil and true

		local fn = opts.callback
		opts.callback = function()
			local res = fn()
			return res or rhs
		end
	end

	if type(lhs) == 'string' then lhs = { lhs } end
	for _, l in ipairs(lhs) do
		vim.keymap.set(mode, l, rhs, opts)
	end
end
---@alias mode_wrap fun(lhs: lhs, rhs: rhs, desc: desc?, opts: opts?)

---@return mode_wrap
local function mode_wrap(mode)
	return function(lhs, rhs, desc, opts) mapper(mode, lhs, rhs, desc, opts) end
end

---field m function

---@class Map
---@field m mode_wrap
---@field n mode_wrap
---@field nv mode_wrap
---@field v mode_wrap
---@field s mode_wrap
---@field i mode_wrap
---@field ic mode_wrap
---@field c mode_wrap
---@field x mode_wrap
---@field o mode_wrap
---@field t mode_wrap
---@field del mode_wrap
---@return Map
---cast mapper function
local Map = function()
	return setmetatable({}, {
		__index = {
			m = mode_wrap { 'n', 'v', 'o' },
			nv = mode_wrap { 'n', 'v' },

			n = mode_wrap('n'),
			v = mode_wrap('v'),
			i = mode_wrap('i'),
			s = mode_wrap('s'),
			x = mode_wrap('x'),
			o = mode_wrap('o'),
			ic = mode_wrap('!'),
			c = mode_wrap('c'),
			t = mode_wrap('t'),
			del = vim.keymap.del,
		},
		__newindex = function(_, key, value) print(key, value) end,
		---@type mapper
		__call = function(_, ...) mapper(...) end,
	})
end

-- local map = Map()
-- map('asd', 1,2)
-- map['asdf'] = 123
-- map2.n('z', 'y')
-- map2()
-- map.n('nmap')
-- map.n.a = 'eas'
-- P(map)
-- map.n('nmap')
return Map()
