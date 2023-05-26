require('plugin_manager.ensure_lazy')
local spec = {
	{ import = 'plugins' },
	{ import = 'plugins.coding' },
	{ import = 'plugins.editor' },
	{ import = 'plugins.git' },
	{ import = 'plugins.lsp' },
	{ import = 'plugins.ui' },
}

require('lazy').setup(spec, require('plugin_manager.config'))

require('plugin_manager.reload_on_save').start()
