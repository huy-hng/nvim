call plug#begin('~/.config/nvim/plugins')
"===============================================================================
"                             |=> Big Features <=|
"===============================================================================
Plug 'vimwiki/vimwiki' " note taking
Plug 'jceb/vim-orgmode'
Plug 'mbbill/undotree'
Plug 'unblevable/quick-scope'


" Plug 'ryanoasis/vim-devicons' " icon pack for nerdtree
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'PhilRunninger/nerdtree-buffer-ops'
" Plug 'francoiscabrol/ranger.vim'
" Plug 'rbgrouleff/bclose.vim'


"---------------------------------------
"          -> Completion <-
"---------------------------------------
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/nvim-cmp' " The completion plugin
Plug 'hrsh7th/cmp-buffer' " buffer completions
Plug 'hrsh7th/cmp-path' " path completions
Plug 'hrsh7th/cmp-cmdline' " cmdline completions
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'

Plug 'dmitmel/cmp-cmdline-history'
Plug 'andersevenrud/cmp-tmux'

Plug 'L3MON4D3/LuaSnip' " snippet engine
Plug 'saadparwaiz1/cmp_luasnip' " snippet completions

Plug 'rafamadriz/friendly-snippets' " a bunch of snippets to use


"---------------------------------------
"              -> LSP <-
"---------------------------------------
Plug 'neovim/nvim-lspconfig' " enable LSP
Plug 'williamboman/nvim-lsp-installer' " simple to use language server installer
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'dense-analysis/ale'


"---------------------------------------
"           -> Telescope <-
"---------------------------------------
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/harpoon'

"---------------------------------------
"          -> Treesitter <-
"---------------------------------------
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'p00f/nvim-ts-rainbow' " highlight parentheses in different colors



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
"        -> User Interface <-
"---------------------------------------
" startscreens
Plug 'mhinz/vim-startify'
" Plug 'glepnir/dashboard-nvim'
" Plug 'goolord/alpha-nvim'


Plug 'kyazdani42/nvim-web-devicons' " file icons
Plug 'kyazdani42/nvim-tree.lua' " file tree
Plug 'kevinhwang91/rnvimr' " ranger

Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' } " 'tabs' at the top
Plug 'moll/vim-bbye' " stop fucking closing my shit
" Plug 'itchyny/lightline.vim'
"Plug 'powerline/powerline'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'


"---------------------------------------
"           -> Zen Mode <-
"---------------------------------------
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'


"===============================================================================
"                          |=> Smaller Features <=|
"===============================================================================
" syntax error
Plug 'folke/which-key.nvim'

Plug 'gko/vim-coloresque'

Plug 'tpope/vim-obsession' " save vim sessions
Plug 'tpope/vim-fugitive' " git stuff
" Plug 'tpope/vim-commentary' " comments depending on filetype
Plug 'tpope/vim-surround'

Plug 'numToStr/Comment.nvim'
"
" Plug 'airblade/vim-gitgutter' " display changes on side
Plug 'lewis6991/gitsigns.nvim'

Plug 'windwp/nvim-autopairs' " pair brackets
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()
