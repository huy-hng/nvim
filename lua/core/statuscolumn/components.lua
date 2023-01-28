local M = {}

local icons = require('config.ui.icons').statuscolumn
local utils = require('core.statuscolumn.utils')

function M.lnumfunc()
	if vim.v.wrap then return '' end

	local is_current_line = vim.v.relnum == 0
	if is_current_line then return vim.v.lnum end

	local lnum = vim.o.relativenumber and vim.v.relnum or vim.v.lnum

	if utils.is_foldline(vim.v.lnum) and utils.is_collapsed(vim.v.lnum) then
		lnum = utils.wrap_hl(lnum, 'FoldColumn')
	end

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

function M.fold()
	if vim.v.wrap then return '' end

	local lnum = vim.v.lnum
	if not utils.is_foldline(lnum) then return icons.fold_empty end
	return utils.is_collapsed(lnum) and icons.fold_collapsed or icons.fold_expanded
end

return M
