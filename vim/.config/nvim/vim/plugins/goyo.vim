function! s:zen_enter()
	Goyo!

	let g:zen = 1

	let g:goyo_linenr = 0
	call LineNumbers(0)
	doautocmd line_numbers

	Limelight
	" set nocursorline

	nnoremap j jzz
	nnoremap k kzz

	if executable('tmux') && strlen($TMUX)
		"silent !tmux set status off
		silent !$TMUX_SCRIPTS_PATH/fullscreen go_in
		"silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
	endif

	call <SID>goyo_enter(0)
	"Goyo

endfunction


function! s:zen_leave()
	Goyo

	let g:zen = 0
	Limelight!
	if executable('tmux') && strlen($TMUX)
		"silent !tmux set status on
		silent !$TMUX_SCRIPTS_PATH/fullscreen get_out
		"silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
	endif

	let g:goyo_linenr = 1

	Goyo
endfunction


function! s:goyo_enter(size=1)
	call SetColors()
	if (a:size == 0)
		Goyo 80+5%x85%+100%
	else
		Goyo 80+5%x100%+100%
	endif


	set noshowcmd

	" auto quit
	"autocmd QuitPre <buffer> qa

	let b:quitting = 0
	let b:quitting_bang = 0
	autocmd QuitPre <buffer> let b:quitting = 1
	cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!

	let g:last_buffer = bufnr('%')

	augroup GoyoBuffChange
		autocmd BufLeave * : let g:last_buffer = bufnr('%')
	augroup END

endfunction


function! s:goyo_leave()
	call SetColors()
	call LineNumbers()

	" set cursorline
	set showcmd

	nnoremap j j
	nnoremap k k

	if (get(g:, 'zen', 0))
		call <SID>zen_leave()
	endif

	" Quit Vim if this is the only remaining buffer
	if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
		if b:quitting_bang
			qa!
		else
			qa
		endif
	endif

	"autocmd! GoyoBuffChange
"	exec 'b ' .. g:last_buffer
endfunction


function! s:zen()
	if (get(g:, 'zen', 0))
		call <SID>zen_leave()
	else
		call <SID>zen_enter()
	endif
endfunction


"[width][Xoffset][x[height][Yoffset]]

let g:goyo_width = 80
let g:goyo_height = '100%'
let g:goyo_linenr = 1

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"command! -bang Zen call <SID>zen(<bang>1)
command! Zen call <SID>zen()
