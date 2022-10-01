silent !stty -ixon > /dev/null 2>/dev/null

highlight ColorColumn ctermbg=grey guibg=grey

highlight Folded guibg=blue guifg=yellow
highlight FoldColumn guibg=blue guifg=yellow

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Set a line at 80 chars
set colorcolumn=80

" Ps = 0  -> blinking block.
" Ps = 1  -> blinking block (default).
" Ps = 2  -> steady block.
" Ps = 3  -> blinking underline.
" Ps = 4  -> steady underline.
" Ps = 5  -> blinking bar (xterm).
" Ps = 6  -> steady bar (xterm).

let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

" reset the cursor on start (for older versions of vim, usually not required)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 8 lines to the cursor - when moving vertically using j/k
set scrolloff=8
set sidescroll=1
set sidescrolloff=8

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif


set magic " For regular expressions turn magic on
set showmatch " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500



