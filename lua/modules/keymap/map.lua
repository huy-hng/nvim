---@diagnostic disable: duplicate-set-field

---@class Map
---@field lhs_prefix string
---@field rhs_prefix string
---@field desc_prefix string
---@field opts table
---@operator call:function
local Map = {}

local function parse_mode(mode)
	if type(mode) == 'table' then return mode end

	if not mode or mode == '' then --
		return { 'n', 'x', 'o' }
	end

	local modes = {}
	for i = 1, #mode do
		local m = mode:sub(i, i)
		if m == 'v' then
			m = 'x'
		elseif m == 'x' then
			m = 'v'
		end
		table.insert(modes, m)
	end
	return modes
end

function Map.parse(self, mode, lhs, rhs, desc, opts)
	if type(desc) == 'table' and not opts then
		opts = desc
		desc = nil
	end
	opts = opts or {}
	desc = self.desc_prefix .. (desc or '')
	opts = vim.tbl_extend('force', self.opts, { desc = desc }, opts or {})

	-- remove extra opts
	local extra_opts = vim.tbl_extend('force', { fast = true }, opts)
	opts.fast = nil

	if type(rhs) == 'table' then --
		rhs = Util.extract_fn_from_table(rhs, extra_opts.fast)
	end

	if opts.callback then
		opts.expr = Util.nil_or_true(opts.expr)

		local fn = opts.callback
		opts.callback = function() return fn() or rhs end
	end

	return mode, lhs, rhs, opts
end

function Map.map(self, mode, lhs, rhs, desc, opts)
	mode = parse_mode(mode)
	mode, lhs, rhs, opts = Map.parse(self, mode, lhs, rhs, desc, opts)

	if type(rhs) == 'string' then --
		rhs = self.rhs_prefix .. rhs
	end

	if type(lhs) == 'string' then lhs = { lhs } end

	for _, l in ipairs(lhs) do
		l = self.lhs_prefix .. (l or '')
		Try(1, vim.keymap.set, mode, l, rhs, opts)
	end
end

function Map.unmap(_, mode, lhs, opts) --
	pcall(vim.keymap.del, parse_mode(mode), lhs, opts)
end

---@param lhs_prefix string?
---@param rhs_prefix string?
---@param desc_prefix string?
---@param opts table?
---@nodiscard
---@return Map
function Map.new(_, lhs_prefix, rhs_prefix, desc_prefix, opts)
	local this = setmetatable({}, Map)
	this.lhs_prefix = lhs_prefix or ''
	this.rhs_prefix = rhs_prefix or ''
	this.desc_prefix = desc_prefix or ''
	this.opts = vim.tbl_extend('force', {
		remap = false,
		silent = true,
	}, opts or {})
	return this
end

Map.__call = function(self, ...) Map.map(self, 'nvo', ...) end

Map.__index = function(self, name)
	return function(...)
		local fn = Map[name]
		if fn then return fn(self, ...) end
		Map.map(self, name, ...)
	end
end

Map.meta = require('modules.keymap.metamap')
-----------------------------------------------testing----------------------------------------------

return setmetatable({
	lhs_prefix = '',
	rhs_prefix = '',
	desc_prefix = '',
	opts = { remap = false, silent = true },
}, Map)
