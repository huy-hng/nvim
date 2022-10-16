"===============================================================================
" => Text Editing
"===============================================================================

" alt shift to copy line
nmap <A-S-j> yyp
nmap <A-S-k> yyP
vmap <A-S-j> Y$p
vmap <A-S-k> Y$P

" ctrl backspace to delete previous word
noremap! <C-h> <C-w>


"===============================================================================
" => Pasting
"===============================================================================
" function to keep cursor in same column when pasting
function! KeepColumn(action)
	let l:column = col('.')

	exec 'normal! ' . a:action

	let l:line = line('.')
	call cursor(line,column)
endfunction


noremap! <C-v> <C-r>+
" nnoremap <leader>p "+p
nnoremap <leader>y "+y
nnoremap <leader>p "0p
nnoremap <leader>P "0P


" keep yank register when pasting
vnoremap <silent> p "_dP
nnoremap <silent> p <cmd>call KeepColumn('P')<CR>
nnoremap <silent> P <cmd>call KeepColumn('P')<CR>


"===============================================================================
" => Line Manipulation
"===============================================================================
" move lines up and down
nnoremap <A-j> mz:m+<cr>`z
nnoremap <A-k> mz:m-2<cr>`z
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
noremap <Tab> >>
noremap <S-Tab> <<
" the double maps are needed because the first pair makes indenting not loose visual

" and the second one recursively binds that to Tab and shift tab
vnoremap > >gv
vnoremap < <gv
vmap <Tab> >
vmap <S-Tab> <