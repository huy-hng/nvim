"===============================================================================
"                                 |=> GUI <=|
"===============================================================================


" add time to statusline
fun! NeovideStatusline()
	return MyStatusline() .. "| %{strftime('%H:%M')} "
endfun

set statusline=%!NeovideStatusline()

"---------------------------------------
"             -> Looks <-
"---------------------------------------
let g:neovide_fullscreen = v:true

let g:neovide_transparency = 1
let g:neovide_floating_blur_amount_x = 6.0
let g:neovide_floating_blur_amount_y = 6.0
" let g:transparency = 1
" let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))


" let g:gui_font_face = 'Fira Code Retina'
let g:gui_font_face = 'FiraCode Nerd Font'

"---------------------------------------
"           -> Behavior <-
"---------------------------------------
let g:neovide_refresh_rate = 50
let g:neovide_refresh_rate_idle = 15
let g:neovide_confirm_quit = v:true
let g:neovide_remember_window_size = v:true
let g:neovide_scroll_animation_length = 0.4
let g:neovide_hide_mouse_when_typing = v:true

let g:neovide_touch_deadzone=100
let g:neovide_touch_drag_timeout=0.3


"---------------------------------------
"             -> Sizes <-
"---------------------------------------
let g:neovide_underline_automatic_scaling = v:true
let g:gui_font_default_size = 12
let g:gui_font_size = g:gui_font_default_size


"---------------------------------------
"            -> Cursor <-
"---------------------------------------
" let g:neovide_cursor_animation_length = 0
" let g:neovide_cursor_trail_size = 0
let g:neovide_cursor_animation_length = 0.02 " 0.13
let g:neovide_cursor_trail_size = 0.2 " 0.8
let g:neovide_cursor_antialiasing = v:false
" let g:neovide_cursor_antialiasing=v:true

" let g:neovide_cursor_vfx_mode = "pixiedust"
let g:neovide_cursor_vfx_mode = ""
let g:neovide_cursor_vfx_opacity=150.0
let g:neovide_cursor_vfx_particle_lifetime=0.5
let g:neovide_cursor_vfx_particle_density=5.0
let g:neovide_cursor_vfx_particle_speed=50.0


"===============================================================================
"                               |=> Keymaps <=|
"===============================================================================
nnoremap <leader>q <cmd>Bdelete<cr>

inoremap <C-/> <cmd>Commentary<cr>
nnoremap <C-/> <cmd>Commentary<cr>
vnoremap <silent> <C-/> :Commentary<cr>


" unmap! <C-h>
noremap! <C-h> <Left>
noremap! <C-j> <Down>
noremap! <C-k> <Up>
noremap! <C-l> <Right>

noremap! <C-BS> <C-w>

" nnoremap <C-S-Tab> <<
nnoremap <Tab> >>

" inoremap <C-v> <C-r>+
" nnoremap <C-v> "+p

nnoremap <C-CR> o<esc>
nnoremap <C-Space> o<ESC>
nnoremap <C-F12> o<ESC>
nnoremap <S-F11> o<ESC>

nnoremap <C-;> q:
" nnoremap <C-/> q/

nnoremap <C-_> <NOP>
nnoremap <C-_> <cmd>lua ResizeGuiFont(-1)<cr>
nnoremap <C-+> <cmd>lua ResizeGuiFont(1)<cr>
nnoremap <C-)> <cmd>lua ResetGuiFont()<cr>
" nnoremap <C-=> <NOP>
" nnoremap <C--> <NOP>
" nnoremap <C-+> <NOP>


