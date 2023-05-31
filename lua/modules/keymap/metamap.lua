---@diagnostic disable: duplicate-set-field, duplicate-doc-field

---@class Metamap
---@field registered_maps { mode: string, lhs: string|table, rhs: string|function, opts: table? }
---@field saved_maps table<string, table|string>
---@field name string?
---@field buffer boolean?
---@field has_exit_map boolean
local Metamap = {}

---@param name string?
---@param buffer boolean?
---@return Metamap
function Metamap:new(name, buffer)
	local self_ = setmetatable({}, self)
	self_.has_exit_map = false
	self_.has_enter_map = false
	self_.name = name or ''
	self_.buffer = buffer or false
	self_.registered_maps = {}
	self_.saved_maps = {}
	return self_
end

--------------------------------------------register maps-------------------------------------------

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

function Metamap:enter_event(bufnr)
	if not self.has_enter_map and not self.has_exit_map then
		vim.notify('You have not set an exit map. The <ESC> will be used to exit.', 3)
		self:map_exit('n', '<esc>')
	end

	if bufnr then
		vim.b[bufnr].Metamap = self.name
	else
		vim.g.Metamap = self.name
	end
	vim.notify('Entering ' .. self.name .. ' mode')
end

function Metamap:create_buf_maps()
	local bufnr = vim.api.nvim_get_current_buf()
	self:enter_event(bufnr)

	-- TODO: put maps in seperate tables sorted by mode so that the below is cheaper to do
	local mode_maps = {
		n = vim.api.nvim_buf_get_keymap(bufnr, 'n'),
		v = vim.api.nvim_buf_get_keymap(bufnr, 'v'),
	}

	for _, map in ipairs(self.registered_maps) do
		local mode, lhs, rhs, opts = unpack(map)
		opts.buffer = bufnr

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

function Metamap.restore_map(lhs, map, bufnr)
	print(lhs, bufnr)
	if type(map) ~= 'table' then
		local opts = bufnr and { buffer = bufnr } or {}
		Map.unmap('n', lhs, opts)
		return
	end

	-- P(map)
	local mode = table.remove_key(map, 'mode')
	local rhs = table.remove_key(map, 'rhs')
	_ = table.remove_key(map, 'lnum')
	_ = table.remove_key(map, 'lhsraw')
	_ = table.remove_key(map, 'lhs')
	_ = table.remove_key(map, 'sid')
	_ = table.remove_key(map, 'expr')
	_ = table.remove_key(map, 'replace_keycodes')

	-- pcall(function() vim.keymap.set(mode, lhs, rhs or '', map) end)
	vim.keymap.set(mode, lhs, rhs or '', map)
end

function Metamap:restore_maps()
	local bufnr = self.buffer and vim.api.nvim_get_current_buf() or nil

	for lhs, map in pairs(self.saved_maps) do
		Metamap.restore_map(lhs, map, bufnr)
	end
	self.saved_maps = {}

	vim.notify('Exiting ' .. self.name .. ' mode')
	if not bufnr then
		vim.g.Metamap = nil
		return
	end

	vim.b[bufnr].Metamap = nil
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

		if self.buffer then
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

		self:restore_maps()
	end, 'Exit ' .. self.name, opts or {})
end


Metamap.n = Metamap.map_wrap('n')
Metamap.v = Metamap.map_wrap('v')
Metamap.i = Metamap.map_wrap('i')
Metamap.n = Metamap.map_wrap('n')
Metamap.v = Metamap.map_wrap('v')
Metamap.i = Metamap.map_wrap('i')
Metamap.s = Metamap.map_wrap('s')
Metamap.x = Metamap.map_wrap('x')
Metamap.o = Metamap.map_wrap('o')
Metamap.ic = Metamap.map_wrap('!')
Metamap.c = Metamap.map_wrap('c')
Metamap.t = Metamap.map_wrap('t')

Metamap.__index = Metamap
Metamap.__call = Metamap.map

return setmetatable(Metamap, {
	__call = Metamap.new,
})
