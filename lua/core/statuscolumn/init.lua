if vim.fn.has('nvim-0.9.0') == 0 then return end

local M = {}
local utils = require('core.statuscolumn.utils')
local statuscolumn = require('core.statuscolumn.statuscolumn')

_G.Statuscolumn = statuscolumn.Statuscolumn

local column = statuscolumn.build {
	Statuscolumn.sign_column,
	Statuscolumn.right_align,
	Statuscolumn.line_number,
	-- Statuscolumn.folds,
	Statuscolumn.border,
	Statuscolumn.space,
}

function M.custom_statuscolumn(winid) statuscolumn.set_statuscolumn(winid, column) end

function M.toggler()
	if M.active then
		statuscolumn.default_statuscolumn()

		vim.notify('statuscolumn off')
		M.active = false
		return
	end
	M.custom_statuscolumn()

	M.active = true
	vim.notify('statuscolumn on')
end

local filetype_filter = { alpha = true, noice = true }
local buftype_filter = { diff = true }
vim.o.statuscolumn =
	[[%#NonText#%{&nu?v:lnum:""}%=%{&rnu&&(v:lnum%2)?"\ ".v:relnum:""}%#LineNr#%{&rnu&&!(v:lnum%2)?"\ ".v:relnum:""}]]

Augroup('Statuscolumn', {
	Autocmd('CmdwinEnter', function() statuscolumn.default_statuscolumn() end),

	Autocmd('WinEnter', function()
		local winid = vim.api.nvim_get_current_win()
		local wintype = Util.win_type(winid)
		local buftype = vim.bo.buftype
		local filetype = vim.bo.filetype

		if wintype ~= '' or buftype_filter[buftype] or filetype_filter[filetype] then
			statuscolumn.remove_statuscolumn(winid)
		else
			M.custom_statuscolumn(winid)
		end
	end),
})

vim.keymap.set('n', "<c-'>", M.toggler)

return M
