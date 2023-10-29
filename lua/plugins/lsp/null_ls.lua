local M = {
	'jose-elias-alvarez/null-ls.nvim',
	event = 'VeryLazy',
}

function M.config()
	local null_ls = require('null-ls')

	local code_actions = null_ls.builtins.code_actions
	-- local diagnostics = null_ls.builtins.diagnostics
	local formatting = null_ls.builtins.formatting
	-- local hover = null_ls.builtins.hover
	local completion = null_ls.builtins.completion

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
			formatting.beautysh.with { extra_args = { '--tabs' } },
			formatting.fixjson,
			formatting.prettier.with {
				extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' },
			},
			formatting.clang_format,
			-- diagnostics.flake8
		},
	}
end

return M
