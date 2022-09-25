" required settings
set nocompatible
filetype plugin on
"syntax on

set concealcursor=nc

"let g:vimwiki_listsyms = '✗○◐●✓' " fancier todo checkmarks
"let g:vimwiki_listsyms = ' ○◐●✓' " fancier todo checkmarks
let g:vimwiki_conceal_pre = 1
let g:vimwiki_table_auto_fmt = 0
let g:vimwiki_hl_headers = 0
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_create_link = 0
let g:vimwiki_folding = 'list:quick'
let g:vimwiki_dir_link = 'main'
let g:vimwiki_filetypes = ['markdown']
"let g:vimwiki_ext2syntax = {'.md': 'markdown'}

" individual wiki config
function! Create_wiki(name)
	let wiki = {}
	let wiki.path = '$HOME/personal/vimwiki/' .. a:name
	let wiki.name = a:name
	let wiki.ext = '.md'
	let wiki.auto_toc = 0
	let wiki.maxhi = 0 " highlight empty pages
	return wiki
endfunction

let main = Create_wiki('Main')
let todo = Create_wiki('Todo')
let projects = Create_wiki('Projects')
let cheatsheets = Create_wiki('Cheatsheets')
let cheatsheets.nested_syntaxes = {'python': 'python', 'bash': 'bash', 'tmux': 'tmux'}
let misc = Create_wiki('Misc')


let g:vimwiki_list = [main, todo, projects, cheatsheets, misc]
