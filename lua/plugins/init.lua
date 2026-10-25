vim.pack.add({ { src = 'https://github.com/folke/lazy.nvim', version = 'stable' } }, { confirm = false })


local function import(package_name)
	return { import = 'plugins.' .. package_name }
end

local spec = {
	------------------------------------------------P1----------------------------------------------
	-- Preserves the editing experience
	-- Plugins whose absence makes normal editing unpleasant or materially harder.
	------------------------------------------------------------------------------------------------

	import('catppuccin'),
	import('gomove'),
	import('visual_multi'),

	import('lsp'),
	-- import('treesitter'),
	import('cmp.init'),
	import('snippets.init'),

	import('oil'),

	import('comment'),
	{ 'moll/vim-bbye', event = 'VeryLazy' },

	------------------------------------------------P2----------------------------------------------
	-- Restore productivity
	-- Powerful tools you rely on, but can temporarily replace with built-in functionality.
	------------------------------------------------------------------------------------------------

	import('telescope.init'),
	import('bufman'),

	------------------------------------------------P3----------------------------------------------
	-- Restore convenience
	-- Useful integrations that can wait until the editor is otherwise healthy.
	------------------------------------------------------------------------------------------------

	import('lualine.init'),
	import('heirline.init'),

	------------------------------------------------P4----------------------------------------------
	-- Restore indulgences
	-- Experimental features, visual flourishes, and things you can happily sacrifice during a recovery.
	------------------------------------------------------------------------------------------------

}

require('lazy').setup(spec, require('plugins.lazy.config'))

Map.n(Keys.plugin_manager, require('lazy').home)

return M
