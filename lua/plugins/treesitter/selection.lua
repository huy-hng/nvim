local configs = require('nvim-treesitter.configs')
local native = require('config.native_keymaps')

local key = Map.alt(native.L)
Map.n(key, { nvim.feedkeys, native.v .. key, true })

configs.setup {
	textsubjects = {
		enable = true,
		prev_selection = Map.alt(native.H), -- (Optional) keymap to select the previous selection
		keymaps = {
			[key] = 'textsubjects-smart',
			-- [':'] = 'textsubjects-container-outer',
			-- ['i;'] = 'textsubjects-container-inner',
		},
	},

	incremental_selection = {
		-- :help nvim-treesitter-incremental-selection-mod
		enable = false,
		keymaps = {
			-- init_selection = '<A-L>', -- in normal mode, start incremental selection.
			-- scope_incremental = '<A-B>', -- in visual mode, increment to the upper named parent.
			-- node_incremental = '<A-L>', -- in visual mode, increment to the upper scope
			-- node_decremental = '<A-H>', -- in visual mode, decrement to the previous named node.
		},
	},
}
