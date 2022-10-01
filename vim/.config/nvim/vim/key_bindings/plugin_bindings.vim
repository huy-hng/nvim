
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

nnoremap <C-p> <cmd>Telescope find_files<CR>
