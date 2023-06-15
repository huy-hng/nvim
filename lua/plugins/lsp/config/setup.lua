---------------------------------------------Diagnostics--------------------------------------------

local icons = require('config.ui.icons').diagnostics_sign
local signs = {
	{ name = 'DiagnosticSignError', text = icons.error },
	{ name = 'DiagnosticSignWarn',  text = icons.warning },
	{ name = 'DiagnosticSignInfo',  text = icons.info },
	{ name = 'DiagnosticSignHint',  text = icons.hint },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
end

vim.diagnostic.config {
	-- disable virtual text
	-- virtual_text = { severity = { min = vim.diagnostic.severity.ERROR } },
	virtual_text = false,
	signs = { severity = { min = vim.diagnostic.severity.HINT } },
	update_in_insert = false,
	underline = { severity = { min = vim.diagnostic.severity.WARN } },
	severity_sort = true,
	float = {
		focusable = true,
		style = 'minimal',
		border = 'rounded',
		source = 'always',
		header = '',
		prefix = '',
	},
}


-----------------------------------------------Null-ls----------------------------------------------
local null_ls = nrequire('null-ls')
if not null_ls then return end

local code_actions = null_ls.builtins.code_actions
-- local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
-- local hover = null_ls.builtins.hover
-- local completion = null_ls.builtins.completion

null_ls.setup({
	debug = true,
	sources = {
		code_actions.ts_node_action,
		formatting.autopep8.with({ extra_args = { '--ignore W191,E402' } }),
		formatting.stylua,
		formatting.yamlfmt,
		formatting.fixjson,
		formatting.prettier.with({ extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' } }),
		-- diagnostics.flake8
	},
})
