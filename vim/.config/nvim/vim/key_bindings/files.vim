"===============================================================================
" => File Manipulation
"===============================================================================

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" fast saving and quitting
nnoremap <silent><Leader>w <cmd>w<CR>
nnoremap <silent><Leader>W <cmd>W<CR>
nnoremap <silent><Leader>Q <cmd>q!<CR>
nnoremap <silent><Leader>wq <cmd>wq<CR>
nnoremap <silent><Leader>q <cmd>call <SID>quit_one_buffer()<CR>

" make file executable
nnoremap <leader>x <cmd>w<bar> :!chmod u+x %
" execute file
nnoremap <A-m> <cmd>w<bar> :!clear<bar> :! %:p<CR>

function! s:quit_one_buffer()
	if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
		quit
	else
		call Message('More than one buffer opened!')
	endif
endfunction
