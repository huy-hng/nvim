augroup VimwikiGroup
	autocmd!
	autocmd FileType vimwiki setlocal foldexpr=nvim_treesitter#foldexpr()
	autocmd Filetype vimwiki TSBufDisable highlight
augroup END

set concealcursor=nc

"let g:vimwiki_ext2syntax = {'.md': 'markdown'}
"let g:vimwiki_listsyms = ' ○◐●✓' " fancier todo checkmarks
"let g:vimwiki_listsyms = '✗○◐●✓' " fancier todo checkmarks
let g:vimwiki_auto_header = 0
let g:vimwiki_conceal_pre = 1
let g:vimwiki_create_link = 0
let g:vimwiki_diary_caption_level = 2
let g:vimwiki_diary_header = 'Daily Log'
let g:vimwiki_diary_index = 'daily_log'
let g:vimwiki_diary_rel_path = 'daily_log/'
let g:vimwiki_dir_link = 'main'
let g:vimwiki_filetypes = []
" let g:vimwiki_filetypes = ['markdown']
" let g:vimwiki_folding = 'list:quick'
let g:vimwiki_folding = 'custom'
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_hl_headers = 0
let g:vimwiki_table_auto_fmt = 0
let g:vimwiki_toc_header_level = 2

let g:vimwiki_key_mappings = {
	\ 'all_maps': 1,
	\ 'global': 1,
	\ 'headers': 1,
	\ 'text_objs': 1,
	\ 'table_format': 1,
	\ 'table_mappings': 0,
	\ 'lists': 1,
	\ 'links': 1,
	\ 'html': 1,
	\ 'mouse': 1,
\ }


" see https://github.com/vimwiki/vimwiki/pull/1221
"let g:vimwiki_tag_format = {
"	\ 'pre_mark': '[''"]\?#\( \|#\)\@!',
"	\ 'sep': '>><<',
"	\ 'post_mark': '[''" ]\?\|$'
"\ }

" individual wiki config
function! Create_wiki(name)
	let wiki = {}
	let wiki.auto_diary_index = 1
	let wiki.auto_toc = 0
	let wiki.ext = '.md'
	" let wiki.syntax = 'markdown'
	let wiki.maxhi = 0 " highlight empty pages
	let wiki.name = a:name
	let wiki.path = '$HOME/personal/vimwiki/' .. a:name
	let wiki.nested_syntaxes = {
				\ 'python': 'python',
				\ 'bash': 'bash',
				\ 'tmux': 'tmux',
				\ 'vim': 'vim',
				\ 'lua': 'lua'
				\ }
	return wiki
endfunction

let main = Create_wiki('Main')
let todo = Create_wiki('Todo')
let projects = Create_wiki('Projects')
let cheatsheets = Create_wiki('Cheatsheets')
let misc = Create_wiki('Misc')


let g:vimwiki_list = [main, todo, projects, cheatsheets, misc]

