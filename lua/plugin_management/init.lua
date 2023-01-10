require('plugin_management.ensure_lazy')

local config = require('plugin_management.config')
-- require('lazy').setup('plugins', config)
require('lazy').setup({
	{ import = 'plugins' },
	{ import = 'plugins.coding' },
	{ import = 'plugins.editor' },
	{ import = 'plugins.git' },
	{ import = 'plugins.lsp' },
	-- { import = 'plugins.neorg' },
	{ import = 'plugins.ui' },
}, config)

-- local group = vim.api.nvim_create_augroup('startertest2',{})
-- vim.api.nvim_create_autocmd('User', {
-- 	group = group,
-- 	pattern = { 'LazyDone', 'VeryLazy', 'LazyVimStarted' },
-- 	callback = function(data) print(data.event) end,
-- })
