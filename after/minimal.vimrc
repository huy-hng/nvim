set number
set relativenumber

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" copying
set clipboard+=unnamedplus
nnoremap <C-c> "+y
vnoremap <C-c> "+y
" nnoremap <esc> <esc><CMD>nohlsearch<CR>
" nnoremap  <CMD>nohlsearch<CR>



syntax enable

set wildmenu

"--------------------------------Editing--------------------------------
set virtualedit=block
set timeoutlen=300 " milliseconds to wait for a keymap to complete

"--------------------------------Editor--------------------------------

" indentation
set autoindent
set smartindent
set smarttab

set tabstop=4
set shiftwidth=4
set noexpandtab

" wrapping
set nowrap
let &showbreak='… ' " prefix for soft-wrapped lines (no actual line break character
set linebreak " soft-wrap lines only at certain characters (see :help breakat)
set breakindent
"set cpoptions+=n " start showbreak in line-number area (doesn't work with break indent enabled


" Add a bit extra margin to the left
set foldcolumn=1
set foldmethod=indent
set nofoldenable " uncollapse folds by default


" search
set ignorecase

set hidden

filetype indent on

set scrolloff=4
set sidescroll=1
set sidescrolloff=1


" line cursor in insert and block in normal
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

set splitright
set splitbelow
set splitkeep=screen

"----------------Statusline----------------
" Always show the status line
" set laststatus=2

" Format the status line
" set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"----------------Colors----------------
try
	colorscheme habamax
	"set termguicolors
catch
endtry

"----------------Undo----------------
" break undo sequence before pasting from register
inoremap <C-R> <C-G>u<C-R>
set undofile
set nobackup
set noswapfile


"--------------------------------Keymaps--------------------------------

nnoremap <SPACE> <Nop>
let mapleader = " "


function! Mapupper(lhs, rhs)
	noremap lhs rhs
endfunction

"----------------Colemak remaps----------------
" operators
noremap u i
noremap U I
noremap y a
noremap Y A

noremap s v
noremap <C-s> <C-v>
nnoremap ss V
nnoremap S vg_
vnoremap S V

noremap f y
noremap F y$
noremap ff yy
vmap F Y

noremap w r
noremap W s

" text objects
noremap r b
noremap R B

noremap t w
noremap T W

noremap g e
noremap G E

noremap a ge
noremap A gE

" inner and around word
onoremap ut iw
vnoremap ut iw
onoremap uT iW
vnoremap uT iW

onoremap yt aw
vnoremap yt aw
onoremap yT aW
vnoremap yT aW


" pretend netrw is already loaded since it sets some maps with g after this
let g:loaded_netrwPlugin = 1

" movement
noremap m h
noremap n j
noremap e k
noremap i l
noremap <C-n> <C-d>
noremap <C-e> <C-u>

" misc
noremap v m

" g maps
noremap j<C-A> g<C-A>
noremap j g
noremap jj gg
noremap ju gu
noremap jU gU
noremap js gv
noremap jn gn
noremap jO gO

noremap k t
noremap b f
noremap h u
noremap <C-h> <C-r>
noremap l n

noremap QQ <cmd>q<CR>

"----------------text editing----------------
" move line
nnoremap <M-j> mz:m+<cr>`z
nnoremap <M-k> mz:m-2<cr>`z
vnoremap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" copy line
nnoremap <A-S-j> yyp
nnoremap <A-S-k> yyP
vnoremap <A-S-j> Y$p
vnoremap <A-S-k> Y$P

" movement
noremap - ^
noremap + $

map Q <nop>

" ctrl backspace deletes word
" noremap! <C-h> <C-w>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
