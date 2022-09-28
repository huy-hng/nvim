
"""" Leader Key """"

nnoremap <SPACE> <NOP>
let mapleader = " "


""""""""""""""""""""""
"""" file editing """"
""""""""""""""""""""""

" Fast saving and quitting
nnoremap <silent><leader>x <cmd>w<CR>:!clear\<silent><CR>:! %:p<CR>
nnoremap <silent><Leader>w <cmd>w!<CR>
nnoremap <silent><Leader>q <cmd>q<CR>
nnoremap <silent><Leader>Q <cmd>q!<CR>
nnoremap <silent><Leader>wq <cmd>wq<CR>

" :W sudo saves the file (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!



"""""""""""""""""
"""" rebinds """"
"""""""""""""""""

nnoremap q: <NOP>
nnoremap q/ <NOP>
nnoremap <M-;> q:
nnoremap <M-/> q/

" Remap VIM 0 to first non-blank character
nnoremap 0 ^
nnoremap ^ 0


" open file tree on the side
nnoremap <C-S>b :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>


""""""""""""""""""""""""""
"""" Behavior Changes """"
""""""""""""""""""""""""""

" ctrl+c to copy to clipboard
nnoremap <C-c> "+y
vnoremap <C-c> "+y


" change default behaviour of Y which is yy
nnoremap Y y$


" break undo sequence before pasting from register
inoremap <C-R> <C-G>u<C-R>
inoremap <C-v> <C-G>u<C-v>


" new line without leaving normal mode
" nnoremap <CR> o<ESC>


""""""""""""""""""
"""" Movement """"
""""""""""""""""""
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" horizontal scrolling
nnoremap <A-h> 20zh
nnoremap <A-l> 20zl
nnoremap <A-H> zH
nnoremap <A-L> zL



"""""""""""""""""
"""" Editing """"
"""""""""""""""""

" alt shift to copy line 
nnoremap <A-S-j> yyp
nnoremap <A-S-k> yyP
vnoremap <A-S-j> Y$p
vnoremap <A-S-k> Y$P


" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"xnoremap <M-j> :move '>+1<CR>gv-gv
"xnoremap <M-k> :move '<-2<CR>gv-gv


" ctrl backspace to delete previous word
noremap! <C-h> <C-w>



"""" Indentation """"
" shift tab to unindent
inoremap <A-Tab> <C-t>
inoremap <S-Tab> <C-d>
" nnoremap <Tab> >> " tab is ^I (ctrl+i) meaning jumping in jumplist wont work
noremap <A-Tab> >>
noremap <S-Tab> <<
" the double maps are needed because the first pair makes indenting not loose visual
" and the second one recursively binds that to Tab and shift tab
vnoremap > >gv
vnoremap < <gv
vmap <A-Tab> >
vmap <S-Tab> <



"""""""""""""""
"""" Extra """"
"""""""""""""""

" F keys for extra functions
nnoremap <silent><F3> :set hlsearch!<CR>
nnoremap <silent><F4> :call Toggle_Conceal()<CR>
nnoremap <silent><F5> :set wrap!<CR>


"vnoremap <Leader>1 :call Figlet()<CR>
"vnoremap <Leader>1 I<Esc>O{{{cat<esc>gvA<esc>o}}}<esc>gv:!figlet -k -t<CR>
vnoremap <A-1> :call SurroundWithPreformatter()<CR>


""""""""""""""""""""
"""" Extensions """"
""""""""""""""""""""

" Vimwiki
nnoremap <silent><Leader><CR> :call Create_Vimwiki_Link()<CR>
"nnoremap <silent><S-Left> <Plug>VimwikiPrevLink<CR>
"nnoremap <silent><S-Right> <Plug>VimwikiNextLink<CR>
" doesnt work
nnoremap <silent><F6> :call ToggleTableFormatting()<CR>
