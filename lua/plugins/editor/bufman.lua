local M = {
	'huy-hng/bufman.nvim',
	dev = true,
	dependencies = { 'nvim-lua/plenary.nvim' },
	event = 'VeryLazy',
}

function M.config()
	require('bufman').setup()
	local window = require('bufman.window')
	local map = Map.new('', '', '[Bufman]')
	-- nmap('<leader>b', window.toggle_menu, 'Toggle menu')
	-- nmap('<C-r>', window.toggle_menu, 'Toggle menu')
	map.n('<C-b>', window.toggle_menu, 'Toggle menu')
end

return M
