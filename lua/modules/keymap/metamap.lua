---@diagnostic disable: duplicate-set-field, duplicate-doc-field

---@class Metamap
---@field registered_maps { mode: string, lhs: string|table, rhs: string|function, opts: table? }
---@field saved_maps table<string, table|string>
---@field name string?
---@field bufnr number?
---@field opts table?
---@field has_exit_map boolean
local Metamap = {}

---@param name string?
---@param opts table?
---@return Metamap
function Metamap:new(name, opts)
	local self_ = setmetatable({}, self)
	self_.has_exit_map = false
	self_.has_enter_map = false
	self_.name = name or ''
	self_.opts = opts or {}
	self_.bufnr = nil
	self_.registered_maps = {}
	self_.saved_maps = {}
	return self_
end

---------------------------------------------Metamap Maps-------------------------------------------

function Metamap:map_enter(mode, lhs, callback, opts)
	self.has_enter_map = true

	opts = opts or {}
	opts.desc = 'Enter ' .. self.name

	Map.map(mode, lhs, function()
		if not self.has_exit_map then
			vim.notify('You have not set an exit map. The enter map will be used to exit.', 3)
			self:map_exit(mode, lhs)
		end

		if self.opts.buffer then
			self:create_buf_maps()
		else
			self:create_maps()
		end

		if type(callback) == 'function' then callback() end
	end, opts)
end

function Metamap:map_exit(mode, lhs, callback, opts)
	self.has_exit_map = true

	self:map(mode, lhs, function()
		if type(callback) == 'function' then callback() end
		-- local bufnr = vim.api.nvim_get_current_buf()

		self:restore_maps(self.bufnr)
	end, 'Exit ' .. self.name, opts or {})
end

function Metamap:map(mode, lhs, rhs, desc, opts)
	opts = opts or {}

	mode, lhs, rhs, opts = Map.parse(mode, lhs, rhs, desc, opts)

	if type(lhs) == 'string' then lhs = { lhs } end

	for _, l in ipairs(lhs) do
		table.insert(self.registered_maps, { mode, l, rhs, opts })
	end
end

function Metamap.map_wrap(mode)
	return function(self, lhs, rhs, desc, opts) self:map(mode, lhs, rhs, desc, opts) end
end

(function()
	Metamap.n = Metamap.map_wrap('n')
	Metamap.o = Metamap.map_wrap('o')

	Metamap.v = Metamap.map_wrap('x')
	Metamap.x = Metamap.map_wrap('v')
	Metamap.s = Metamap.map_wrap('s')

	Metamap.i = Metamap.map_wrap('i')
	Metamap.ic = Metamap.map_wrap('!')
	Metamap.c = Metamap.map_wrap('c')
	Metamap.t = Metamap.map_wrap('t')
end)()

----------------------------------------------Save Maps---------------------------------------------

local function find_map(mode_map, lhs)
	for _, map in ipairs(mode_map) do
		if map.lhs == lhs then return map end
	end
end

function Metamap:save_map(mode_map, lhs)
	if not self.saved_maps[lhs] then
		local found = find_map(mode_map, lhs)
		found = found or ''
		self.saved_maps[lhs] = found
	end
end

---------------------------------------------Create Maps--------------------------------------------

function Metamap:enter_event()
	if not self.has_enter_map and not self.has_exit_map then
		vim.notify('You have not set an exit map. The <ESC> will be used to exit.', 3)
		self:map_exit('n', '<esc>')
	end

	if self.bufnr then
		vim.b[self.bufnr].Metamap = self.name
	else
		vim.g.Metamap = self.name
	end
	vim.notify('Entering ' .. self.name .. ' mode')
end

function Metamap:create_buf_maps(bufnr)
	self.bufnr = bufnr or vim.api.nvim_get_current_buf()
	self:enter_event()

	-- TODO: put maps in seperate tables sorted by mode so that the below is cheaper to do
	local mode_maps = {
		n = vim.api.nvim_buf_get_keymap(self.bufnr, 'n'),
		v = vim.api.nvim_buf_get_keymap(self.bufnr, 'x'),
	}

	for _, map in ipairs(self.registered_maps) do
		local mode, lhs, rhs, opts = unpack(map)
		opts.buffer = self.bufnr

		self:save_map(mode_maps[mode], lhs)
		Map.map(mode, lhs, rhs, opts)
	end
end

function Metamap:create_maps()
	self:enter_event()

	local mode_maps = {
		n = vim.api.nvim_get_keymap('n'),
		v = vim.api.nvim_get_keymap('v'),
	}

	for _, map in ipairs(self.registered_maps) do
		local mode, lhs, rhs, opts = unpack(map)

		self:save_map(mode_maps[mode], lhs)
		Map.map(mode, lhs, rhs, opts)
	end
end

---------------------------------------------Restore Maps-------------------------------------------

local function restore_map(lhs, map, bufnr)
	if type(map) ~= 'table' then
		Map.unmap('n', lhs, { buffer = bufnr } or {})
		return
	end

	local opts = {
		buffer = bufnr,
		desc = map.desc,
		silent = map.silent,
		expr = map.expr ~= 0 and map.expr,
		noremap = map.noremap,
		nowait = map.nowait,
		callback = map.callback,
	}

	Map.map(map.mode, lhs, map.rhs or '', opts)
	-- local status, err = pcall(function() vim.keymap.set(map.mode, lhs, map.rhs or '', opts) end)
	-- if not status then P(err, map) end
end

function Metamap:restore_maps(bufnr)
	self:exit_event()

	for lhs, map in pairs(self.saved_maps) do
		restore_map(lhs, map, bufnr)
	end
	self.saved_maps = {}
	self.bufnr = nil
end

function Metamap:exit_event()
	vim.notify('Exiting ' .. self.name .. ' mode')

	if self.bufnr then
		vim.b[self.bufnr].Metamap = nil
		return
	end

	vim.g.Metamap = nil
end

Metamap.__index = Metamap
Metamap.__call = Metamap.map

return setmetatable(Metamap, {
	__call = Metamap.new,
})
