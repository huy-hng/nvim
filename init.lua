---------------------------------------------Set Path-----------------------------------------------

NVIM_CONFIG_PATH = os.getenv('HOME') .. '/.config/nvim/'
package.path = NVIM_CONFIG_PATH .. '?.lua;' .. package.path

local requires = require('requires')
requires.minimal_init()
requires.extra_features()
requires.lazyload()

-- to start neovim in minimal
-- $nvim --cmd "let g:minimal=1"

