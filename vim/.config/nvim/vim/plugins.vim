call plug#begin('~/.config/nvim/plugged')

Plug 'gruvbox-community/gruvbox' " theme

Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-obsession' " save vim sessions

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

