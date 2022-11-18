"===============================================================================
" => Text Editing
"===============================================================================

" alt shift to copy line
nnoremap <A-S-j> yyp
nnoremap <A-S-k> yyP
vnoremap <A-S-j> Y'>p
vnoremap <A-S-k> Y'<P

" ctrl backspace to delete previous word
noremap! <C-h> <C-w>


"===============================================================================
" => Pasting
"===============================================================================
noremap! <C-v> <C-r>+
" nnoremap <leader>p "+p
nnoremap <leader>y "+y
nnoremap <leader>p "0p
nnoremap <leader>P "0P


"===============================================================================
" => Line Manipulation
"===============================================================================
" move lines up and down
nnoremap <A-j> mz<cmd>m+<cr>`z
nnoremap <A-k> mz<cmd>m-2<cr>`z
vnoremap <A-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <A-k> :m'<-2<cr>`>my`<mzgv`yo`z

"xnoremap <M-j> :move '>+1<CR>gv-gv
"xnoremap <M-k> :move '<-2<CR>gv-gv


"===============================================================================
" => Indentation
"===============================================================================

" shift tab to unindent
inoremap <A-Tab> <C-t>
inoremap <S-Tab> <C-d>
" nnoremap <Tab> >> " tab is ^I (ctrl+i) meaning jumping in jumplist wont work
" noremap <Tab> >>
noremap <S-Tab> <<
" the double maps are needed because the first pair makes indenting not loose visual

" and the second one recursively binds that to Tab and shift tab
vnoremap > >gv
vnoremap < <gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
