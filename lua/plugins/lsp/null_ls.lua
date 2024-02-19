local M = {
	'nvimtools/none-ls.nvim',
	event = 'VeryLazy',
}

function M.config()
	local null_ls = require('null-ls')

	local code_actions = null_ls.builtins.code_actions
	local formatting = null_ls.builtins.formatting
	local completion = null_ls.builtins.completion
	-- local diagnostics = null_ls.builtins.diagnostics
	-- local hover = null_ls.builtins.hover

	null_ls.setup {
		-- debug = true,
		sources = {
			completion.luasnip,
			code_actions.ts_node_action,
			formatting.autopep8, -- changes tabs to spaces
			-- formatting.autopep8.with {
			-- 	extra_args = { '--ignore W191,E402', '--max-line-length 100', '--experimental' },
			-- },
			formatting.stylua,
			formatting.fixjson,
			-- formatting.xmlformat.with { extra_args = { '--selfclose', '--indent=1', '\t' } },
			formatting.beautysh.with { extra_args = { '--tabs' } },
			formatting.prettier.with {
				extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' },
			},
			formatting.clang_format,
			-- diagnostics.flake8
		},
	}
end

return M
