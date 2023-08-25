---------------------------------------------Diagnostics--------------------------------------------

local icons = require('config.ui.icons').diagnostics_sign
local signs = {
	{ name = 'DiagnosticSignError', text = icons.error },
	{ name = 'DiagnosticSignWarn', text = icons.warning },
	{ name = 'DiagnosticSignInfo', text = icons.info },
	{ name = 'DiagnosticSignHint', text = icons.hint },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
end

vim.diagnostic.config {
	virtual_text = false,
	signs = { severity = { min = vim.diagnostic.severity.HINT } },
	update_in_insert = false,
	underline = { severity = { min = vim.diagnostic.severity.WARN } },
	severity_sort = true,
	float = {
		max_height = 20,
		max_width = 120,

		severity_sort = true,
		pad_bottom = 1,
		-- pad_top = 1, -- creates weird bug with highlighting
		focusable = true,
		style = 'minimal',
		border = 'none',
		source = 'if_many',
		header = ' ',

		-- header = '  Diagnostics',
		prefix = function(diagnostic, i, total)
			local prefix = '  '
			if total > 1 then prefix = prefix .. i .. ': ' end
			return prefix
		end,
		suffix = '  ',
		relative = 'editor',
		position = { row = -2, col = '55%' },
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

null_ls.setup {
	-- debug = true,
	sources = {
		code_actions.ts_node_action,
		-- formatting.autopep8,
		formatting.autopep8.with {
			extra_args = { '--ignore W191,E402', '--max-line-length 100', '--experimental' },
		},
		formatting.stylua,
		formatting.beautysh.with { extra_args = { '--tabs' } },
		formatting.fixjson,
		formatting.prettier.with {
			extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' },
		},
		formatting.clang_format,
		-- diagnostics.clang_check
		-- diagnostics.flake8
	},
}
