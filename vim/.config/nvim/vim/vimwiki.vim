" required settings
set nocompatible
filetype plugin on
"syntax on

set concealcursor=nc

let g:vimwiki_conceal_pre = 1
let g:vimwiki_hl_headers = 0
let g:vimwiki_create_link = 0
let g:vimwiki_folding = 'list:quick'
let g:vimwiki_dir_link = 'main'
"let g:vimwiki_filetypes = ['markdown']
"let g:vimwiki_ext2syntax = {'.md': 'markdown', '.mkd': 'markdown'}

" individual wiki config
let wiki = {}
let wiki.path = '~/personal/vimwiki' 
let wiki.html_path = '~/personal/vimwiki/html/'
let wiki.nested_syntaxes = {'python': 'python', 'bash': 'bash'}
let wiki.maxhi = 1
let g:vimwiki_list = [wiki]

