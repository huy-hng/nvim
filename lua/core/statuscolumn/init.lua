local winman = require('modules.window_manager')
if vim.fn.has('nvim-0.9.0') == 0 then return end

local M = {}
local statuscolumn = require('core.statuscolumn.statuscolumn')

M.set_column = statuscolumn.set_column
M.remove_column = statuscolumn.remove_column
M.columns = statuscolumn.columns

function M.set_default_column(winid) statuscolumn.set_column(winid, M.columns.default) end
function M.set_minimal_column(winid) statuscolumn.set_column(winid, M.columns.minimal) end

local filetype_blacklist = {
	alpha = true,
	noice = true,
	toggleterm = true,
	NvimTree = true,
	DiffviewFiles = true,
}
local filetype_ignore = { bufman = true }
local buftype_blacklist = { diff = true }
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

	Autocmd('SessionLoadPost', function()
		local wins = winman.list_wins()
		for _, win in ipairs(wins) do
			M.set_default_column(win)
		end
	end),

	Autocmd({ 'WinEnter', 'WinNew', 'TabEnter', 'VimEnter' }, function()
		vim.schedule(function()
			local winid = vim.api.nvim_get_current_win()
			if vim.w[winid].statuscolumn_ignore then return end

			local wintype = Util.win_type(winid)
			local buftype = vim.bo.buftype
			local filetype = vim.bo.filetype

			-- print(winid, wintype, buftype, filetype, filetype_ignore[filetype])
			if win_ignore[wintype] or filetype_ignore[filetype] then return end
			if
				not win_whitelist[wintype]
				or buftype_blacklist[buftype]
				or filetype_blacklist[filetype]
				-- or vim.api.nvim_buf_line_count(0) <= 1
			then
				statuscolumn.remove_column(winid)
				return
			end

			M.set_default_column(winid)
		end)
	end),
})

nvim.command('StatuscolumnStock', function(_) statuscolumn.stock_column() end)
nvim.command('StatuscolumnDefault', function(_) M.set_default_column() end)

return M
