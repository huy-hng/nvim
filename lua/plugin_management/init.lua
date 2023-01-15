require('plugin_management.ensure_lazy')

Nmap('<C-S-P>', require('lazy').home)
local config = require('plugin_management.config')
require('lazy').setup({
	{ import = 'plugins' },
	{ import = 'plugins.coding' },
	{ import = 'plugins.editor' },
	{ import = 'plugins.git' },
	{ import = 'plugins.lsp' },
	{ import = 'plugins.ui' },
}, config)
