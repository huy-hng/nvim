local M = {
	'nvim-treesitter/nvim-treesitter',
	event = 'VeryLazy',
	dependencies = {
		'nvim-treesitter/playground',
		'nvim-treesitter/nvim-treesitter-context',
		'nvim-treesitter/nvim-treesitter-textobjects',
		'RRethy/nvim-treesitter-textsubjects',
		'HiPhish/nvim-ts-rainbow2', -- highlight parentheses in different colors
	},
	build = function()
		local ts_update = require('nvim-treesitter.install').update { with_sync = false }
		ts_update()
	end,
}

function M.config()
	local config = {
		-- A list of parser names, or "all"
		ensure_installed = {
			'bash',
			'c',
			'javascript',
			'json',
			'lua',
			'markdown',
			'markdown_inline',
			'regex',
			'python',
			'query',
			'rust',
			'typescript',
			'vim',
		},

		sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
		ignore_install = { '' }, -- List of parsers to ignore installing

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = true,
	}

	--stylua: ignore
	config = vim.tbl_extend('force', config,
		require('plugins.treesitter.core.completion'),
		require('plugins.treesitter.core.context'),
		require('plugins.treesitter.core.movement'),
		require('plugins.treesitter.core.playground'),
		require('plugins.treesitter.core.selection'),
		require('plugins.treesitter.core.textobjects'),
		require('plugins.treesitter.core.visual')
	)

	require('nvim-treesitter.configs').setup(config)

	-- local parsers = require('nvim-treesitter.parsers')
	-- local ft_to_parser = parsers.filetype_to_parsername
	-- ft_to_parser.someft = "python" -- the someft filetype will use the python parser and queries.
end
return M
