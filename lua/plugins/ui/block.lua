local M = {
	'HampusHauffman/block.nvim',
	event = 'VeryLazy',
}

function M.config()
	require('block').setup {
		-- The change in color. 0.8 would change each box to be 20% darker than the last and 1.2 would be 20% brighter.
		percent = 0.8,
		-- depths of changing colors. Defaults to 4. After this the colors reset. Note that the first color is taken from your "Normal" highlight so a 4 is 3 new colors.
		depth = 4,
		-- A list of colors to use instead. If this is set percent and depth are not taken into account.
		colors = nil,
		-- Automatically turns this on when treesitter finds a parser for the current file.
		automatic = false,
	}
end

return M
