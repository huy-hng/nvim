vim.cmd([[

nnoremap <SPACE> <NOP>
let g:mapleader=' '
let g:maplocalleader='\'

noremap! <C-h> <C-w>

" make file executable
nnoremap <leader>x <cmd>w<bar> :!chmod u+x %<CR>:0r !echo '\#\!/usr/bin/bash'<CR>

]])
