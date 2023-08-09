local comp = require('core.statuscolumn.components')
local utils = require('core.statuscolumn.utils')

local M = {}

M.Statuscolumn = {
	components = comp,

	right_align = '%=',
	space = ' ',
	sign_column = comp.sign_column.component_text,
	line_number = comp.line_number.component_text,
	sparse_line_number = comp.sparse_line_number.component_text,
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

local function get_scope(winid)
	if winid and vim.api.nvim_win_is_valid(winid) then --
		return vim.wo[winid]
	end
	return vim.o
end

function M.set_statuscolumn(winid, display_text)
	local scope = get_scope(winid)
	M.active = true
	utils.update_sign_defined()

	scope.number = true
	scope.signcolumn = 'no'
	scope.foldcolumn = '0'
	scope.statuscolumn = display_text
end

function M.remove_statuscolumn(winid)
	local scope = get_scope(winid)

	scope.statuscolumn = ''
	scope.number = false
	scope.signcolumn = 'no'
	scope.foldcolumn = '0'
end

function M.default_statuscolumn(winid)
	local scope = get_scope(winid)
	scope.number = true
	scope.foldcolumn = '1'
	scope.statuscolumn = ''
	scope.signcolumn = 'yes'
end

return M
