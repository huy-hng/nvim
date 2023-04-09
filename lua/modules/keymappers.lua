local M = {}

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
function M.map_creator(mode, lhs_prefix, desc_prefix, outer_opts, fn_opts)
	lhs_prefix = lhs_prefix or ''
	desc_prefix = desc_prefix and desc_prefix .. ' ' or ''
	outer_opts = outer_opts or { remap = false, silent = true }
	fn_opts = fn_opts or {}

	return function(lhs, rhs, desc, opts)
		lhs = lhs_prefix .. lhs
		desc = desc_prefix .. (desc or '')
		opts = vim.tbl_extend('force', outer_opts or {}, { desc = desc }, opts or {})

		-- if type(rhs) == 'function' then
		-- 	rhs = Wrap(rhs)
			-- if fn_opts.fast then
			-- 	rhs = Wrap(rhs)
			-- else
			-- 	rhs = TryWrap(2, rhs)
			-- end
		if type(rhs) == 'table' then
			rhs = Util.extract_fn_from_table(rhs, fn_opts.fast)
		end

		if opts.callback then
			if not opts.expr then --
				opts.expr = true
			end

			local fn = opts.callback
			opts.callback = function()
				local res = fn()
				if res then return res end
				return rhs
			end
		end

		local letters = lhs:gmatch('<%a+>')

		-- print(' ')
		-- P(lhs, letters())

		-- local letters = lhs:gmatch('%<%a+%>')
		-- for _, val in letters do
		-- 	P(val)
		-- end

		Try(1, vim.keymap.set, mode, lhs, rhs, opts)
	end
end

-- map, n, v, s, x, o, !, i, l, c, t

--- Maps so that <Space>lhs is the same as <S-Space>lhs
--- where lhs should be come capitalized letter
M.map_space_capital = function(mode, lhs, rhs, desc, opts)
	local map = M.map_creator(mode)
	map('<Space>' .. lhs, rhs, desc, opts)
	map('<S-Space>' .. lhs, rhs, desc, opts)
end


return M
