local M = {}

local icons = require('config.ui.icons').statuscolumn
local utils = require('core.statuscolumn.utils')

-- TODO: different highlights for odd and even relative numbers
M.line_number = {
	function()
		if vim.v.virtnum ~= 0 then
			-- negative for virtual lines
			-- positive for wrapped lines
			return ''
		end

		local is_current_line = vim.v.relnum == 0
		if is_current_line then return vim.v.lnum end

		local lnum = vim.o.relativenumber and vim.v.relnum or vim.v.lnum
		local hl

		if utils.is_foldline(vim.v.lnum) and utils.is_collapsed(vim.v.lnum) then
			hl = 'FoldColumn'
		end

		if vim.o.relativenumber and vim.v.relnum % 10 == 0 then
			lnum = vim.v.lnum
			hl = 'CursorLineNr'
		end

		return utils.wrap_hl(lnum, hl)
	end,
	on_click = function(clicks, button, modifiers, mousepos)
		-- print('lnum')
	end,
}

local function get_git_sign() end

M.sign_column = {
	function()
		local lnum = vim.v.lnum
		local sign_text = ' '
		local sign_hl = ''

		local signs = utils.get_signs_in_line(nil, '*', lnum)
		signs = utils.remove_sign_group(signs, 'gitsigns_vimfn_signs_')

		if #signs > 0 then
			sign_text = signs[1].text
			sign_hl = signs[1].hl
		end

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
		local hl = 'NonText'
		local lnum = vim.v.lnum

		local sign = utils.get_gitsigns(nil, lnum)

		if sign and sign.group == 'gitsigns_vimfn_signs_' then --
			hl = sign.name
		end

		-- fold indicator
		if utils.is_collapsed(lnum) and utils.is_foldline(lnum) then
			-- use first found gitsign for hl
			local start_line, end_line = utils.get_fold_range(lnum)
			for i = start_line, end_line do
				sign = utils.get_gitsigns(nil, i)
				if sign then
					hl = sign.name
					break
				end
			end
			border = icons.fold_collapsed
		end

		return utils.wrap_hl(border, hl)
	end,

	on_click = function(clicks, button, modifiers, mousepos)
		local gitsigns = nrequire('gitsigns')
		if not gitsigns then return end
		local gitsigns_actions = {
			l = gitsigns.preview_hunk_inline,
			-- m = gitsigns.reset_hunk,
			-- r = gitsigns.stage,
			r = function() print('right') end,
		}
		local fn = gitsigns_actions[button]
		if fn then fn() end
	end,
}

local function set_focus(winid, linenr)
	vim.api.nvim_set_current_win(winid)
	if linenr then vim.api.nvim_win_set_cursor(0, { linenr, 0 }) end
end

M.fold = {
	function()
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

local function get_component_text(component_name)
	local component = M[component_name]

	local on_click_text = component.on_click and utils.create_on_click_text(component_name) or ''
	local display_text = utils.create_display_text(component_name)
	display_text = component.hl and utils.wrap_hl(display_text, component.hl) or display_text

	return on_click_text .. display_text
end

for name, component in pairs(M) do
	component.component_text = get_component_text(name)
	if component.on_click then
		local on_click_fn = component.on_click

		component.on_click = function(_, clicks, button, mods)
			local mousepos = vim.fn.getmousepos()
			vim.api.nvim_set_current_win(mousepos.winid)
			vim.api.nvim_win_set_cursor(0, { mousepos.line, 0 })

			on_click_fn(clicks, button, mods, mousepos)
		end
	end

	M[name] = setmetatable(component, {
		__call = component[1],
	})
end

return M
