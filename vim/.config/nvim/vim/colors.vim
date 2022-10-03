" Enable syntax highlighting
syntax enable

set termguicolors " enables 24-bit RBG colors
set emoji " no clue what this does


"highlight ColorColumn ctermbg=grey guibg=grey
highlight Folded guibg=blue guifg=yellow
highlight FoldColumn guibg=blue guifg=yellow

"""""""""""""""
"""" setup """"
"""""""""""""""

lua << EOF
require("catppuccin").setup()
EOF



""""""""""""""""
"""" themes """"
""""""""""""""""

"let g:theme = 'tgruvbox'
"let g:theme = 'tTomorrow-Night-Eighties'
"let g:theme = 'tTomorrow-Night'

colorscheme tokyonight
colorscheme tokyonight-day
colorscheme tokyonight-moon
colorscheme tokyonight-storm

let g:catppuccin_flavour = 'mocha'
colorscheme catppuccin


function! SetColors()
	colorscheme tokyonight-night
	highlight Folded guibg=none
endfunction


call SetColors()
