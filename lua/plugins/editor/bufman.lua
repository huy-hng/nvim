local M = {
	'huy-hng/bufman.nvim',
	dev = true,
	dependencies = { 'nvim-lua/plenary.nvim' },
	event = 'VeryLazy',
}

function M.config()
	require('bufman').setup()
	local window = require('bufman.window')
	local nmap = Map.create('n', '', '[Bufman]')
	nmap('<leader>b', window.toggle_menu, 'Toggle menu')
	nmap('<C-r>', window.toggle_menu, 'Toggle menu')
	nmap('<C-g>', window.toggle_menu, 'Toggle menu')
end

return M
