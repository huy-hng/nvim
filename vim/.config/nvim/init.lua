NVIM_CONFIG_PATH = os.getenv 'HOME' .. '/.config/nvim/'
package.path = NVIM_CONFIG_PATH .. '?.lua;' .. package.path

vim.cmd [[
	let $path = $HOME.'/.config/nvim/vim'

	fun! SourceDir(dir_name)
		let $dir_path = $path..'/'..a:dir_name..'/*.vim'

		for f in split(glob($dir_path), '\n')
			exe 'source' f
		endfor
	endfun

	call SourceDir('functions')
	call SourceDir('key_bindings')
	call SourceDir('plugins')

	source $path/functions.vim
	source $path/misc.vim
	source $path/autocmds.vim
]]

local require_dir = require 'helpers.require_dir'

require 'colorscheme'
require 'plugins'
require 'autocmd'

require_dir 'lua/helpers'
require_dir 'lua/keymaps'
require_dir 'lua/user'

require_dir 'lua/plugins'
require_dir 'lua/functions'

require 'statusline'
require 'lsp.init'

if vim.g.neovide then require 'neovide' end
