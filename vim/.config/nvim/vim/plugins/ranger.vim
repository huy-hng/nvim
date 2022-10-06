" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_ex = 1
let g:rnvimr_enable_picker = 1
let g:rnvimr_draw_border = 0
let g:rnvimr_border_attr = {'fg': 1, 'bg': -1}
let g:rnvimr_shadow_winblend = 50
" let g:rnvimr_ranger_cmd = ['ranger', '--cmd=set draw_borders both']
" highlight link RnvimrNormal CursorLine
"
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-_>': 'NvimEdit split',
            \ '<C-|>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }

let g:rnvimr_ranger_views = [
            \ {'minwidth': 90, 'ratio': []},
            \ {'minwidth': 50, 'maxwidth': 89, 'ratio': [1,1]},
            \ {'maxwidth': 49, 'ratio': [1]}
            \ ]

" Initial layout
let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.7 * &columns)),
            \ 'height': float2nr(round(0.7 * &lines)),
            \ 'col': float2nr(round(0.15 * &columns)),
            \ 'row': float2nr(round(0.15 * &lines)),
            \ 'style': 'minimal'
            \ }

let g:rnvimr_presets = [
            \ {},
            \ {'width': 30, 'height': 1.0, 'col': 0, 'row': 0},
            \ {'width': 30, 'height': 1.0, 'col': 1.0, 'row': 0},
            \ {'width': 1.0, 'height': 0.5, 'col': 0, 'row': 0.5},
            \ {'width': 1.0, 'height': 1.0},
            \ ]
