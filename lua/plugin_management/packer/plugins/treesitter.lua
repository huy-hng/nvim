return function(use)
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update { with_sync = true }
			ts_update()
		end,
	}
	use { 'nvim-treesitter/playground' }
	use { 'nvim-treesitter/nvim-treesitter-context' }
	use { 'nvim-treesitter/nvim-treesitter-textobjects' }
	use { 'RRethy/nvim-treesitter-textsubjects' }
	use { 'p00f/nvim-ts-rainbow' } -- highlight parentheses in different colors
	use { 'mfussenegger/nvim-treehopper', requires = 'phaazon/hop.nvim' }
end
