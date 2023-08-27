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
		fps = 30,
	}
	-- require('anyline.column_line').setup()
	-- require('anyline.column_line').setup { buftype_whitelist = { 'dts' } }
	require('anyline.column_line').setup {
		buftype_blacklist = { 'dts' },
		-- wintype_whitelist = { '', 'popup' },
		filetype_blacklist = {
			'buffer_manager',
			'harpoon',
			'TelescopePrompt',
		},
	}
end

return M
