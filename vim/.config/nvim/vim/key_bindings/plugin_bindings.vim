
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




"===============================================================================
" => Telescope
"===============================================================================

nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <Localleader>p <cmd>Telescope find_files<CR>
nnoremap <Localleader>k <cmd>Telescope keymaps<CR>
nnoremap <Localleader>b <cmd>Telescope buffers<CR>
nnoremap <Localleader>g <cmd>Telescope grep_string<CR>
nnoremap <Localleader>l <cmd>Telescope live_grep<CR>
nnoremap <Localleader>h <cmd>Telescope help_tags<CR>
nnoremap <leader><leader> <cmd>Telescope<CR>
