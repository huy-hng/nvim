vim.cmd([[
"===============================================================================
" => Text Movement
"===============================================================================

" horizontal scrolling
nnoremap <A-h> 10zh
nnoremap <A-l> 10zl
" nnoremap <A-H> zH
" nnoremap <A-L> zL

" nnoremap <C-d> <C-d>zz<cmd>call FlashOnce()<CR>
" nnoremap <C-u> <C-u>zz<cmd>call FlashOnce()<CR>

" causes weird behavior in neovide >10.0.1
" nnoremap <C-d> <C-d>zz
" nnoremap <C-u> <C-u>zz

" nnoremap <CR> g_
" vnoremap <CR> g_

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
]])
