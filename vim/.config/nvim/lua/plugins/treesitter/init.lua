local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then return end

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
	auto_install = true,
}

-- local parsers = require('nvim-treesitter.parsers')
-- local ft_to_parser = parsers.filetype_to_parsername
-- ft_to_parser.someft = "python" -- the someft filetype will use the python parser and queries.
