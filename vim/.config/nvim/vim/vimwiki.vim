" required settings
set nocompatible
filetype plugin on
"syntax on

set concealcursor=nc

" TODO do everything in one line for extra niceness
function! Toggle_Conceal()
	let &concealcursor = &concealcursor == 'c' ? 'nc' : 'c'
endfunction
nnoremap <silent><F4> :call Toggle_Conceal()<CR>

let g:vimwiki_conceal_pre=1
let g:vimwiki_hl_headers=0
let g:vimwiki_create_link=0
let g:vimwiki_folding='expr:quick'
let g:vimwiki_filetypes=['markdown']
let g:vimwiki_ext2syntax={'.md': 'markdown', '.mkd': 'markdown'}
let wiki = {}
let wiki.path = '~/personal/vimwiki' 
let wiki.html_path = '~/personal/vimwiki/html/'
let wiki.nested_syntaxes = {'python': 'python', 'bash': 'bash'}
let wiki.maxhi = 1
let g:vimwiki_list = [wiki]

