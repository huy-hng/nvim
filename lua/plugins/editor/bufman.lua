local M = {
	'huy-hng/bufman.nvim',
	dev = true,
	dependencies = { 'nvim-lua/plenary.nvim' },
	event = 'VeryLazy',
}

function M.config()
	local bufman = require('bufman')
	bufman.setup()
	local map = Map.new('', '', '[Bufman]')
	-- nmap('<leader>b', bufman.toggle_menu, 'Toggle menu')
	-- nmap('<C-r>', bufman.toggle_menu, 'Toggle menu')
	map.n('<C-b>', bufman.toggle_menu, 'Toggle menu')
end

return M
