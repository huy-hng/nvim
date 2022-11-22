function! Message(message, duration=2000)
	echo a:message

	fun! Clear(...)
		echo
	endfun
	let timer = timer_start(a:duration, 'Clear', {})
endfunction

function! Wrap()
	if (&wrap)
		call Message('not wrapping text')
		set nowrap
		nnoremap j j
		nnoremap k k
	else
		call Message('wrapping text')
		set wrap
		nnoremap j gj
		nnoremap k gk
	endif
endfunction

function! Toggle_Conceal()
	let &concealcursor = &concealcursor == 'c' ? 'nc' : 'c'
	call Message(&concealcursor .. 'onceal')
endfunction

" F keys for extra functions
nnoremap <F3> <cmd>set hlsearch!<bar>set hlsearch?<CR>
nnoremap <F4> <cmd>call Toggle_Conceal()<CR>
nnoremap <F8> <cmd>call Wrap()<CR>

nnoremap <leader><CR> <cmd>lua FlashCursor(3)<CR>

"vnoremap <Leader>1 :call Figlet()<CR>
"vnoremap <Leader>1 I<Esc>O{{{cat<esc>gvA<esc>o}}}<esc>gv:!figlet -k -t<CR>
