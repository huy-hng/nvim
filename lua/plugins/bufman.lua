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

	map.n(Keys.H, { bufman.switch_buf, -1 }, 'Prev Buffer')
	map.n(Keys.L, { bufman.switch_buf, 1 }, 'Next Buffer')
end

return M
