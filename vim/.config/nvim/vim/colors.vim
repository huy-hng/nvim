"===============================================================================
"                             |=> Highlights <=|
"===============================================================================
" hi! RayNormal  cterm=bold gui=bold guifg=#15161e guibg=#7aa2f7
" hi! RayInsert  cterm=bold gui=bold guifg=#15161e guibg=#9ece6a
" hi! RayVisual  cterm=bold gui=bold guifg=#15161e guibg=#bb9af7
" hi! RayCommand cterm=bold gui=bold guifg=#15161e guibg=#e0af68
" hi! RayReplace cterm=bold gui=bold guifg=#15161e guibg=#f7768e
" hi! RayOther   cterm=bold gui=bold guifg=#15161e guibg=#1abc9c

" hi! RayInactive					  guifg=#7aa2f7 guibg=#16161e
" hi! RayFilename					  guifg=#a9b1d6 guibg=#3b4261


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

let g:color_theme = g:tokyo_themes['storm'] " soothing
let g:color_theme = g:tokyo_themes['day'] " bright af
let g:color_theme = g:tokyo_themes['night'] " dark
let g:color_theme = g:tokyo_themes['moon'] " high contrast


let g:catppuccin_flavour = 'mocha'
let g:color_theme = 'catppuccin'


function! SetColors(theme=0)
	if (a:theme != 0)
		let g:color_theme = a:theme
	endif
	exec 'colorscheme ' .. g:color_theme
	highlight Folded guibg=none
endfunction


call SetColors()
