fun! s:get_closest()
	let l:char_list = ['"', "'", '(', ')', '[', ']', '{', '}', '<', '>']
	" echo getline('.'), '\%' . col('.') . 'c.'

	let l:current_line = getline('.')
	echo l:current_line

	echo '\%' . col('.') . 'c.'
	echo matchstrpos(getline('.'), '\%' . col('.') . 'c')
endfun


fun! s:get_char()
	return matchstr(getline('.'), '\%' . col('.') . 'c.')
endfun


fun! MatchCharacter()
	call <SID>get_closest()

	let l:char = <SID>get_char()
	if (l:char == '"')
		echo '"'
	elseif (l:char == "'")
		echo "'"
	else
		normal! %
	endif
endfun

" nnoremap <leader>1 <cmd>lua MatchCharacter()<CR>
" nnoremap % <cmd>call MatchCharacter()<cr>


