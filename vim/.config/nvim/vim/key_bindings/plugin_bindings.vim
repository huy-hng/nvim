" Comments
inoremap <C-_> <cmd>Commentary<CR>
nnoremap <C-_> <cmd>Commentary<CR>
vnoremap <silent> <C-_> :Commentary<CR>
" vnoremap <C-_> <cmd>'<,'>Commentary<CR>

inoremap <C-/> <cmd>Commentary<CR>
nnoremap <C-/> <cmd>Commentary<CR>
vnoremap <silent> <C-/> :Commentary<CR>

" Vimwiki
" nnoremap <silent><Leader><CR> :call Create_Vimwiki_Link()<CR>
vnoremap <silent>+ :call Create_Vimwiki_Link()<CR>
nmap <silent><C-S-Tab> <Plug>VimwikiPrevLink
nmap <silent><C-Tab> <Plug>VimwikiNextLink
" doesnt work
nmap <silent><F6> :call ToggleTableFormatting()<CR>

" Limelight
" nnoremap <silent><leader>? <cmd>Limelight!!<CR>
nnoremap <silent><leader>z <cmd>Goyo<CR>
nnoremap <silent><leader>Z <cmd>Zen<CR>

nnoremap <F5> <cmd>UndotreeToggle<CR>

"===============================================================================
"                               |=> Ranger <=|
"===============================================================================
nnoremap <A-e> <cmd>RnvimrToggle<CR>
tnoremap <silent> <C-e> <C-\><C-n>:RnvimrToggle<CR>
tnoremap <silent> <C-w> <C-\><C-n>:RnvimrResize<CR>
tnoremap <silent> <A-1> <C-\><C-n>:RnvimrResize 1<CR>
tnoremap <silent> <A-2> <C-\><C-n>:RnvimrResize 2<CR>
tnoremap <silent> <A-3> <C-\><C-n>:RnvimrResize 3<CR>
