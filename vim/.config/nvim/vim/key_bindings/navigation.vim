fun! GoToBufferIndex(num)
	" let l:buffer_list = getbufinfo({'bufloaded': 1, 'buflisted': 1})
	let l:buffer_list = getbufinfo({'buflisted': 1})
	let l:len = len(buffer_list)

	let l:index = a:num
	if (a:num > l:len)
		let l:index = l:len
	endif

	let l:index -= 1
	" echo l:buffer_list[l:index].bufnr
	exec 'buffer ' .. l:buffer_list[l:index].bufnr
endfun
