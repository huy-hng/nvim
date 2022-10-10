let g:lightline = {}
let g:lightline.colorscheme = 'tokyonight'
let g:lightline.active = {}
let g:lightline.active.left = [ [ 'mode', 'paste' ],
	\             [ 'readonly', 'filename', 'gitbranch', 'gitgutter' ] ]

let g:lightline.component_function = {
	\	'gitgutter': 'GitStatus',
	\	'gitbranch': 'CurrentBranch',
	\	'filename': 'LightlineFilename',
	\ }

"let g:lightline.mode_map = {
"	\ 'n' : 'Norm',
"	\ 'i' : 'Ins',
"	\ 'R' : 'Repl',
"	\ 'v' : 'Vis',
"	\ 'V' : 'VLine',
"	\ "\<C-v>": 'VBlock',
"	\ 'c' : 'Com',
"	\ 's' : 'S',
"	\ 'S' : 'SL',
"	\ "\<C-s>": 'SB',
"	\ 't': 'T',
"	\ }

function! LightlineFilename()
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
	let modified = &modified ? ' +' : ''
	return filename . modified
endfunction

function! CurrentBranch()
	try
		let branch = fugitive#Head()
	catch
		return ''
	endtry

	return ' ' .. branch
endfunction

function! GitStatus()
	try
		let [a,m,r] = GitGutterGetHunkSummary()
	catch
		return ''
	endtry

	return printf('+%d ~%d -%d', a, m, r)
endfunction
"set statusline+=%{GitStatus()}
