local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
	return
end

configs.setup({
	textsubjects = {
		enable = true,
		prev_selection = ',', -- (Optional) keymap to select the previous selection
		keymaps = {
			['.'] = 'textsubjects-smart',
			[';'] = 'textsubjects-container-outer',
			['i;'] = 'textsubjects-container-inner',
		},
	},

	incremental_selection = {
		-- :help nvim-treesitter-incremental-selection-mod
		enable = true,
		keymaps = {
			init_selection = '<A-L>', -- in normal mode, start incremental selection.
			scope_incremental = '<A-B>', -- in visual mode, increment to the upper named parent.
			node_incremental = '<A-L>', -- in visual mode, increment to the upper scope
			node_decremental = '<A-H>', -- in visual mode, decrement to the previous named node.
		},
	},


})
