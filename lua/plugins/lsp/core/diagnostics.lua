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
