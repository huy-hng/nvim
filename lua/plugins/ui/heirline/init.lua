local M = {
	'rebelot/heirline.nvim',
	event = 'VeryLazy',
}

require('plugins.ui.heirline.buffer_manager').setup()
function M.config()

	local ui = require('plugins.ui.heirline.buffer_manager.ui')
	local nmap = MapCreator('n', '', '[Buffer Manager]')
	nmap('<C-b>', ui.toggle_quick_menu, 'Toggle quick menu')


	local tabline = R('plugins.ui.heirline.tabline')
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
