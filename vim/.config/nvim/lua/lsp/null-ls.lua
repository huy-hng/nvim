local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- local code_actions = null_ls.builtins.code_actions
-- local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
-- local hover = null_ls.builtins.hover
-- local completion = null_ls.builtins.completion


null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		-- formatting.lua_format.with({'-i', '--double-quote-to-single-quote'}),
		formatting.stylua.with({
			quote_style = 'ForceSingle',
			-- quote_style = 'AutoPreferSingle',
		}),
		-- diagnostics.flake8
	},
})
