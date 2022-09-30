
"[width][Xoffset][x[height][Yoffset]]

let g:goyo_width = 100
let g:goyo_height = '100%-20%'
let g:goyo_linenr = 1

function! s:goyo_enter()
	colorscheme tokyonight-night
	if executable('tmux') && strlen($TMUX)
		silent !tmux set status off
		silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
	endif
	set noshowmode
	set noshowcmd
	set scrolloff=999
	Limelight
endfunction

function! s:goyo_leave()
	colorscheme tokyonight-night
	if executable('tmux') && strlen($TMUX)
		silent !tmux set status on
		silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
	endif
	set showmode
	set showcmd
	set scrolloff=5
	Limelight!
	" ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
