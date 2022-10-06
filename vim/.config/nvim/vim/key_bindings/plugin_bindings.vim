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

nnoremap <F5> :UndotreeToggle<CR>


" nnoremap <F1> <cmd>NERDTreeToggle<CR>

"===============================================================================
"                               |=> Ranger <=|
"===============================================================================
nnoremap <C-e> <cmd>RnvimrToggle<CR>
tnoremap <silent> <C-e> <C-\><C-n>:RnvimrToggle<CR>
tnoremap <silent> <C-w> <C-\><C-n>:RnvimrResize<CR>
tnoremap <silent> <A-1> <C-\><C-n>:Rn':<Plug>VimwikiMakeDiaryNote', vimrResize 1<CR>
tnoremap <silent> <A-2> <C-\><C-n>:RnvimrResize 2<CR>
tnoremap <silent> <A-3> <C-\><C-n>:RnvimrResize 3<CR>


"===============================================================================
"                               => Telescope <=
"===============================================================================
nnoremap <C-p> <cmd>Telescope find_files<CR>


nnoremap <leader>ff <cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>
nnoremap <leader>fa <cmd>lua require('harpoon.mark').add_file()<CR>

nnoremap <C-1> <cmd>lua require('harpoon.ui').nav_file(1)<CR>
nnoremap <C-2> <cmd>lua require('harpoon.ui').nav_file(2)<CR>
nnoremap <C-3> <cmd>lua require('harpoon.ui').nav_file(3)<CR>
nnoremap <C-4> <cmd>lua require('harpoon.ui').nav_file(4)<CR>
nnoremap <C-5> <cmd>lua require('harpoon.ui').nav_file(5)<CR>
nnoremap <C-^> <cmd>lua require('harpoon.ui').nav_file(6)<CR>
nnoremap <C-7> <cmd>lua require('harpoon.ui').nav_file(7)<CR>
nnoremap <C-8> <cmd>lua require('harpoon.ui').nav_file(8)<CR>
nnoremap <C-9> <cmd>lua require('harpoon.ui').nav_file(9)<CR>
nnoremap <C-0> <cmd>lua require("harpoon.term").gotoTerminal(1)<CR>

