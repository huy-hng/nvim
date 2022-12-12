---@diagnostic disable: lowercase-global


local function bind(op, outer_opts)
	outer_opts = outer_opts or {
		noremap = true,
		silent = true,
	}

	return function(lhs, rhs, description, opts)
		opts = vim.tbl_extend('force', outer_opts, { desc = description or '' }, opts or {})
		rhs = ExtractFnFromTable(rhs)
		local status, _ = pcall(vim.keymap.set, op, lhs, rhs, opts)
		if not status then print('Keymap Error: ', op, lhs, rhs, debug.traceback()) end
	end
end

-- map
-- nmap
-- vmap
-- smap
-- xmap
-- omap
-- map!
-- imap
-- lmap
-- cmap
-- tmap

unmap = vim.keymap.del
map = function(op, lhs, rhs, description, opts)
	opts = opts or {}
	opts.desc = description or ''
	vim.keymap.set(op, lhs, rhs, opts)
end

nremap = bind('n', { noremap = false })

nmap = bind('n') -- actually nnoremap, everything below as well
nvmap = bind { 'n', 'v' }
vmap = bind('v') -- visual and select
smap = bind('s') -- select mode
xmap = bind('x') -- only visual mode

omap = bind('o') -- operator pending mode

imap = bind('i')
icmap = bind('!') -- insert and commandline
cmap = bind('c') -- commandline

tmap = bind('t') -- terminal

local default_opts = {
	mode = 'n', -- NORMAL mode
	-- prefix: use "<leader>f" for example for mapping everything related to finding files
	-- the prefix is prepended to every mapping part of `mappings`
	key_prefix = '',
	desc_prefix = '',
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	-- silent = true, -- use `silent` when creating keymaps
	-- noremap = true, -- use `noremap` when creating keymaps
	-- nowait = false, -- use `nowait` when creating keymaps
}

---@param opts (table)
---@param maps (table)
---
---@returns 2-tuple:
---  - Map of client-id:request-id pairs for all successful requests.
---  - Function which can be used to cancel all the requests. You could instead
---    iterate all clients and call their `cancel_request()` methods.
function Map(opts, maps)
	opts = vim.tbl_extend('force', default_opts, opts or {})

	local desc_prefix = opts.desc_prefix
	if string.len(opts.desc_prefix) > 0 then desc_prefix = desc_prefix .. ' ' end

	for lhs, rest in pairs(maps) do
		local rhs = rest[1]
		local desc = rest[2]
		-- local opts = rest[3]
		opts = vim.tbl_extend('force', opts, rest[3] or {})

		if type(rhs) == 'table' then
			local fn = table.remove(rhs, 1)
			local args = rhs
			rhs = function()
				fn(unpack(args))
			end
		end
		-- P(opts)

		map(opts.mode, opts.key_prefix .. lhs, rhs, desc_prefix .. desc)
	end
end


function Map2(mode, key_prefix, desc_prefix, maps, opts)
	if desc_prefix then desc_prefix = desc_prefix .. ' ' end
	opts = opts or {}

	for _, map in pairs(maps) do
		local lhs = map[1]
		local rhs = map[2]
		local desc = map[3]
		-- local opts = map[4]
		P(map)
		opts = vim.tbl_extend('force', opts, map[4] or {})

		if type(rhs) == 'table' then
			local fn = table.remove(rhs, 1)
			local args = rhs
			rhs = function()
				fn(unpack(args))
			end
		end
		-- P(opts)

		-- map(mode, key_prefix .. lhs, rhs, desc_prefix .. desc, opts)
		opts = opts or {}
		opts.desc = (desc_prefix .. desc) or ''
		vim.keymap.set(mode, key_prefix .. lhs, rhs, opts)
	end
end


--[[usage:
	local pref_map = PrefixMap(nmap, '<leader>a')
	pref_map('a', ':echo "hello"', 'does stuff')
--]]
function PrefixMap(mode, key_prefix, desc_prefix, outer_opts)
	if desc_prefix then desc_prefix = desc_prefix .. ' ' end
	return function(lhs, rhs, desc, opts)
		lhs = key_prefix .. lhs
		rhs = ExtractFnFromTable(rhs)
		desc = desc_prefix .. (desc or '')
		opts = vim.tbl_extend('force', outer_opts or {}, { desc = desc }, opts or {})

		local status, _ = pcall(vim.keymap.set, mode, lhs, rhs, opts)
		if not status then print('Keymap Error: ', mode, lhs, rhs, debug.traceback()) end
	end
end

-- local asdf = PrefixMap(nmap, '<leader>p', '[printo]')
-- asdf('s', { print, 'hello', 'world' }, 'prints other stuff')

-- Map2('n', '<leader>p', '[Printer]', {
-- 	{ 'a', { print, '123', 'asd' }, 'prints stuff' },
-- 	{ 's', { print, 'hello', 'world' }, 'prints other stuff' },
-- })

-- Map({ key_prefix = '<leader>p', desc_prefix = '[Printer]' }, {
-- 	a = { { print, 'asd', 'asd' }, 'prints stuff', { mode = { 'n', 'v' } } },
-- 	s = { { print, 'hello', 'world' }, 'prints other stuff' },
-- })
