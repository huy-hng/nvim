local M = {}

local icons = require('config.ui.icons').statuscolumn
local utils = require('core.statuscolumn.utils')

local function lnum()
	if vim.v.virtnum > 0 then return vim.v.virtnum end
	local diff = vim.fn.diff_filler(vim.v.lnum)
	if diff > 0 then
		print(vim.v.lnum, diff)
		-- return vim.fn['repeat'](' ', #vim.v.lnum)
		return ''
	end
end
-- TODO: different highlights for odd and even relative numbers
M.line_number = {
	function()
		if vim.v.wrap then --
			return vim.fn['repeat'](' ', #vim.v.lnum)
		end

		local is_current_line = vim.v.relnum == 0
		if is_current_line then return vim.v.lnum end

		local lnum = vim.o.relativenumber and vim.v.relnum or vim.v.lnum
		local hl

		if vim.o.relativenumber and vim.v.relnum % 10 == 0 then
			lnum = vim.v.lnum
			hl = 'CursorLineNr'
		end

		if utils.is_foldline(vim.v.lnum) and utils.is_collapsed(vim.v.lnum) then
			hl = 'FoldColumn'
		end

		return utils.wrap_hl(lnum, hl)
	end,
	on_click = function(clicks, button, modifiers, mousepos)
		-- local args = get_click_args(...)
		print('lnum')
		-- P(clicks, button, modifiers, mousepos)
	end,
}

M.sign_column = {
	function()
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
	end,

	on_click = function(clicks, button, modifiers, mousepos)
		local row = mousepos.screenrow
		local col = mousepos.screencol

		local sign = vim.fn.screenstring(row, col)

		-- If clicked on empty space in the sign column, try one cell to the left
		if sign == ' ' then sign = vim.fn.screenstring(row, col - 1) end

		if not utils.defined_signs[sign] then utils.update_sign_defined() end
		for name, text in pairs(utils.defined_signs) do
			-- if text == sign and cfg[name] then
			-- 	S(function() cfg[name](args) end)
			-- 	break
			-- end
		end
	end,
}

M.border = {
	function()
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
	end,
}

local function set_focus(winid, linenr)
	vim.api.nvim_set_current_win(winid)
	if linenr then vim.api.nvim_win_set_cursor(0, { linenr, 0 }) end
end

M.fold = {
	function()
		if vim.v.wrap then return ' ' end

		local lnum = vim.v.lnum
		local fold_icon = ''

		if utils.is_collapsed(lnum) then
			fold_icon = icons.fold_collapsed
		else
			fold_icon = icons.fold_expanded
		end

		if not utils.is_foldline(lnum) then --
			fold_icon = icons.fold_empty
		end

		-- return fold_icon .. '%T'
		return fold_icon
	end,
	-- folds = { on_click_text('fold'), utils.wrap_hl(display_text('fold'), 'FoldColumn'), '%T' },

	on_click = function(clicks, button, modifiers, mousepos)
		set_focus(mousepos.winid, mousepos.line)
		set_focus(mousepos.winid)

		local lnum = vim.fn.getmousepos().line

		if not utils.is_foldline(lnum) then return end

		local action = utils.is_collapsed(lnum) and 'foldopen' or 'foldclose'
		nvim.exec(lnum .. action)
	end,

	hl = 'FoldColumn',
}

local function wrap_text(prefix, text, suffix)
	return prefix .. 'v:lua.Statuscolumn.components.' .. text .. suffix
end
local function create_display_text(text) return wrap_text('%{%', text, '()%}') end
local function create_on_click_text(text) return wrap_text('%@', text, '.on_click@') end

local function get_component_text(component_name)
	local component = M[component_name]

	local on_click_text = component.on_click and create_on_click_text(component_name) or ''
	local display_text = create_display_text(component_name)
	display_text = component.hl and utils.wrap_hl(display_text, component.hl) or display_text

	return on_click_text .. display_text
end

for name, component in pairs(M) do
	component.component_text = get_component_text(name)
	if component.on_click then
		local on_click_fn = component.on_click

		component.on_click = function(_, clicks, button, mods)
			on_click_fn(clicks, button, mods, vim.fn.getmousepos())
		end
	end

	M[name] = setmetatable(component, {
		__call = component[1],
	})
end

return M
