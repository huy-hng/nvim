set nocompatible
filetype plugin on

set undofile
set number
set relativenumber
" set clipboard+=unnamed " copies to primary when yanking (stays across tmux panes)
"set clipboard+=unnamedplus
set mouse=a
set noerrorbells
set nocursorline
"set cursorlineopt=line,number

" stop auto comment for new lines
set formatoptions-=cro " default tcqj

" show complete option popup
set completeopt=menu,menuone,noselect,preview

set nohlsearch
set foldcolumn=auto
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

" Sets how many lines of history VIM has to remember
set history=500
" Enable filetype plugins
filetype indent on

set autoindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4

" wrapping
set nowrap " F5 to wrap
"set textwidth=120 " Linebreak on 120 characters
let &showbreak='--> ' " prefix for soft-wrapped lines
set linebreak " soft-wrap lines only at certain characters (see :help breakat)
set breakindent " indent wraps
set cpoptions+=n " start showbreak in line-number area (doesn't work with break indent enabled)

set numberwidth=4 " set to something smaller to reduce gutter size

set list " to display indentations and trailing whitespaces
set lcs=tab:\·\ ,trail:·,nbsp:+
" set lcs=tab:\│\ ,trail:·,nbsp:+

" ['|', '¦', '┆', '┊']


set ruler "Always show current position
set cmdheight=1 " Height of the command bar
set hidden " A buffer becomes hidden when it is abandoned

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases 
set incsearch " Incremental search
set lazyredraw " Don't redraw while executing macros (good performance config)

