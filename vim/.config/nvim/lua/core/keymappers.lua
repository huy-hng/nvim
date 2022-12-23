--- usage:
--- 	`local pref_map = PrefixMap(nmap, '<leader>a')`
--- 	`pref_map('a', ':echo "hello"', 'does stuff')`
---
--- then `<leader>aa` echoes `hello`
---@param mode string | string[] mode in which the keymap is mapped (n, v, i, etc.)
---@param lhs_prefix string | nil prefix for the keymap (<leader>f)
---@param desc_prefix string | nil prefix for the description ([LSP])
---@param outer_opts table | nil opts for vim.keymap.set ({ silent = true })
---@param fn_opts table | nil opts for this function ({ fast = true })
function MapCreator(mode, lhs_prefix, desc_prefix, outer_opts, fn_opts)
	lhs_prefix = lhs_prefix or ''
	desc_prefix = desc_prefix and desc_prefix .. ' ' or ''
	outer_opts = outer_opts or { remap = false, silent = true }
	fn_opts = fn_opts or {}

	return function(lhs, rhs, desc, opts)
		lhs = lhs_prefix .. lhs
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
	local map = MapCreator(mode)
	map('<Space>' .. lhs, rhs, desc, opts)
	map('<S-Space>' .. lhs, rhs, desc, opts)
end

Unmap = vim.keymap.del

Map = MapCreator { 'n', 'v', 'o' }

Nmap = MapCreator('n') -- actually nnoremap, everything below as well
NVmap = MapCreator { 'n', 'v' }
Vmap = MapCreator('v') -- visual and select
Smap = MapCreator('s') -- select mode
Xmap = MapCreator('x') -- only visual mode

Omap = MapCreator('o') -- operator pending mode

Imap = MapCreator('i')
ICmap = MapCreator('!') -- insert and commandline
Cmap = MapCreator('c') -- commandline

Tmap = MapCreator('t') -- terminal
