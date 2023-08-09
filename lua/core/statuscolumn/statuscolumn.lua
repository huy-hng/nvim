local comp = require('core.statuscolumn.components')
local utils = require('core.statuscolumn.utils')

local M = {}

_G.Statuscolumn = {
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

function M.set_options(opts, winid)
	local scope = get_scope(winid)
	for opt, value in pairs(opts) do
		scope[opt] = value
	end
end

function M.remove_column(winid)
	M.set_options({
		statuscolumn = '',
		number = false,
		signcolumn = 'no',
		foldcolumn = '0',
	}, winid)
end

function M.stock_column(winid)
	M.set_options({
		number = true,
		statuscolumn = '',
		signcolumn = 'yes',
		foldcolumn = '1',
	}, winid)
end

function M.set_column(winid, display_text)
	M.active = true
	utils.update_sign_defined()

	M.set_options({
		number = true,
		statuscolumn = display_text,
		signcolumn = 'no',
		foldcolumn = '0',
	}, winid)
end

M.columns = {
	default = M.build {
		Statuscolumn.sign_column,
		Statuscolumn.right_align,
		Statuscolumn.line_number,
		-- Statuscolumn.folds,
		Statuscolumn.border,
		Statuscolumn.space,
	},
	minimal = M.build {
		Statuscolumn.right_align,
		Statuscolumn.line_number,
		Statuscolumn.border,
		Statuscolumn.space,
	},

	sparse = M.build {
		Statuscolumn.right_align,
		Statuscolumn.sparse_line_number,
		Statuscolumn.border,
		Statuscolumn.space,
	},
}

return M
