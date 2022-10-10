let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

augroup qs_colors
	autocmd!
	autocmd ColorScheme * highlight QuickScopePrimary guifg='#ff4400' gui=bold ctermfg=155 cterm=underline
	autocmd ColorScheme * highlight QuickScopeSecondary guifg='#ff8800' gui=bold,italic ctermfg=81 cterm=underline
augroup END

