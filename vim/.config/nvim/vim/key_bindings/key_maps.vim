let g:which_key_map = {}

""""""""""""""""""""
"""" Leader Key """"
""""""""""""""""""""

nnoremap <SPACE> <NOP>
let g:mapleader = ' '
"let g:maplocalleader = '\'


""""""""""""""""""""""
"""" file editing """"
""""""""""""""""""""""
nnoremap <leader>x <cmd>w<CR>:!clear<CR>:! %:p<CR>
nnoremap <silent><Leader>w <cmd>w!<CR>
nnoremap <silent><Leader>W <cmd>w!<CR><cmd>so $HOME/.config/nvim/init.vim<CR>
"nnoremap <silent><Leader>q <cmd>q<CR>
nnoremap <silent><Leader>Q <cmd>q!<CR>
nnoremap <silent><Leader>wq <cmd>wq<CR>

" :W sudo saves the file (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

"""""""""""""""""
"""" rebinds """"
"""""""""""""""""

nnoremap ; :
nnoremap : ;

nnoremap q: <NOP>
nnoremap q/ <NOP>
nnoremap <leader>; q:
nnoremap <leader>/ q/

" Remap VIM 0 to first non-blank character
nnoremap g0 g^
nnoremap g^ g0
nnoremap 0 ^
nnoremap ^ 0


" open file tree on the side
nnoremap <C-S>b :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

""""""""""""""""""""""""""
"""" Behavior Changes """"
""""""""""""""""""""""""""

noremap <CR> $
"nnoremap vv V
"nnoremap V v$
" ctrl+c to copy to clipboard
nnoremap <leader>P "+P
"nnoremap <leader>p "+p
nnoremap <leader>yy "+yy
vnoremap <leader>y "+y

nnoremap <C-c> "+yy
vnoremap <C-c> "+y


" change default behaviour of Y which is yy
nnoremap Y y$


" break undo sequence before pasting from register
inoremap <C-R> <C-G>u<C-R>
inoremap <C-v> <C-G>u<C-v>

" new line without leaving normal mode
"nnoremap <CR> o<ESC>



"""""""""""""""""
"""" Command """"
"""""""""""""""""
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>


""""""""""""""""""
"""" Movement """"
""""""""""""""""""
"
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

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz


""""""""""""""""""""
"""" Navigation """"
""""""""""""""""""""

nnoremap <Leader>n :buffers<CR>:buffer<Space>
" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove·
map <leader>t<leader> :tabnext·

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers·
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=1
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""
"""" Folding """"
"""""""""""""""""

nnoremap <C-k><ESC> zc
nnoremap <C-k><C-]> zo


"""""""""""""""""
"""" Editing """"
"""""""""""""""""

" alt shift to copy line 
nnoremap <A-S-j> yyp
nnoremap <A-S-k> yyP
vnoremap <A-S-j> Y$p
vnoremap <A-S-k> Y$P

function! KeepColumn(action)
	let l:column = col('.')

	exec 'normal! ' . a:action

	let l:line = line('.')
	call cursor(line,column)
endfunction

nnoremap <leader>p p
nnoremap <leader>P P
nnoremap p :call KeepColumn('p')<CR>
nnoremap P :call KeepColumn('P')<CR>


nnoremap <A-j> mz:m+<cr>`z
nnoremap <A-k> mz:m-2<cr>`z
vnoremap <A-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <A-k> :m'<-2<cr>`>my`<mzgv`yo`z

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
nnoremap <F3> :set hlsearch!<CR>:set hlsearch?<CR>
nnoremap <silent><F4> :call Toggle_Conceal()<CR>
nnoremap <leader>fl :call Flash()<CR>
nnoremap <F8> :call Wrap()<CR>


"vnoremap <Leader>1 :call Figlet()<CR>
"vnoremap <Leader>1 I<Esc>O{{{cat<esc>gvA<esc>o}}}<esc>gv:!figlet -k -t<CR>
"
vnoremap <A-1> :call SurroundWithPreformatter()<CR>

