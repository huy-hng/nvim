"===============================================================================
" => Leader Key
"===============================================================================

nnoremap <SPACE> <NOP>
let g:mapleader = ' '
let g:maplocalleader = '\'


nnoremap <ESC> <ESC><cmd>noh<CR>


" F keys for extra functions
nnoremap <F3> :set hlsearch!<CR>:set hlsearch?<CR>
nnoremap <silent><F4> :call Toggle_Conceal()<CR>
nnoremap <leader><CR> :call FlashCursor()<CR>
nnoremap <F8> :call Wrap()<CR>

" open file tree on the side
nnoremap <C-S>b :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

"vnoremap <Leader>1 :call Figlet()<CR>
"vnoremap <Leader>1 I<Esc>O{{{cat<esc>gvA<esc>o}}}<esc>gv:!figlet -k -t<CR>

vnoremap <A-1> :call SurroundWithPreformatter()<CR>
