local M = {}

require('core.statuscolumn.statuscolumn')
local utils = require('core.statuscolumn.utils')

local column = Statuscolumn.build {
	Statuscolumn.sections.sign_column,
	Statuscolumn.sections.right_align,
	Statuscolumn.sections.line_number,
	Statuscolumn.sections.border,
	-- Statuscolumn.sections.folds,
	Statuscolumn.sections.spacing,
}

function M.remove_statuscolumn()
	vim.o.number = false
	vim.o.signcolumn = 'no'
	vim.o.foldcolumn = '0'
end

function M.default_statuscolumn()
	vim.o.foldcolumn = '1'
	vim.o.statuscolumn = ''
	vim.o.signcolumn = 'yes'
	vim.o.number = true
end

function M.custom_statuscolumn()
	-- utils.update_signs()
	utils.update_sign_defined()

	vim.o.number = true
	vim.o.signcolumn = 'no'
	vim.o.foldcolumn = '0'
	vim.o.statuscolumn = column
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

Augroup('Statuscolumn', {
	Autocmd('CmdwinEnter', function() M.default_statuscolumn() end),

	Autocmd('WinEnter', function()
		local winid = vim.api.nvim_get_current_win()
		local type = Util.win_type(winid)
		if type ~= '' then vim.wo[winid].statuscolumn = '' end
	end),
})

Nmap("<c-'>", M.toggler)

return M
