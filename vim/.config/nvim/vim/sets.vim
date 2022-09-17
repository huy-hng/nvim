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
set tabstop=4

" wrapping
set wrap " default behavior
let &showbreak='  ' " prefix for soft-wrapped lines
set linebreak " soft-wrap lines only at certain characters (see :help breakat)
set breakindent
"set cpoptions+=n " start showbreak in line-number area (doesn't work with break indent enabled)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
"set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

