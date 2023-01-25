local M = {}

local utils = require('core.statuscolumn.utils')
local comp = require('core.statuscolumn.components')

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

_G.Statuscolumn = {
	click_handler = {
		fold = function()
			local lnum = vim.fn.getmousepos().line

			-- Only lines with a mark should be clickable
			if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then return end

			local state
			if vim.fn.foldclosed(lnum) == -1 then
				state = 'close'
			else
				state = 'open'
			end

			vim.cmd.execute("'" .. lnum .. 'fold' .. state .. "'")
		end,
	},

	display = {
		lnum = comp.lnumfunc,
		fold = comp.fold,
		border = comp.gitsign_border,
		signs = comp.signs,
	},

	sections = {
		right_align = { '%=' },
		spacing = ' ',

		sign_column = display('signs'),
		line_number = display('lnum'),
		border = display('border'),

		folds = utils.wrap_hl({ on_click('fold'), display('fold') }, 'FoldColumn'),
	},

	build = function(tbl)
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
	end,

	set_window = function(value)
		vim.defer_fn(function() --
			vim.api.nvim_win_set_option(vim.api.nvim_get_current_win(), 'statuscolumn', value)
		end, 1)
	end,
}

local column = Statuscolumn.build {
	Statuscolumn.sections.sign_column,
	Statuscolumn.sections.right_align,
	Statuscolumn.sections.line_number,
	Statuscolumn.sections.border,
	Statuscolumn.sections.spacing,
}

function M.remove_statuscolumn()
	vim.wo.number = false
	vim.wo.signcolumn = 'no'
	vim.wo.foldcolumn = '0'
end

function M.default_statuscolumn()
	vim.wo.foldcolumn = '1'
	vim.wo.statuscolumn = ''
	vim.wo.signcolumn = 'yes'
	vim.wo.number = true
end

function M.custom_statuscolumn()
	utils.update_signs()

	M.remove_statuscolumn()
	Statuscolumn.set_window(column)
end

M.custom_statuscolumn()

M.active = true
function M.toggler()
	if M.active then
		M.default_statuscolumn()

		vim.notify('statuscolumn off')
		M.active = false
		return
	end
	M.custom_statuscolumn()

	M.active = true
	vim.notify('statuscolumn on')
end

Nmap("<c-'>", M.toggler)

return M
