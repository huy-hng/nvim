call plug#begin('~/.config/nvim/plugged')

" themes
Plug 'gruvbox-community/gruvbox'

"Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" syntax error
Plug 'dense-analysis/ale'

Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-obsession' " save vim sessions

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

