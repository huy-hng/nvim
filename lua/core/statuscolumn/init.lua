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

local minimal_column = statuscolumn.build {
	Statuscolumn.right_align,
	Statuscolumn.line_number,
	Statuscolumn.border,
	Statuscolumn.space,
}

function M.custom_statuscolumn(winid) statuscolumn.set_statuscolumn(winid, column) end
function M.minimal_statuscolumn(winid) statuscolumn.set_statuscolumn(winid, column) end

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

local filetype_blacklist = { alpha = true, noice = true, toggleterm = true }
local buf_blacklist = { diff = true }
local win_whitelist = { [''] = true }
local win_ignore = { command = true }
-- vim.o.statuscolumn =
-- 	[[%#NonText#%{&nu?v:lnum:""}%=%{&rnu&&(v:lnum%2)?"\ ".v:relnum:""}%#LineNr#%{&rnu&&!(v:lnum%2)?"\ ".v:relnum:""}]]

Augroup('Statuscolumn', {
	Autocmd('CmdwinEnter', function()
		vim.schedule(function()
			Map.n('<C-m>', '<CR>', '', { buffer = true })
			vim.wo.statuscolumn = ''
		end)
	end),

	Autocmd({ 'WinEnter', 'WinNew' }, function(data)
		vim.schedule(function()
		local winid = vim.api.nvim_get_current_win()
		local wintype = Util.win_type(winid)
		local buftype = vim.bo.buftype
		local filetype = vim.bo.filetype

		if win_ignore[wintype] then return end
			local line_count = vim.api.nvim_buf_line_count(0)
			if
				not win_whitelist[wintype]
				or buf_blacklist[buftype]
				or filetype_blacklist[filetype]
				or line_count <= 1
			then
				statuscolumn.remove_statuscolumn(winid)
			else
				M.custom_statuscolumn(winid)
			end
		end)
	end),
})

vim.keymap.set('n', "<c-'>", M.toggler)

return M
