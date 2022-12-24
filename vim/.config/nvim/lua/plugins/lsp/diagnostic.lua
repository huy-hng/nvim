local signs = {
	{ name = 'DiagnosticSignError', text = '' }, --   
	{ name = 'DiagnosticSignWarn', text = '◉' }, -- 
	{ name = 'DiagnosticSignInfo', text = '' }, -- 
	{ name = 'DiagnosticSignHint', text = '·' }, -- 
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
