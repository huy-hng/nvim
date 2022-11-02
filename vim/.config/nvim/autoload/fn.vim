function! fn#save_and_load() abort
	:silent! write
	if &filetype == 'vim'
		:source %
	elseif &filetype == 'lua'
		:luafile %
	endif
endfunction