vim.cmd([[
" Vimwiki
function! Update_Vimwiki(create)
	let g:vimwiki_create_link=a:create
	call vimwiki#vars#init()
endfunction

function! Create_Vimwiki_Link()
	:call Update_Vimwiki(1)
	:exe "normal \<CR>"
	:call Update_Vimwiki(0)
endfunction

function! ToggleTableFormatting()
	let g:vimwiki_table_auto_fmt=!g:vimwiki_table_auto_fmt
	call Message('Vimwiki Table Format: ' .. g:vimwiki_table_auto_fmt)
	call vimwiki#vars#init()
endfunction

vnoremap <cmd>call Create_Vimwiki_Link()<CR>
" nmap <silent><C-S-Tab> <Plug>VimwikiPrevLink
" nmap <silent><C-Tab> <Plug>VimwikiNextLink
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
]])
