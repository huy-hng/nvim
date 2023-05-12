local has_config, configs = pcall(require, 'nvim-treesitter.configs')
if not has_config then return end

Map.n('<A-L>', { nvim.feedkeys, 'v<A-L>', true })

configs.setup {
	textsubjects = {
		enable = true,
		prev_selection = '<A-M>', -- (Optional) keymap to select the previous selection
		keymaps = {
			['<A-I>'] = 'textsubjects-smart',
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
