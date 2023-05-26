local M = {}

local icons = require('config.ui.icons').statuscolumn
local utils = require('core.statuscolumn.utils')

function M.lnumfunc()
	if vim.v.wrap then --
		return vim.fn['repeat'](' ', #vim.v.lnum)
	end

	local is_current_line = vim.v.relnum == 0
	if is_current_line then return vim.v.lnum end

	-- local lnum = vim.o.relativenumber and vim.v.relnum or vim.v.lnum
	local lnum = vim.v.lnum

	if vim.o.relativenumber then
		lnum = vim.v.relnum
		if vim.v.relnum % 10 == 0 then
			lnum = vim.v.lnum
			lnum = utils.wrap_hl(lnum, 'CursorLineNr')
		end
	end

	if utils.is_foldline(vim.v.lnum) and utils.is_collapsed(vim.v.lnum) then
		lnum = utils.wrap_hl(lnum, 'FoldColumn')
	end

	return lnum
end

function M.signs()
	local lnum = vim.v.lnum
	local sign_text
	local sign_hl

	local signs = utils.get_sign(nil, '*', lnum)
	if not signs or #signs == 0 then goto skip end

	-- get sign if available
	for _, sign in ipairs(signs) do
		if sign.group ~= 'gitsigns_vimfn_signs_' then
			local defined = utils.defined_signs[sign.name]
			if not defined then break end

			sign_text = defined.text
			sign_hl = defined.texthl
			break
		end
	end

	::skip::

	-- sign_text = (sign_text or ' ') .. ' '
	sign_text = sign_text or ' '
	sign_hl = sign_hl or ''

	-- if lnum < 99 then sign_text = sign_text .. ' ' end

	return utils.wrap_hl(sign_text, sign_hl)
end

nvim.hl(0, 'GitSignsDeleteDelete', { link = 'GitSignsDelete' })
nvim.hl(0, 'GitSignsAddAdd', { link = 'GitSignsAdd' })
nvim.hl(0, 'GitSignsChangeChange', { link = 'GitSignsChange' })
nvim.hl(0, 'GitSignsStagedStaged', { link = 'GitSignsStaged' })
nvim.hl(0, 'GitSignsUntrackedUntracked', { link = 'GitSignsUntracked' })
-- nvim.hl(0, 'GitSigns', { link = 'GitSigns' })

function M.gitsign_border()
	local border = icons.border
	local hl = 'Comment'
	local lnum = vim.v.lnum

	-- if vim.v.wrap then return border end

	local sign = utils.get_gitsigns(nil, lnum)

	-- fold indicator when no sign
	if utils.is_foldline(lnum) and utils.is_collapsed(lnum) then
		border = icons.thick_border
		hl = 'FoldColumn'
	end

	if sign and sign.group == 'gitsigns_vimfn_signs_' then --
		hl = sign.name
	end

	return utils.wrap_hl(border, hl)
end

function M.fold()
	if vim.v.wrap then return ' ' end

	local lnum = vim.v.lnum
	if not utils.is_foldline(lnum) then return icons.fold_empty end
	return utils.is_collapsed(lnum) and icons.fold_collapsed or icons.fold_expanded
end

return M
