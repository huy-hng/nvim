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


"nnoremap vv V
"nnoremap V v$

" ctrl+c to copy to clipboard
nnoremap <leader>P "+P
"nnoremap <leader>p "+p
nnoremap <leader>yy "+yy
vnoremap <leader>y "+y

" nnoremap <C-c> "+yy
vnoremap <C-c> "+y

" break undo sequence before pasting from register
inoremap <C-R> <C-G>u<C-R>
inoremap <C-v> <C-G>u<C-v>

" new line without leaving normal mode
"nnoremap <CR> o<ESC>


