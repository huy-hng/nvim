-- local key = Map.alt(Keys.L)
local key = Keys.alt.L
Map.n(key, { nvim.feedkeys, Keys.v .. key, true })

return {
	textsubjects = {
		enable = false,
		prev_selection = Keys.alt.H, -- (Optional) keymap to select the previous selection
		keymaps = {
			[key] = 'textsubjects-smart',
			-- [':'] = 'textsubjects-container-outer',
			-- ['i;'] = 'textsubjects-container-inner',
		},
	},

	incremental_selection = {
		-- :help nvim-treesitter-incremental-selection-mod
		enable = true,
		keymaps = {
			init_selection = Keys.alt.L, -- in normal mode, start incremental selection.
			-- scope_incremental = Keys.alt.L, -- in visual mode, increment to the upper named parent.
			scope_incremental = '|#+$-*', -- in visual mode, increment to the upper named parent.
			-- scope_incremental = '<A-B>', -- in visual mode, increment to the upper named parent.
			node_incremental = Keys.alt.L, -- in visual mode, increment to the upper scope
			node_decremental = Keys.alt.H, -- in visual mode, decrement to the previous named node.
		},
	},
}
