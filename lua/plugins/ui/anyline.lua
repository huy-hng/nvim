local M = {
	'huy-hng/anyline.nvim',
	dev = true,
	dependencies = { 'nvim-treesitter/nvim-treesitter' },
	event = 'VeryLazy',
}

function M.config()
	require('anyline').setup {
		-- highlight = 'Error',
		-- animation = 'from_cursor',
		-- animation = 'top_down',
		lines_per_second = 100,
		trail_length = 15,
		fps = 60,
	}
	require('anyline.column_line').setup()
end

return M
