call plug#begin('~/.config/nvim/plugs')
"===============================================================================
"                                 => Style <=
"===============================================================================

"---------------------------------------
"            -> Themes <-
"---------------------------------------
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'lunarvim/darkplus.nvim'
"Plug 'gruvbox-community/gruvbox'


"---------------------------------------
"             -> Looks <-
"---------------------------------------
Plug 'itchyny/lightline.vim'
"Plug 'powerline/powerline'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'


"---------------------------------------
"           -> Zen Mode <-
"---------------------------------------
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'


"===============================================================================
"                                => Helpers <=
"===============================================================================
" syntax error
Plug 'dense-analysis/ale'
Plug 'liuchengxu/vim-which-key'

Plug 'tpope/vim-obsession' " save vim sessions
Plug 'tpope/vim-fugitive' " git stuff
Plug 'tpope/vim-commentary' " comments depending on filetype
Plug 'airblade/vim-gitgutter' " display changes on side


"===============================================================================
"                             |=> Big Features <=|
"===============================================================================
Plug 'vimwiki/vimwiki' " note taking
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'


"---------------------------------------
"           -> NerdTree <-
"---------------------------------------
" Plug 'preservim/nerdtree' " file explorer
" Plug 'ryanoasis/vim-devicons' " icon pack for nerdtree
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'PhilRunninger/nerdtree-buffer-ops'

"---------------------------------------
"            -> Ranger <-
"---------------------------------------
" Plug 'francoiscabrol/ranger.vim'
" Plug 'rbgrouleff/bclose.vim'
Plug 'kevinhwang91/rnvimr'


"---------------------------------------
"          -> Completion <-
"---------------------------------------
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'

Plug 'hrsh7th/nvim-cmp' " The completion plugin
Plug 'hrsh7th/cmp-buffer' " buffer completions
Plug 'hrsh7th/cmp-path' " path completions
Plug 'hrsh7th/cmp-cmdline' " cmdline completions

" Plug 'saadparwaiz1/cmp_luasnip' " snippet completions
" Plug 'L3MON4D3/LuaSnip' " snippet engine

" Plug 'rafamadriz/friendly-snippets' " a bunch of snippets to use

"---------------------------------------
"    -> Telescope requirements <-
"---------------------------------------
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()


"===============================================================================
"                         => Plugin Configuration <=
"===============================================================================

source $path/plugins/gitgutter.vim
source $path/plugins/goyo.vim
source $path/plugins/lightline.vim
source $path/plugins/limelight.vim
source $path/plugins/vimwiki.vim
source $path/plugins/which_key.vim
source $path/plugins/ranger.vim
"source $path/plugins/vscode.vim
source $path/plugins/ranger.vim


lua <<EOF
	require 'user.cmpp'
EOF

