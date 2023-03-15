require('plugin_management.ensure_lazy')

Nmap('<C-S-P>', require('lazy').home)

require('lazy').setup({
	{ import = 'plugins' },
	{ import = 'plugins.coding' },
	{ import = 'plugins.editor' },
	{ import = 'plugins.git' },
	{ import = 'plugins.lsp' },
	{ import = 'plugins.ui' },
}, require('plugin_management.config'))
