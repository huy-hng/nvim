" Comments
inoremap <C-_> <cmd>Commentary<CR>
nnoremap <C-_> <cmd>Commentary<CR>
vnoremap <silent> <C-_> :Commentary<CR>
" vnoremap <C-_> <cmd>'<,'>Commentary<CR>


" Vimwiki
nnoremap <silent><Leader><CR> :call Create_Vimwiki_Link()<CR>
nmap <silent><C-S-Tab> <Plug>VimwikiPrevLink
nmap <silent><C-Tab> <Plug>VimwikiNextLink
" doesnt work
nmap <silent><F6> :call ToggleTableFormatting()<CR>



" Goyo
nnoremap <silent><leader>z <cmd>Goyo<CR>
nnoremap <silent><leader>Z <cmd>Zen<CR>

" Limelight
nnoremap <silent><leader>? <cmd>Limelight!!<CR>

nnoremap <F5> :UndotreeToggle<CR>


" nnoremap <F1> <cmd>NERDTreeToggle<CR>

"===============================================================================
"                               |=> Ranger <=|
"===============================================================================
nnoremap <C-e> <cmd>RnvimrToggle<CR>
tnoremap <silent> <C-e> <C-\><C-n>:RnvimrToggle<CR>
tnoremap <silent> <C-w> <C-\><C-n>:RnvimrResize<CR>
tnoremap <silent> <A-1> <C-\><C-n>:RnvimrResize 1<CR>
tnoremap <silent> <A-2> <C-\><C-n>:RnvimrResize 2<CR>
tnoremap <silent> <A-3> <C-\><C-n>:RnvimrResize 3<CR>


"===============================================================================
"                               => Telescope <=
"===============================================================================
nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <Localleader>k <cmd>Telescope keymaps<CR>
nnoremap <Localleader>b <cmd>Telescope buffers<CR>
nnoremap <Localleader>g <cmd>Telescope grep_string<CR>
nnoremap <Localleader>l <cmd>Telescope live_grep<CR>
nnoremap <Localleader>h <cmd>Telescope help_tags<CR>
nnoremap <Localleader><Localleader> <cmd>Telescope<CR>

