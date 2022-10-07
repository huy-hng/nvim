vim.cmd('source ~/.config/nvim/vimrc')

nvim_path = os.getenv('HOME') .. '/.config/nvim/'
function require_dir(name)
	for f in os.dir(vim_files_path .. name) do
		print(f)
	end
end

-- require_dir('key_bindings')

-- vim.lsp.start({
-- 	name = 'my-server-name',
-- 	cmd = {'name-of-language-server-executable'},
-- 	root_dir = vim.fs.dirname(vim.fs.find({'setup.py', 'pyproject.toml'}, { upward = true })[1]),
-- })

----------------------------------------
--         -> Lua Plugins <-
----------------------------------------

local require_dir = require 'helpers.require_dir'
require_dir('lua/plugins')
require_dir('lua/user')
require_dir('lua/functions')
-- require_dir('lua/lsp')
-- require 'lsp'

-- FlashCursor()



-- require 'user.cmp'
-- require 'user.lsp'
-- require 'user.autopairs'
-- require 'user.treesitter'
-- require 'user.bufferline'
-- require 'user.statusline'
-- require 'user.neovide'
-- require 'user.gitsigns'
-- require 'user.whichkey'
-- require 'user.nvim-tree'

