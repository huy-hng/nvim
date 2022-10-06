"===============================================================================
"                                 |=> GUI <=|
"===============================================================================
let g:neovide_refresh_rate_idle = 5
let g:neovide_fullscreen = v:true
let g:neovide_transparency = 1.0
let g:transparency = 0.9
let g:neovide_remember_window_size = v:true
let g:neovide_floating_blur_amount_x = 20.0
let g:neovide_floating_blur_amount_y = 20.0
let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))


let g:neovide_confirm_quit = v:true
let g:neovide_cursor_animation_length  =  0
let g:neovide_underline_automatic_scaling  =  v:true
let g:gui_font_default_size = 12
let g:gui_font_size = g:gui_font_default_size
let g:gui_font_face = 'Fira Code'
" let g:gui_font_face = 'Cascadia Code'



"===============================================================================
"                               |=> Keymaps <=|
"===============================================================================
inoremap <C-/> <cmd>Commentary<CR>
nnoremap <C-/> <cmd>Commentary<CR>
vnoremap <silent> <C-/> :Commentary<CR>

noremap! <C-BS> <C-w>

" nnoremap <C-S-Tab> <<
nnoremap <Tab> >>

inoremap <C-v> <C-r>+
nnoremap <C-v> "+p

nnoremap <C-CR> o<esc>
nnoremap <C-Space> o<ESC>
nnoremap <C-F12> o<ESC>
nnoremap <S-F11> o<ESC>

nnoremap <C-;> q:
" nnoremap <C-/> q/

