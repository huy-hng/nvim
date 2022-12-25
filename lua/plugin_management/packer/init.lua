require('plugin_management.packer.ensure_packer')
require('plugin_management.packer.packer_compiled')

-- packer.use()
return require('packer').startup {
	config = require('plugin_management.packer.packer_config'),
	function(use)
		use('wbthomason/packer.nvim')

		require('plugin_management.packer.plugins.my_plugins')(use)
		require('plugin_management.packer.plugins.completion')(use)
		require('plugin_management.packer.plugins.treesitter')(use)
	end,
}
