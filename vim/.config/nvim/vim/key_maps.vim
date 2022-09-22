"""" Leader Key """"
nnoremap <SPACE> <Nop>
let mapleader = " "

"""" Quality of life improvements """"

" Fast saving and quitting
nnoremap <silent><leader>x <Esc>:w<CR>:!clear<CR>:! %:p<CR>
nnoremap <silent><Leader>w <Esc>:w!<CR>
nnoremap <silent><Leader>q <Esc>:q<CR>
nnoremap <silent><Leader>Q <Esc>:q!<CR>
nnoremap <silent><Leader>wq <Esc>:wq<CR>

" :W sudo saves the file (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


" Remap VIM 0 to first non-blank character
nnoremap 0 ^
nnoremap ^ 0


" open file tree on the side
nnoremap <C-S>b :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>


" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


" ctrl backspace to delete previous word
noremap! <C-h> <C-w>


" F keys for extra functions
nnoremap <silent><F3> :set hlsearch!<CR>
nnoremap <silent><F4> :call Toggle_Conceal()<CR>
nnoremap <silent><F5> :set wrap!<CR>


" Vimwiki
nnoremap <silent><A-CR> :call Create_Vimwiki_Link()<CR>
" doesnt work
nnoremap <silent><F6> :call ToggleTableFormatting()<CR>


" new line without leaving normal mode
" nnoremap <CR> o<ESC>


" shift tab to unindent
inoremap <S-Tab> <C-d>
" nnoremap <Tab> >> " tab is ^I (ctrl+i) meaning jumping in jumplist wont work
noremap <S-Tab> <<
" the double maps are needed because the first pair makes indenting not loose visual
" and the second one recursively binds that to Tab and shift tab
vnoremap > >gv
vnoremap < <gv
vmap <S-Tab> <
vmap <Tab> >


""""Copying""""

" ctrl+c to copy to clipboard
nnoremap <C-c> "+y
vnoremap <C-c> "+y


" change default behaviour of Y which is yy
nnoremap Y y$


" alt shift to copy line 
nnoremap <A-S-j> yyp
nnoremap <A-S-k> yyP
vnoremap <A-S-j> Y$p
vnoremap <A-S-k> Y$P


" break undo sequence before pasting from register
inoremap <C-R> <C-G>u<C-R>
inoremap <C-v> <C-G>u<C-v>


"vnoremap <Leader>1 :call Figlet()<CR>
vnoremap <Leader>1 I<Esc>O{{{cat<esc>gvA<esc>o}}}<esc>gv:!figlet -k -t<CR>
