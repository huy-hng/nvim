if not vim.fn.has('nvim-0.9.0') == 1 then return end

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
	Nmap("<c-'>", M.toggler)
end

Augroup('Statuscolumn', {
	Autocmd('CmdwinEnter', function() utils.default_statuscolumn() end),

	Autocmd('WinEnter', function(data)
		local winid = vim.api.nvim_get_current_win()
		local type = Util.win_type(winid)
		local buftype = vim.bo.buftype
		-- TODO:
		local buftypes = { 'diff' }

		if type ~= '' or buftype == 'diff' then vim.wo[winid].statuscolumn = '' end
	end),

	Autocmd('User', 'AlphaReady', function(data)
		vim.wo.statuscolumn = ''
		NestedAutocmd(data, 'BufUnload', nil, function() --
			M.custom_statuscolumn()
		end, { buffer = 0 })
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
	end
	utils.default_statuscolumn()

	vim.notify('statuscolumn off')
	M.active = false
	return
end

init()

return M
