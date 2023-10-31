require('plugin_manager.ensure_lazy')
local spec = {
	{ import = 'plugins.basics' },
	{ import = 'plugins.ui' },

	{ import = 'plugins.editing' },
	{ import = 'plugins.editor' },
	{ import = 'plugins.git' },

	{ import = 'plugins.lsp' },
	{ import = 'plugins.treesitter' },
}

require('lazy').setup(spec, require('plugin_manager.config'))
require('plugin_manager.reload_on_save').start()

Map.n(Keys.plugin_manager, require('lazy').home)
