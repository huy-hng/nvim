"===============================================================================
" => Text Movement
"===============================================================================

" horizontal scrolling
nnoremap <A-h> 20zh
nnoremap <A-l> 20zl
nnoremap <A-H> zH
nnoremap <A-L> zL

" nnoremap <C-d> <C-d>zz<cmd>call FlashOnce()<CR>
" nnoremap <C-u> <C-u>zz<cmd>call FlashOnce()<CR>
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

noremap <CR> g_

noremap! <A-h> <Left>
noremap! <A-j> <Down>
noremap! <A-k> <Up>
noremap! <A-l> <Right>


"===============================================================================
" => Command movement
"===============================================================================
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>


"===============================================================================
" => Folding
"===============================================================================
"nnoremap <C-k><ESC> zc
"nnoremap <C-k><C-]> zo
