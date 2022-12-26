local M = {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		'nvim-treesitter/playground',
		'nvim-treesitter/nvim-treesitter-context',
		'nvim-treesitter/nvim-treesitter-textobjects',
		'RRethy/nvim-treesitter-textsubjects',
		'p00f/nvim-ts-rainbow', -- highlight parentheses in different colors
		{ 'mfussenegger/nvim-treehopper', dependencies = 'phaazon/hop.nvim' },
	},
	build = function()
		local ts_update = require('nvim-treesitter.install').update { with_sync = false }
		ts_update()
	end,
}

function M.config()
	require('plugins.treesitter.completion')
	require('plugins.treesitter.context')
	require('plugins.treesitter.movement')
	require('plugins.treesitter.playground')
	require('plugins.treesitter.selection')
	require('plugins.treesitter.textobjects')
	require('plugins.treesitter.treehopper')
	require('plugins.treesitter.visual')

	local configs = require('nvim-treesitter.configs')

	configs.setup {
		-- A list of parser names, or "all"
		ensure_installed = {
			'python',
			'lua',
			'norg',
			'markdown',
			'bash',
			'help',
			'vim',
			'javascript',
			'typescript',
			'c',
			'rust',
			'json',
			'query',
		},

		sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
		ignore_install = { '' }, -- List of parsers to ignore installing

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = false,
	}

	-- local parsers = require('nvim-treesitter.parsers')
	-- local ft_to_parser = parsers.filetype_to_parsername
	-- ft_to_parser.someft = "python" -- the someft filetype will use the python parser and queries.
end
return M
