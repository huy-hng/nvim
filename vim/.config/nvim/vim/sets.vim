" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

set number
set relativenumber
set clipboard+=unnamedplus
set mouse=a
set noerrorbells

set nohlsearch
set foldmethod=syntax
set nofoldenable
"
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
set textwidth=120 " Linebreak on 120 characters
let &showbreak='--> ' " prefix for soft-wrapped lines
set linebreak " soft-wrap lines only at certain characters (see :help breakat)
set breakindent " indent wraps
set list " to display indentations and trailing whitespaces
set cpoptions+=n " start showbreak in line-number area (doesn't work with break indent enabled)

