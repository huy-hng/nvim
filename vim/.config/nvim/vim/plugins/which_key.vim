let g:which_key_vertical = 0
"let g:which_key_position = 'topleft'
let g:which_key_hspace = 5
let g:which_key_centered = 1

" which key
nnoremap <silent> <leader>      :<c-u>WhichKey ' '<CR>
vnoremap <silent> <leader> 		:<c-u>WhichKeyVisual ' '<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey '\'<CR>

let g:which_key_map['w '] = {
			\ 'name': 'Vimwiki',
			\ 'w': 'Daily Log Note',
			\ 'y': 'Yesterday Log Note',
			\ 't': 'Daily Log Tab',
			\ 'm': 'Tomorrow Log Note',
			\ 'i': 'Update Diary Index',
			\ }

let g:which_key_map.ww = 'Vimwiki Index'
let g:which_key_map.wi = 'Vimwiki Daily Log'
let g:which_key_map.ws = 'Vimwiki Select'
let g:which_key_map.wt = 'Vimwiki Index Tab'

call which_key#register('<Space>', "g:which_key_map")
call which_key#register('<Space>', "g:which_key_map", 'n')
call which_key#register('<Space>', "g:which_key_map_visual", 'v')
