function! KeepColumn(action)
	let l:column = col('.')

	exec 'normal! ' . a:action

	let l:line = line('.')
	call cursor(line,column)
endfunction


"keep column position after paste
nnoremap p :call KeepColumn('p')<CR>
nnoremap P :call KeepColumn('P')<CR>

nnoremap <leader>p p
nnoremap <leader>P P
