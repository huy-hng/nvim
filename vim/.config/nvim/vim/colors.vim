" Enable syntax highlighting
syntax enable

set termguicolors " enables 24-bit RBG colors
set emoji " no clue what this does

"highlight ColorColumn ctermbg=grey guibg=grey
highlight Folded guibg=blue guifg=yellow
highlight FoldColumn guibg=blue guifg=yellow


lua << EOF
require("catppuccin").setup()
EOF


"===============================================================================
"                               |=> Themes <=|
"===============================================================================
" Brightest to darkest (default is storm)
let g:tokyo_themes = {
			\ '': 'tokyonight',
			\ 'day': 'tokyonight-day',
			\ 'storm': 'tokyonight-storm',
			\ 'moon': 'tokyonight-moon',
			\ 'night': 'tokyonight-night',
			\ }

let g:color_theme = g:tokyo_themes['day'] " bright af
let g:color_theme = g:tokyo_themes['storm'] " soothing
let g:color_theme = g:tokyo_themes['moon'] " high contrast
let g:color_theme = g:tokyo_themes['night'] " dark


let g:catppuccin_flavour = 'mocha'
colorscheme catppuccin


function! SetColors(theme=0)
	if (a:theme != 0)
		let g:color_theme = a:theme
	endif
	exec 'colorscheme ' .. g:color_theme
	highlight Folded guibg=none
endfunction


call SetColors()
