if vim.fn.has('nvim-0.9.0') == 0 then return end

local M = {}
local utils = require('core.statuscolumn.utils')
require('core.statuscolumn.statuscolumn')

local column = Statuscolumn.build {
	Statuscolumn.sections.sign_column,
	Statuscolumn.sections.right_align,
	Statuscolumn.sections.line_number,
	-- Statuscolumn.sections.folds,
	Statuscolumn.sections.border,
	Statuscolumn.sections.spacing,
}

local function init()
	M.active = true
	M.custom_statuscolumn()
	-- Nmap("<c-'>", M.toggler)
	vim.keymap.set('n', "<c-'>", M.toggler)
end

local filetype_filter = { noice = true }
local buftype_filter = { diff = true }

Augroup('Statuscolumn', {
	Autocmd('CmdwinEnter', function() utils.default_statuscolumn() end),

	Autocmd('WinEnter', function()
		local winid = vim.api.nvim_get_current_win()
		local wintype = Util.win_type(winid)
		local buftype = vim.bo.buftype
		local filetype = vim.bo.filetype

		if wintype ~= '' or buftype_filter[buftype] or filetype_filter[filetype] then
			utils.remove_statuscolumn()
			-- vim.wo[winid].statuscolumn = ''
		else
			M.custom_statuscolumn()
		end
	end),
})

function M.custom_statuscolumn()
	utils.update_sign_defined()

	vim.o.number = true
	vim.o.signcolumn = 'no'
	vim.o.foldcolumn = '0'
	vim.o.statuscolumn = column
end

function M.toggler()
	if not M.active then
		M.custom_statuscolumn()

		M.active = true
		vim.notify('statuscolumn on')
		return
	end
	utils.default_statuscolumn()

	vim.notify('statuscolumn off')
	M.active = false
end

init()

return M
