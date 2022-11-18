"===============================================================================
" => MISC
"===============================================================================

" F keys for extra functions
nnoremap <F3> <cmd>set hlsearch!<bar>set hlsearch?<CR>
nnoremap <F4> <cmd>call Toggle_Conceal()<CR>
nnoremap <F8> <cmd>call Wrap()<CR>

nnoremap <leader><CR> <cmd>lua FlashCursor(3)<CR>

" open file tree on the side

"vnoremap <Leader>1 :call Figlet()<CR>
"vnoremap <Leader>1 I<Esc>O{{{cat<esc>gvA<esc>o}}}<esc>gv:!figlet -k -t<CR>
"
vnoremap <A-1> <cmd>call SurroundWithPreformatter()<CR>

