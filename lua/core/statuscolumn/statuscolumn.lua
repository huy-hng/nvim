local comp = require('core.statuscolumn.components')
local utils = require('core.statuscolumn.utils')

local M = {}

M.Statuscolumn = {
	components = comp,

	right_align = '%=',
	space = ' ',
	sign_column = comp.sign_column.component_text,
	line_number = comp.line_number.component_text,
	border = comp.border.component_text,
	folds = comp.fold.component_text,
}

function M.build(tbl)
	local statuscolumn = vim.tbl_map(function(value)
		if type(value) == 'string' then
			return value
		elseif type(value) == 'function' then
			return value()
		elseif type(value) == 'table' then
			return Statuscolumn.build(value)
		end
	end, tbl)
	return table.concat(statuscolumn)
end

local set_window = function(value)
	vim.defer_fn(function() --
		vim.api.nvim_win_set_option(vim.api.nvim_get_current_win(), 'statuscolumn', value)
	end, 1)
end

function M.set_statuscolumn(winid, display_text)
	local scope = winid and vim.wo[winid] or vim.o
	M.active = true
	utils.update_sign_defined()

	scope.number = true
	scope.signcolumn = 'no'
	scope.foldcolumn = '0'
	scope.statuscolumn = display_text
end

function M.remove_statuscolumn(winid)
	local scope = winid and vim.wo[winid] or vim.o
	scope.statuscolumn = ''
	scope.number = false
	scope.signcolumn = 'no'
	scope.foldcolumn = '0'
end

function M.default_statuscolumn(winid)
	local scope = winid and vim.wo[winid] or vim.o
	scope.foldcolumn = '1'
	scope.statuscolumn = ''
	scope.signcolumn = 'yes'
	scope.number = true
end

return M
