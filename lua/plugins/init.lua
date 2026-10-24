vim.pack.add({
	{ src = 'https://github.com/folke/lazy.nvim', version = 'stable' },
}, { confirm = false })

require('plugins.catppuccin')
require('plugins.lsp')
require('plugins.oil')
require('plugins.comment').config()
-- require('plugins.treesitter')

vim.pack.add({
	{ src = 'https://github.com/moll/vim-bbye' }, -- stops closing windows when deleting buffers
})
