--- usage:
--- 	`local pref_map = PrefixMap(nmap, '<leader>a')`
--- 	`pref_map('a', ':echo "hello"', 'does stuff')`
---
--- then `<leader>aa` echoes `hello`
---@param mode string | string[] mode in which the keymap is mapped (n, v, i, etc.)
---@param key_prefix string | nil prefix for the keymap (<leader>f)
---@param desc_prefix string | nil prefix for the description ([LSP])
---@param outer_opts table | nil opts for vim.keymap.set ({ silent = true })
---@param fn_opts table | nil opts for this function ({ fast = true })
function PrefixMap(mode, key_prefix, desc_prefix, outer_opts, fn_opts)
	key_prefix = key_prefix or ''
	desc_prefix = desc_prefix and desc_prefix .. ' ' or ''
	outer_opts = outer_opts or { remap = false, silent = true }
	fn_opts = fn_opts or {}

	return function(lhs, rhs, desc, opts)
		lhs = key_prefix .. lhs
		desc = desc_prefix .. (desc or '')
		opts = vim.tbl_extend('force', outer_opts or {}, { desc = desc }, opts or {})

		if type(rhs) == 'function' then
			rhs = Wrap(rhs)
			-- if fn_opts.fast then
			-- 	rhs = Wrap(rhs)
			-- else
			-- 	rhs = TryWrap(2, rhs)
			-- end
		elseif type(rhs) == 'table' then
			rhs = ExtractFnFromTable(rhs, fn_opts.fast and nil or 2)
		end

		if opts.callback then
			if not opts.expr then --
				opts.expr = true
			end

			local fn = opts.callback
			opts.callback = function()
				-- Try(3, fn)
				local res = fn()
				if res then return res end
				return rhs
			end
		end

		Try(1, vim.keymap.set, mode, lhs, rhs, opts)
	end
end

-- map, n, v, s, x, o, !, i, l, c, t

--- Maps so that <Space>lhs is the same as <S-Space>lhs
--- where lhs should be come capitalized letter
MapSpaceCapital = function(mode, lhs, rhs, desc, opts)
	local map = PrefixMap(mode)
	map('<Space>' .. lhs, rhs, desc, opts)
	map('<S-Space>' .. lhs, rhs, desc, opts)
end

UNmap = vim.keymap.del

Map = PrefixMap { 'n', 'v', 'o' }

Nmap = PrefixMap('n') -- actually nnoremap, everything below as well
NVmap = PrefixMap { 'n', 'v' }
Vmap = PrefixMap('v') -- visual and select
Smap = PrefixMap('s') -- select mode
Xmap = PrefixMap('x') -- only visual mode

Omap = PrefixMap('o') -- operator pending mode

Imap = PrefixMap('i')
ICmap = PrefixMap('!') -- insert and commandline
Cmap = PrefixMap('c') -- commandline

Tmap = PrefixMap('t') -- terminal

local M = {}

function M.pop_key_from_tbl(tbl, key)
	local value = tbl[key]
	tbl[key] = nil
	return value
end

function M.restore_maps(saved, bufnr)
	for lhs, map in pairs(saved) do
		if type(map) ~= 'table' then
			-- print('Deleting ' .. lhs)
			vim.keymap.del('n', lhs, { buffer = bufnr })
			goto continue
		end
		-- print('Restoring ' .. lhs)

		local mode = M.pop_key_from_tbl(map, 'mode')
		local rhs = M.pop_key_from_tbl(map, 'rhs')
		_ = M.pop_key_from_tbl(map, 'lnum')
		_ = M.pop_key_from_tbl(map, 'lhsraw')
		_ = M.pop_key_from_tbl(map, 'lhs')
		_ = M.pop_key_from_tbl(map, 'sid')
		_ = M.pop_key_from_tbl(map, 'expr')
		vim.keymap.set(mode, lhs, rhs or '', map)

		::continue::
	end
	saved = {}
end

local function look_for_mapping(lhs, maps)
	for _, map in ipairs(maps) do
		if map.lhs == lhs then return map end
	end
end

function M.create_mapper(mode, saved)
	return function(lhs, rhs, desc)
		local bufnr = vim.api.nvim_get_current_buf()
		local maps = vim.api.nvim_buf_get_keymap(bufnr, mode)

		if not saved[lhs] then
			local map = look_for_mapping(lhs, maps)
			map = map or ''
			saved[lhs] = map
		end

		Nmap(lhs, rhs, desc or '', { buffer = bufnr })
	end
end

return M
