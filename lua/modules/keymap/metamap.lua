--@alias saved_buffer_keymap
--| { buffer: number, callback: function, rhs: string|nil, desc: string, expr: number, lhs: string, lhsraw: string, lnum: number, mode: string, noremap: number, nowait: number, script: number, sid: number, silent: number, }

---@alias mode modes | modes[]
---@alias lhs string | table
---@alias rhs string | function | table
---@alias desc string?
---@alias opts table?

---@alias modes
---| 'n' normal
---| 'v' visual + select
---| 'i' insert
---| 'x' visual
---| 's' select
---| 'o' operator
---| 'c' command
---| 'l' language
---| 't' terminal

---@class MetaMap
---@field registered_maps { mode: mode, lhs: string|table, rhs: string|function, opts: table? }
---@field saved_maps table<string, table|string>
---@field name string?
---@field has_exit boolean
local MetaMap = {}

---@param name string?
---@return MetaMap
function MetaMap:new(name)
	local o = setmetatable({}, self)
	o.has_exit = false
	o.name = name or ''
	o.registered_maps = {}
	o.saved_maps = {}
	return o
end

function MetaMap:enter(mode, lhs, callback, opts)
	opts = opts or {}
	opts.desc = 'Enter ' .. self.name
	opts.langmap = true
	-- vim.keymap.set(mode, lhs, function()
	Map.map(mode, lhs, function()
		local bufnr = vim.api.nvim_get_current_buf()
		if not self.has_exit then
			vim.notify('You have not set an exit map. The enter map will be used to exit.', 3)
			self:exit(mode, lhs)
		end

		vim.b[bufnr].MetaMap = self.name
		vim.notify('Entering ' .. self.name .. ' mode')

		self:create_maps(bufnr)

		if type(callback) == 'function' then callback() end
	end, opts)
end

--------------------------------------------register maps-------------------------------------------

---@param mode mode
---@param lhs lhs if a table is passed, every lhs in table will be mapped to rhs
---@param rhs rhs if a table is passed, the first element will be called, and the other elements are treated as parameters
---@param desc desc
---@param opts opts
function MetaMap:map(mode, lhs, rhs, desc, opts)
	opts = opts or {}
	if not opts.langmap then opts.langmap = false end

	mode, lhs, rhs, opts = Map.parse(mode, lhs, rhs, desc, opts)

	if type(lhs) == 'string' then lhs = { lhs } end

	for _, l in ipairs(lhs) do
		table.insert(self.registered_maps, { mode, l, rhs, opts })
	end
end

function MetaMap.map_wrap(mode)
	return function(self, lhs, rhs, desc, opts) self:map(mode, lhs, rhs, desc, opts) end
end

MetaMap.n = MetaMap.map_wrap('n')
MetaMap.v = MetaMap.map_wrap('v')
MetaMap.i = MetaMap.map_wrap('i')
MetaMap.n = MetaMap.map_wrap('n')
MetaMap.v = MetaMap.map_wrap('v')
MetaMap.i = MetaMap.map_wrap('i')
MetaMap.s = MetaMap.map_wrap('s')
MetaMap.x = MetaMap.map_wrap('x')
MetaMap.o = MetaMap.map_wrap('o')
MetaMap.ic = MetaMap.map_wrap('!')
MetaMap.c = MetaMap.map_wrap('c')
MetaMap.t = MetaMap.map_wrap('t')
-- function MetaMap:n(lhs, rhs, desc, opts) self:map('n', lhs, rhs, desc, opts) end

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

--------------------------------------------Actual mapping------------------------------------------

function MetaMap.restore_map(lhs, map, bufnr)
	if type(map) ~= 'table' then
		Map.unmap('n', lhs, { buffer = bufnr })
		return
	end

	local mode = table.remove_key(map, 'mode')
	local rhs = table.remove_key(map, 'rhs')
	_ = table.remove_key(map, 'lnum')
	_ = table.remove_key(map, 'lhsraw')
	_ = table.remove_key(map, 'lhs')
	_ = table.remove_key(map, 'sid')
	_ = table.remove_key(map, 'expr')
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

		Map.map(mode, lhs, rhs, opts)
		-- vim.keymap.set(mode, lhs, rhs, opts)
	end
end

MetaMap.__index = MetaMap
MetaMap.__call = MetaMap.map

return setmetatable(MetaMap, {
	__call = MetaMap.new,
})
