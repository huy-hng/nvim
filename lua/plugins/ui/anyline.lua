local M = {
	'huy-hng/anyline.nvim',
	dev = true,
	-- dependencies = { 'nvim-treesitter/nvim-treesitter' },
	event = 'VeryLazy', -- 'BufReadPost'
}

function M.config()
	require('anyline').setup {
		-- animation = 'from_cursor',
		-- animation = 'top_down',
		lines_per_second = 100,
		trail_length = 15,
		fps = 30,
		ft_ignore = {
			'NvimTree',
			'TelescopePrompt',
			'alpha',
			'markdown',
		},
	}

	local column_line = require('anyline.column_line')

	nvim.command('ColumnLineDisable', column_line.stop)
	nvim.command('ColumnLineEnable', column_line.start)

	column_line.setup {
		-- wintype_whitelist = { '', 'popup' },
		filetype_blacklist = { 'dts', 'csv' },
		buftype_blacklist = {
			'buffer_manager',
			'harpoon',
			'TelescopePrompt',
		},
	}
end

return M
