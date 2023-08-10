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

	Augroup('Heirline', {
		Autocmd('ColorScheme', setup),
	})
end

return M
