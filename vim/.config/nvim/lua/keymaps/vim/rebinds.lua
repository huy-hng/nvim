vim.cmd([[
"===============================================================================
" => Behavior Changes
"===============================================================================

nnoremap QQ Q
noremap Q q
nnoremap q <nop>


nnoremap <C-;> q:
noremap ; :
noremap : ;

nnoremap q: <NOP>
nnoremap q/ <NOP>
nnoremap <leader>; q:
nnoremap <leader>/ q/

" Remap VIM 0 to first non-blank character
noremap g0 g^
noremap g^ g0
noremap 0 ^
noremap ^ 0


nnoremap vv V
nnoremap V vg_
vnoremap V V

" vnoremap <C-c> "+y

" break undo sequence before pasting from register
inoremap <C-r> <C-g>u<C-r>
inoremap <C-v> <C-g>u<C-r>+
cnoremap <C-v> <C-r>+

" new line without leaving normal mode
"nnoremap <CR> o<ESC>
]])
