local g = vim.g

local win_width = vim.api.nvim_win_get_width(0)
g.startify_padding_left = math.floor(win_width / 3)
-- local g.startify_padding_left = (win_width - 40) / 2
if win_width < 140 then g.startify_padding_left = math.floor((win_width - 80) / 2) end

-- start indices at 1 instead of 0
g.startify_custom_indices = vim.fn.map(vim.fn.range(1, 100), 'string(v:val)')

-- looks
g.startify_enable_special = 1 -- Show <empty buffer> and <quit>
g.startify_fortune_use_unicode = 1
g.startify_files_number = 8

-- behavior
g.startify_change_to_vcs_root = 1
g.startify_update_oldfiles = 1
g.startify_change_to_dir = 1
-- g.startify_change_cmd = 'tcd'

-- session
g.startify_session_autoload = 1 -- autoload Session.vim
g.startify_session_persistence = 1
g.startify_session_sort = 1

vim.cmd([[

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

let s:bg_color = synIDattr(hlID("Normal"), "bg")

let s:text = s:center('drink some water dude')
let s:text = s:pad(systemlist('pwd')[0])
" autocmd User StartifyReady let &l:stl = ''
]])
