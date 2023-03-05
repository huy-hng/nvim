require('clean.options')
require('clean.plugins')

require('catppuccin')

vim.cmd.colorscheme('catppuccin-mocha')

vim.o.wrap = false


local map = vim.keymap.set
map('n', '<leader>w', vim.cmd.w)
map('n', ';', ':')
map('n', '<leader>q', vim.cmd.q)
--map('n', '<C-S-P>', require('lazy').home)

local function test()
	-- 'laksdj'
end

