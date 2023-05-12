require('core.options')
require('core.globals')

require('clean.plugins')

require('catppuccin')
vim.cmd.colorscheme('catppuccin-mocha')

vim.o.wrap = false

local map = vim.keymap.set
map('n', '<leader>w', vim.cmd.w)
map('n', ';', ':')
map('n', '<leader>q', vim.cmd.q)


vim.opt.langmap = 'twTW'

Map('QQ', '<cmd>qa!<cr>')

local function upper_map(lhs, rhs)
	Map(lhs, rhs)
	Map(string.upper(lhs), string.upper(rhs))
end

upper_map('f', 'y')

Map('<C-h>', '<C-r>')

Map('a', 'ge')
Map('A', 'gE')

upper_map('r', 'b')
upper_map('s', 'v')
-- upper_map('t', 'w')
upper_map('g', 'e')

upper_map('m', 'h')
upper_map('n', 'j')
upper_map('e', 'k')
upper_map('i', 'l')
-- Map.o('t', 'w', '', { remap = true })
-- Map.o('t', 'w', '', { remap = true })

Map('h', 'u')
upper_map('u', 'i')
upper_map('y', 'a')
upper_map('j', 'g')

upper_map('l', 'n')
upper_map('k', 't')
upper_map('b', 'f')
