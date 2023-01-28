asd = 'a'

local click = require('core.statuscolumn.click_handlers')
local comp = require('core.statuscolumn.components')
local utils = require('core.statuscolumn.utils')

local function display(text)
	local prefix = '%{%v:lua.Statuscolumn.display.'
	local suffix = '()%}'
	return prefix .. text .. suffix
end

local function on_click(text)
	local prefix = '%@v:lua.Statuscolumn.click_handler.'
	local suffix = '@'
	return prefix .. text .. suffix
end

-- local fold = {
-- 	comp.fold,
-- 	on_click = function(args) click.fold() end,
-- }

-- local text = debug.getinfo(3)
-- P(text.func())

-- TODO: refactor display and on click functions into one table, similar to how lualine does it

_G.Statuscolumn = nil
_G.Statuscolumn = {
	click_handler = {
		fold = click.fold,
		sign = click.get_sign_action,
	},

	display = {
		lnum = comp.lnumfunc,
		fold = comp.fold,
		border = comp.gitsign_border,
		signs = comp.signs,
	},

	sections = {
		right_align = '%=',
		spacing = ' ',

		sign_column = { on_click('sign'), display('signs') },
		line_number = display('lnum'),
		border = display('border'),

		folds = { on_click('fold'), utils.wrap_hl(display('fold'), 'FoldColumn'), '%T' },
	},

	build = function(tbl)
		local statuscolumn = vim.tbl_map(function(value)
			if type(value) == 'string' then
				return value
			elseif type(value) == 'function' then
				return value()
			elseif type(value) == 'table' then
				-- local text = value[1]
				-- local on_click = value.on_click
				-- TODO:
				-- on_click = on_click and on_click()
				-- return on_click('fold') .. utils.wrap_hl(display('fold'), 'FoldColumn') .. '%T'
				return Statuscolumn.build(value)
			end
		end, tbl)
		return table.concat(statuscolumn)
	end,

	set_window = function(value)
		vim.defer_fn(function() --
			vim.api.nvim_win_set_option(vim.api.nvim_get_current_win(), 'statuscolumn', value)
		end, 1)
	end,
}
