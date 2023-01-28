local M = {
	'booperlv/nvim-gomove',
	event = 'VeryLazy',
}

function M.config()
	require('gomove').setup {
		map_defaults = true, -- whether or not to map default key bindings, (true/false)
		reindent = true,
		undojoin = true, -- whether or not to undojoin same direction moves
		move_past_end_col = true, -- whether to not to move past end column when moving blocks horizontally
	}
end

return M
