local M = {
	'rebelot/heirline.nvim',
	event = 'VeryLazy',
}

require('plugins.ui.heirline.buffer_manager').setup()
function M.config()
	if vim.g.started_by_firenvim == true then return end

	local window = require('plugins.ui.heirline.buffer_manager.window')
	local nmap = Map.create('n', '', '[Buffer Manager]')
	nmap('<leader>b', window.toggle_quick_menu, 'Toggle quick menu')
	nmap('<C-b>', window.toggle_quick_menu, 'Toggle quick menu')

	local tabline = R('plugins.ui.heirline.tabline')
	local bufferline = R('plugins.ui.heirline.bufferline')
	vim.o.showtabline = 2

	local function setup()
		local spacing = { provider = ' ' }
		require('heirline').setup {
			tabline = { spacing, bufferline, tabline, spacing },
			-- winbar = require('plugins.ui.heirline.winbar'),
			-- statusline = { ... },
			-- statuscolumn = { ... },
		}
	end

	setup()
	local filename = require('plugins.ui.heirline.buffer_manager.filename')

	Augroup('Heirline', {
		Autocmd('ColorScheme', setup),
		Autocmd(
			{
				'WinNew',
				'WinClosed',
				'BufEnter',
				'TabEnter',
				'TabNew',
				'TabClosed',
				'TabLeave',
			},
			'*',
			function()
				local tab = vim.api.nvim_get_current_tabpage()

				local bufname = vim.api.nvim_buf_get_name(0)
				local icon = filename.get_icon(bufname, { hexcode = true, default = false })
				icon = icon or {}

				bufname = bufname or vim.bo.filetype

				vim.t[tab].tablabel = {
					filename = filename.get_filename(bufname, true),
					icon = icon[1],
					icon_hl = icon[2],
				}
			end
		),
	})
end

return M
