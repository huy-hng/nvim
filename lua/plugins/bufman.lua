local M = {
	'huy-hng/bufman.nvim',
	dev = true,
	dependencies = { 'nvim-lua/plenary.nvim' },
	event = 'VeryLazy',
}

function M.config()
	local bufman = require('bufman')
	bufman.setup({
		bdelete_cmd = 'Bdelete',
	})
	local map = Map.new('', '', '[Bufman]')
	map.n('<C-b>', bufman.toggle_menu, 'Toggle menu')

	map.n(Keys.H, { bufman.change_buffer, -1 }, 'Prev Buffer')
	map.n(Keys.L, { bufman.change_buffer, 1 }, 'Next Buffer')
end

return M
