require('plugin_management.ensure_lazy')
local spec = {
	{ import = 'plugins' },
	{ import = 'plugins.coding' },
	{ import = 'plugins.editor' },
	{ import = 'plugins.git' },
	{ import = 'plugins.lsp' },
	{ import = 'plugins.ui' },
}

require('lazy').setup(spec, require('plugin_management.config'))

require('plugin_management.reload_on_save').start()
