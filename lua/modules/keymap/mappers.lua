local M = {}

local function translate(lhs)
	if not LangmapTranslator then return lhs end

	if type(lhs) == 'string' then --
		return LangmapTranslator(lhs)
	end

	for i, l in ipairs(lhs) do
		lhs[i] = LangmapTranslator(l)
	end

	return lhs
end

function M.parse_map(mode, lhs, rhs, desc, opts)
	if type(desc) == 'table' and not opts then
		opts = desc
		desc = nil
	end
	opts = opts or {}

	-- remove extra opts
	local extra_opts = vim.tbl_extend('force', { langmap = true, fast = true }, opts)
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

	if extra_opts.langmap then lhs = translate(lhs) end

	return mode, lhs, rhs, opts
end

function M.map(mode, lhs, rhs, desc, opts)
	mode, lhs, rhs, opts = M.parse_map(mode, lhs, rhs, desc, opts)

	if type(lhs) == 'string' then lhs = { lhs } end
	for _, l in ipairs(lhs) do
		Try(1, vim.keymap.set, mode, l, rhs, opts)
	end
end

function M.unmap(mode, lhs, opts)
	-- remove extra opts
	local extra_opts = vim.tbl_extend('force', { langmap = true, fast = true }, opts)
	opts.langmap = nil
	opts.fast = nil
	opts.mode = nil

	if extra_opts.langmap and LangmapTranslator then --
		lhs = LangmapTranslator(lhs)
	end

	Try(1, vim.keymap.del, mode, lhs, opts)
end

--- usage:
--- 	`local pref_map = MapCreator('n', '<leader>a')`
--- 	`pref_map('a', ':echo "hello"', 'does stuff')`
---
--- then `<leader>aa` echoes `hello`
---@param mode string | string[] mode in which the keymap is mapped (n, v, i, etc.) if nil or empty string: 'nvo'
---@param lhs_prefix string | nil prefix for the keymap (<leader>f)
---@param desc_prefix string | nil prefix for the description ([LSP])
---@param outer_opts table | nil opts for vim.keymap.set ({ silent = true }) and extra opts for this function
--- fast: boolean whether to try (seems to be commented out right now)
--- langmap: boolean whether to remap a key to a different keyboard layout (only if langmap has been set)
--- mode: override the mode inside the returned function
function M.map_creator(mode, lhs_prefix, desc_prefix, outer_opts)
	-- TODO: accept lhs_prefix as table to have different prefixes

	if not mode or mode == '' then mode = 'nvo' end

	lhs_prefix = lhs_prefix or ''
	desc_prefix = desc_prefix and desc_prefix .. ' ' or ''

	outer_opts = outer_opts or { remap = false, silent = true, langmap = true, fast = true }

	return function(lhs, rhs, desc, opts)
		lhs = lhs_prefix .. lhs
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

--- Maps so that <Space>lhs is the same as <S-Space>lhs
--- where lhs should be come capitalized letter
M.map_space_capital = function(mode, lhs, rhs, desc, opts)
	local map = M.map_creator(mode)
	map('<Space>' .. lhs, rhs, desc, opts)
	map('<S-Space>' .. lhs, rhs, desc, opts)
end

return M
