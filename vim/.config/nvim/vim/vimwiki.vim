" required settings
set nocompatible
filetype plugin on
"syntax on

set concealcursor=nc
nnoremap 

let g:vimwiki_conceal_pre=1
let g:vimwiki_hl_headers=0
let g:vimwiki_create_link=0
let g:vimwiki_folding='expr:quick'
let g:vimwiki_filetypes=['markdown']
let wiki = {}
let wiki.path = '~/personal/vimwiki' 
let wiki.html_path = '~/personal/vimwiki/html/'
let wiki.nested_syntaxes = {'python': 'python', 'bash': 'bash'}
let wiki.maxhi = 1
let g:vimwiki_list = [wiki]

