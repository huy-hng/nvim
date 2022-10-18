let win_width = nvim_win_get_width(0)
let g:startify_padding_left = (win_width) / 3
" let g:startify_padding_left = (win_width - 40) / 2
if (win_width < 140)
	let g:startify_padding_left = (win_width - 80) / 2
endif


" start indices at 1 instead of 0
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')

" looks
let g:startify_enable_special = 1 " Show <empty buffer> and <quit>
let g:startify_fortune_use_unicode = 1
let g:startify_files_number        = 8

" behavior
let g:startify_change_to_vcs_root = 1
let g:startify_update_oldfiles = 1
let g:startify_change_to_dir = 1
" let g:startify_change_cmd = 'tcd'

" session
let g:startify_session_autoload = 1 " autoload Session.vim
let g:startify_session_persistence = 1
let g:startify_session_sort = 1



function! s:list_commits()
	let git = 'git -C $(pwd)'
	let commits = systemlist(git .' log --oneline | head -n10')
	let git = 'G'. git[1:]
	return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

fun s:pad(text)
	let l:res = startify#pad([a:text])
	return l:res[0]
endfun

fun s:center(text)
	let l:res = startify#center([a:text])
	return l:res[0]
endfun


fun! s:sep(...)
	" let l:separator = startify#center(['=============='])
	" let l:centered = startify#center(a:000)

	let l:separator = startify#pad(['============='])
	let l:centered = startify#pad(a:000)
	
	return l:centered
	" return [''] + l:centered
	" return l:separator + l:centered
	" return l:separator + l:centered + l:separator
endfun

" types: files, dir, bookmarks, sessions, commands
" let s:bookmarks = { 'type': 'bookmarks', 'header': startify#pad(['Bookmarks'])}
" let s:sessions = { 'type': 'sessions', 'header': startify#pad(['Sessions'])}
let s:commits = { 'type': function('s:list_commits'), 'header': s:sep('Commits')}

let g:startify_lists = [
	\ { 'type': 'sessions',		'header': s:sep('Sessions') },
	\ { 'type': 'bookmarks',	'header': s:sep('Bookmarks') },
	\ { 'type': 'commands',		'header': s:sep('Commands') },
	\ { 'type': 'dir',			'header': s:sep('CWD') },
	\ { 'type': 'files',		'header': s:sep('Files')},
	\ s:commits,
	\ ]

let s:dotfiles = '$HOME/.dotfiles/'
			" \ s:dotfiles..'vim/.config/nvim/init.lua',
let g:startify_bookmarks = [
			\ '$HOME/.dotfiles/vim/.config/nvim/init.lua',
			\ s:dotfiles..'zsh/.config/zsh',
			\ ]
			" \ {'c': ''},

let g:startify_commands = [
	\ {'w': ['Vimwiki', 'Goyo | VimwikiIndex']},
	\ {'d': ['Daily Log', 'Goyo | VimwikiMakeDiaryNote']},
	\ {'h': ['Vim Reference', 'h ref']},
	\ ]
	" \ {'m': ['My magical function', 'call Magic()']},


" function! StartifyEntryFormat()
	" return 'startify#center([entry_path])[0]'
" endfunction
" function! StartifyEntryFormat()
" 	return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
" endfunction

let s:bg_color = synIDattr(hlID("Normal"), "bg")

let s:text = s:center('drink some water dude')
let s:text = s:pad(systemlist('pwd')[0])
autocmd User StartifyReady let &l:stl = ''

" hi StartifyBracket ctermfg=240
" hi StartifyFile    ctermfg=147
" hi StartifyFooter  ctermfg=240
" hi StartifyHeader  ctermfg=114
" hi StartifyNumber  ctermfg=215
" hi StartifyPath    ctermfg=245
" hi StartifySlash   ctermfg=240
" hi StartifySpecial ctermfg=240
