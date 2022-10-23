"===============================================================================
" => File Manipulation
"===============================================================================

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" fast saving and quitting
nnoremap <Leader>w <cmd>w<CR>
nnoremap <Leader><leader>w <cmd>call fn#save_and_load()<CR>
nnoremap <Leader>W <cmd>W<CR>
nnoremap <Leader>wq <cmd>wq<CR>
nnoremap <Leader>q <cmd>call <SID>quit_last_buffer()<cr>
nnoremap <Leader>Q <cmd>q<cr>
" nnoremap <Leader>Q <cmd>call <SID>quit_one_buffer()<CR>

" make file executable
nnoremap <leader>x <cmd>w<bar> :!chmod u+x %<CR>:0r !echo '\#\!/usr/bin/bash'<CR>


nnoremap <Leader>rv <cmd>so %<cr>
" execute file
"nnoremap <A-m> :w<CR>:!clear<CR>:! %:p<CR>
"nnoremap <A-m> <cmd>w<CR><cmd> !clear <CR><cmd> ! %:p<CR>
"nnoremap <A-m> :w <bar> !clear <bar> ! %:p<CR>
nnoremap <A-m> <cmd>w <bar> ! %:p<CR>


fun! s:quit_last_buffer()
	if BuffersOpened() == 1
		quit
	endif
	Bdelete
endfun


function! s:quit_one_buffer()
	" if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
	if winnr('$') < 2
		quit
	else
		if (get(g:, 'quit_next', 0))
			let g:quit_next = 0
			quit
		else
			let g:quit_next = 1
			call Message('More than one buffer opened!')
			call Message('Press again to quit.')
		endif
	endif
endfunction


fun! BuffersOpened()
	return len(getbufinfo({'buflisted':1}))
	" return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfun
command! BuffersOpened echo BuffersOpened()


function! GetActiveBuffers()
    let l:blist = getbufinfo({'bufloaded': 1})
    " let l:blist = getbufinfo({'bufloaded': 1, 'buflisted': 1})
    let l:result = []
    for l:item in l:blist
		echo l:item.name
        "skip unnamed buffers; also skip hidden buffers?
        if empty(l:item.name) || l:item.hidden
            continue
        endif
        " call add(l:result, shellescape(l:item.name))
    endfor
    " return l:result
endfunction

" the result is a list
" use join() when a single string is needed
":exec '!cat' join(GetActiveBuffers())
