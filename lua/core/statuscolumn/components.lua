local M = {}

local icons = R('config.ui.icons').statuscolumn
local utils = require('core.statuscolumn.utils')

function M.lnumfunc()
	if vim.v.wrap then return '' end
	local lnum = vim.v.lnum

	local cur_lnum = vim.fn.getcurpos(0)[2]
	if cur_lnum == lnum then return lnum end

	local expanded = M.fold_expanded(lnum)
	if expanded ~= nil and not expanded then lnum = utils.wrap_hl(lnum, 'FoldColumn') end

	return lnum
end

function M.signs()
	local lnum = vim.v.lnum

	local signs = utils.get_sign(nil, '*', lnum)
	if not signs or #signs == 0 then return ' ' end

	local sign
	for _, s in ipairs(signs) do
		if s.group ~= 'gitsigns_vimfn_signs_' then
			sign = s
			break
		end
	end
	if not sign then return ' ' end

	local defined = utils.defined_signs[sign.name]
	if not defined then return ' ' end

	return utils.wrap_hl(defined.text, defined.texthl)
end

function M.gitsign_border()
	local border = icons.border
	local lnum = vim.v.lnum

	local sign = utils.get_gitsigns(nil, lnum)

	local hl = 'Comment'
	if sign and sign.group == 'gitsigns_vimfn_signs_' then --
		hl = sign.name
	end

	return utils.wrap_hl(border, hl)
end

function M.in_folding_range(lnum) return vim.fn.foldlevel(lnum) > 0 end
function M.is_expanded(lnum) return vim.fn.foldclosed(lnum) == -1 end
function M.is_first_line_of_folding_range(lnum)
	return vim.fn.foldlevel(lnum) > vim.fn.foldlevel(lnum - 1)
end

---@return boolean | nil a returns nil if not in region
---otherwise returns true if fold region is expanded and false if collapsed
function M.fold_expanded(lnum)
	lnum = lnum or vim.v.lnum
	if not M.in_folding_range(lnum) or not M.is_first_line_of_folding_range(lnum) then --
		return
	end
	return M.is_expanded(lnum) and true or false
end

function M.fold()
	if vim.v.wrap then return '' end

	local lnum = vim.v.lnum
	local expanded = M.fold_expanded(lnum)
	if expanded == nil then return icons.fold_empty end

	return expanded and icons.fold_expanded or icons.fold_collapsed
end

return M
