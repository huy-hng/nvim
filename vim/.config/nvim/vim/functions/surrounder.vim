fun! s:move_selection(len)
	let l:len = a:len - 1
	if (l:len == 0)
		let l:len = ''
		exec 'normal! gvlol'
	else
		exec 'normal! gv' .. l:len 'lo' .. l:len 'l'
	endif
endfun

fun! Surrounder(...)
	let l:char1 = a:1
	if (a:0 > 1)
		let l:char2 = a:2
	else
		let l:char2 = a:1
	endif
	exec "normal! `>a" .. l:char2 .. "\<esc>`<i" .. l:char1
	call <SID>move_selection(strlen(a:1))
endfun


vnoremap ' :call Surrounder("'")<CR>
vnoremap " :call Surrounder('"')<CR>
vnoremap * :call Surrounder('*')<CR>
vnoremap ` :call Surrounder('`')<CR>
vnoremap = :call Surrounder('=')<CR>

vnoremap ( :call Surrounder('(', ')')<CR>
vnoremap ) :call Surrounder('( ', ' )')<CR>

vnoremap < :call Surrounder('<', '>')<CR>
vnoremap > :call Surrounder('< ', ' >')<CR>

vnoremap [ :call Surrounder('[', ']')<CR>
vnoremap ] :call Surrounder('[ ', ' ]')<CR>

vnoremap { :call Surrounder('{', '}')<CR>
vnoremap } :call Surrounder('{ ', ' }')<CR>
