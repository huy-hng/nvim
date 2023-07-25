return {
	name = 'lua-language-server',
	cmd = { 'lua-language-server' },
	before_init = require('neodev.lsp').before_init,
	settings = {
		Lua = {
			workspace = {
				-- library = vim.api.nvim_get_runtime_file('', true),
				checkThirdParty = false,
				library = {
					vim.fn.expand('$VIMRUNTIME/lua'),
					vim.fn.stdpath('config') .. '/lua',
				},
			},
			misc = {
				parameters = {
					'--log-level=trace',
				},
			},
			format = {
				enable = false,
				defaultConfig = {
					indent_style = 'tab',
					indent_size = '4',
					continuation_indent_size = '4',
				},
			},
		},
	},
}
