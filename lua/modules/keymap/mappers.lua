local M = {}

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

function M.parse_map(mode, lhs, rhs, desc, opts)
	if type(desc) == 'table' and not opts then
		opts = desc
		desc = nil
	end
	opts = opts or {}
	mode = opts.mode or mode

	-- remove extra opts
	local extra_opts = vim.tbl_extend('force', { langmap = false, fast = true }, opts)
	opts.langmap = nil
	opts.fast = nil
	opts.mode = nil

	if type(rhs) == 'table' then --
		rhs = Util.extract_fn_from_table(rhs, extra_opts.fast)
	end

	-- handle callback option key
	if opts.callback then
		if opts.expr == nil then --
			opts.expr = true
		end

		local fn = opts.callback
		opts.callback = function()
			local res = fn()
			if res then return res end
			return rhs
		end
	end

	return mode, lhs, rhs, opts
end

function M.map(mode, lhs, rhs, desc, opts)
	mode = parse_mode(mode)
	mode, lhs, rhs, opts = M.parse_map(mode, lhs, rhs, desc, opts)

	if type(lhs) == 'string' then lhs = { lhs } end
	for _, l in ipairs(lhs) do
		Try(1, vim.keymap.set, mode, l, rhs, opts)
	end
end

function M.unmap(mode, lhs, opts)
	mode = parse_mode(mode)

	-- remove extra opts
	opts = vim.tbl_extend('force', { langmap = false, fast = true }, opts or {})
	opts.langmap = nil
	opts.fast = nil
	opts.mode = nil

	pcall(function() vim.keymap.del(mode, lhs, opts) end)
	-- Try(1, vim.keymap.del, mode, lhs, opts)
end

--- usage:
--- 	`local pref_map = MapCreator('n', '<leader>a')`
--- 	`pref_map('a', ':echo "hello"', 'does stuff')`
---
--- then `<leader>aa` echoes `hello`
---@param mode string | string[] | nil mode in which the keymap is mapped (n, v, i, etc.) if nil or empty string: 'nvo'
---@param lhs_prefix string | nil prefix for the keymap (<leader>f)
---@param desc_prefix string | nil prefix for the description ([LSP])
---@param outer_opts table | nil opts for vim.keymap.set ({ silent = true }) and extra opts for this function
--- fast: boolean whether to try (seems to be commented out right now)
--- langmap: boolean whether to remap a key to a different keyboard layout (only if langmap has been set)
--- mode: override the mode inside the returned function
function M.map_creator(mode, lhs_prefix, desc_prefix, outer_opts)
	-- TODO: accept lhs_prefix as table to have different prefixes

	mode = parse_mode(mode)

	lhs_prefix = lhs_prefix or ''
	desc_prefix = desc_prefix and desc_prefix .. ' ' or ''

	outer_opts = outer_opts or { remap = false, silent = true, langmap = false, fast = true }

	return function(lhs, rhs, desc, opts)
		lhs = lhs_prefix .. (lhs or '')

		if type(desc) == 'table' and not opts then
			opts = desc
			desc = nil
		end

		desc = desc_prefix .. (desc or '')
		opts = vim.tbl_extend('force', outer_opts, { desc = desc }, opts or {})

		M.map(mode, lhs, rhs, desc, opts)
	end
end

-- map, n, v, s, x, o, !, i, l, c, t

return M
