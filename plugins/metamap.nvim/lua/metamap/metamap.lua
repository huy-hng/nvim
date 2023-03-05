local utils = require('metamap.utils')
require('metamap.types')

---@class MetaMap
---@field registered_maps { mode: mode, lhs: string|table, rhs: string|function, opts: table? }
---@field saved_maps table<string, table|string>
---@field name string?
---@field has_exit boolean
local MetaMap = {}
MetaMap.__index = MetaMap

---@type MetaMap
---@param name string?
---@return MetaMap
function MetaMap.new(name)
	local self = {}
	setmetatable(self, MetaMap)
	self.has_exit = false
	self.name = name or ''
	self.registered_maps = {}
	self.saved_maps = {}
	return self
end

--------------------------------------------register maps-------------------------------------------

---@param mode mode
---@param lhs lhs if a table is passed, every lhs in table will be mapped to rhs
---@param rhs rhs if a table is passed, the first element will be called, and the other elements are treated as parameters
---@param desc desc
---@param opts opts
---@overload fun(mode: mode, lhs: lhs, rhs: rhs, opts: opts)
function MetaMap:map(mode, lhs, rhs, desc, opts)
	if type(rhs) == 'table' then --
		rhs = utils.table_to_function(rhs)
	end

	opts = opts or {}
	opts.desc = desc or ''

	if type(lhs) == 'string' then lhs = { lhs } end

	for _, l in ipairs(lhs) do
		-- vim.notify('registering ' .. l)
		table.insert(self.registered_maps, { mode, l, rhs, opts })
	end
end

function MetaMap:enter(mode, lhs, callback, opts)
	opts = opts or {}
	opts.desc = 'Enter ' .. self.name
	vim.keymap.set(mode, lhs, function()
		local bufnr = vim.api.nvim_get_current_buf()
		if not self.has_exit then
			vim.notify(
				'You have not set an exit map. The enter map will be used to exit.',
				'warning'
			)
			self:exit(mode, lhs)
		end

		vim.b[bufnr].MetaMap = self.name
		vim.notify('Entering ' .. self.name .. ' mode')

		self:create_maps(bufnr)

		if type(callback) == 'function' then callback() end
	end, opts)
end
function MetaMap:exit(mode, lhs, callback, opts)
	self.has_exit = true

	self:map(mode, lhs, function()
		if type(callback) == 'function' then callback() end
		local bufnr = vim.api.nvim_get_current_buf()

		vim.b[bufnr].MetaMap = nil
		vim.notify('Exiting ' .. self.name .. ' mode')
		self:restore_maps(bufnr)
	end, 'Exit ' .. self.name, opts or {})
end

function MetaMap:nmap(lhs, rhs, desc, opts) self:map('n', lhs, rhs, desc, opts) end
function MetaMap:vmap(lhs, rhs, desc, opts) self:map('v', lhs, rhs, desc, opts) end
function MetaMap:imap(lhs, rhs, desc, opts) self:map('i', lhs, rhs, desc, opts) end

--------------------------------------------Actual mapping------------------------------------------

function MetaMap.restore_map(lhs, map, bufnr)
	if type(map) ~= 'table' then
		vim.keymap.del('n', lhs, { buffer = bufnr })
		return
	end

	local mode = utils.pop_key(map, 'mode')
	local rhs = utils.pop_key(map, 'rhs')
	_ = utils.pop_key(map, 'lnum')
	_ = utils.pop_key(map, 'lhsraw')
	_ = utils.pop_key(map, 'lhs')
	_ = utils.pop_key(map, 'sid')
	_ = utils.pop_key(map, 'expr')
	vim.keymap.set(mode, lhs, rhs or '', map)
end

function MetaMap:restore_maps(bufnr)
	for lhs, map in pairs(self.saved_maps) do
		MetaMap.restore_map(lhs, map, bufnr)
	end
	self.saved_maps = {}
end

function MetaMap.find_map(mode_map, lhs)
	for _, map in ipairs(mode_map) do
		if map.lhs == lhs then return map end
	end
end

function MetaMap:save_map(mode_map, lhs)
	if not self.saved_maps[lhs] then
		local found = MetaMap.find_map(mode_map, lhs)
		found = found or ''
		self.saved_maps[lhs] = found
	end
end

function MetaMap:create_maps(bufnr)
	-- TODO: put maps in seperate tables sorted by mode so that the below is cheaper to do
	local mode_maps = {
		n = vim.api.nvim_buf_get_keymap(bufnr, 'n'),
		v = vim.api.nvim_buf_get_keymap(bufnr, 'v'),
	}

	for _, map in ipairs(self.registered_maps) do
		local mode, lhs, rhs, opts = unpack(map)
		-- vim.notify('mapping over ' .. lhs)

		self:save_map(mode_maps[mode], lhs)

		opts.buffer = bufnr
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

return MetaMap
