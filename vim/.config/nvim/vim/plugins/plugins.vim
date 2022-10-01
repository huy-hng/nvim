call plug#begin('~/.config/nvim/plugs')

" themes
"Plug 'gruvbox-community/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

"Plug 'powerline/powerline'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'


" syntax error
Plug 'dense-analysis/ale'

"Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'liuchengxu/vim-which-key'


Plug 'mbbill/undotree'
Plug 'tpope/vim-obsession' " save vim sessions
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'

Plug 'itchyny/lightline.vim'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

source $path/plugins/gitgutter.vim
source $path/plugins/goyo.vim
source $path/plugins/lightline.vim
source $path/plugins/limelight.vim
"source $path/plugins/ranger.vim
source $path/plugins/vimwiki.vim
"source $path/plugins/vscode.vim
source $path/plugins/which_key.vim
