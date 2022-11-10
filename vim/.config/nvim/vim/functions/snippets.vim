command! SmallSection call Sectionize(40, 0.5, '-', ['-> ', " <-"])
command! BigSection call Sectionize()


fun! Sectionize(size=80, location=0.5, divider='=', surround=['|=> ', ' <=|'])
	normal! O
	call <SID>create_divider(a:size, a:divider)

	call cursor(line('.') + 1, 1)

	execute 'normal!i' . a:surround[0]
	execute 'normal!A' . a:surround[1]

	lua require('Comment.api').toggle.linewise.current()

	let l:text_len = strlen(getline('.'))
	let l:text_middle = floor(l:text_len / 2.0)

	let l:spaces = a:location * a:size - l:text_middle
	let l:spaces -= 2

	call cursor(line('.'), 2)
	execute 'normal!wi' . repeat(' ', float2nr(l:spaces))

	normal! o
	call <SID>create_divider(a:size, a:divider)
endfun


fun! s:create_divider(size, divider)
	call <SID>comment()
	let l:comment_len = strlen(getline('.'))
	execute 'normal!A' . repeat(a:divider, a:size - l:comment_len)
endfun


fun! s:comment()
	lua require('Comment.api').toggle.linewise.current(nil, {})
endfun
