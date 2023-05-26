local M = {
	'rebelot/heirline.nvim',
	-- event = 'VeryLazy',
}

require('plugins.ui.heirline.buffer_manager').setup()
function M.config()
	if vim.g.started_by_firenvim == true then return end

	local window = require('plugins.ui.heirline.buffer_manager.window')
	local nmap = Map.create('n', '', '[Buffer Manager]')
	nmap('<leader>b', window.toggle_quick_menu, 'Toggle quick menu')

	local tabline = require('plugins.ui.heirline.tabline')
	vim.o.showtabline = 2

	require('heirline').setup {
		tabline = { tabline.BufferLine, tabline.TabPages },
		-- tabline = {},
		-- statusline = { ... },
		-- winbar = { ... },
		-- statuscolumn = { ... },
	}
end

return M
