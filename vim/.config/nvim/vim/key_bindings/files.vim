"===============================================================================
" => File Manipulation
"===============================================================================

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" fast saving and quitting
nnoremap <Leader>w <cmd>w<CR>
nnoremap <Leader>W <cmd>W<CR>
nnoremap <Leader>Q <cmd>q!<CR>
nnoremap <Leader>wq <cmd>wq<CR>
nnoremap <Leader>q <cmd>q<CR>
" nnoremap <Leader>q <cmd>call <SID>quit_one_buffer()<CR>

" make file executable
nnoremap <leader>x <cmd>w<bar> :!chmod u+x %<CR>:0r !echo '\#\!/usr/bin/bash'<CR>
" execute file
"nnoremap <A-m> :w<CR>:!clear<CR>:! %:p<CR>
"nnoremap <A-m> <cmd>w<CR><cmd> !clear <CR><cmd> ! %:p<CR>
"nnoremap <A-m> :w <bar> !clear <bar> ! %:p<CR>
nnoremap <A-m> <cmd>w <bar> ! %:p<CR>

function! s:quit_one_buffer()
	if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
		quit
	else
		call Message('More than one buffer opened!')
	endif
endfunction
