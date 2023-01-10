local map = require('metamap.mapper')

local modes = {}

--- usage:
--- 	`local pref_map = PrefixMap(nmap, '<leader>a')`
--- 	`pref_map('a', ':echo "hello"', 'does stuff')`
---
--- then `<leader>aa` echoes `hello`
---@param mode mode
---@param lhs_prefix string | nil prefix for the keymap (<leader>f)
---@param desc_prefix string | nil prefix for the description ([LSP])
---@param outer_opts table | nil opts for vim.keymap.set ({ silent = true })
---@param fn_opts table | nil opts for this function ({ fast = true })
function MapCreator(mode, lhs_prefix, desc_prefix, outer_opts, fn_opts)
	modes[mode] = modes[mode] or {}

	lhs_prefix = lhs_prefix or ''
	desc_prefix = desc_prefix and desc_prefix .. ' ' or ''
	outer_opts = outer_opts or { remap = false, silent = true }
	fn_opts = fn_opts or {}

	---@param lhs lhs
	---@param rhs rhs
	---@param desc desc
	---@param opts opts
	return function(lhs, rhs, desc, opts)
		modes[mode][lhs] = desc

		desc = desc_prefix .. (desc or '')
		opts = vim.tbl_extend('force', outer_opts or {}, { desc = desc }, opts or {})
		map(mode, lhs, rhs, desc, opts)
	end
end

return MapCreator
