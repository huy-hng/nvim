"===============================================================================
" => Text Editing
"===============================================================================

" ctrl backspace to delete previous word


"===============================================================================
" => Pasting
"===============================================================================
" nnoremap <leader>p "+p
" nnoremap <leader>y "+y
" nnoremap <leader>p "0p
" nnoremap <leader>P "0P


"===============================================================================
" => Line Manipulation
"===============================================================================
" move lines up and down
" nnoremap <A-j> mz<cmd>m+<cr>`z
" nnoremap <A-k> mz<cmd>m-2<cr>`z

" vnoremap <A-j> :m'>+<cr>`<my`>mzgv`yo`z
" vnoremap <A-k> :m'<-2<cr>`>my`<mzgv`yo`z

"xnoremap <M-j> :move '>+1<CR>gv-gv
"xnoremap <M-k> :move '<-2<CR>gv-gv
