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


function! SurroundWithPreformatter()
	"normal! iasdf
	visual! <esc>`<O{{{cat<ESC>`>o}}}<ESC>gv:!figlet -k -t<CR>
endfunction

vnoremap <Leader>1 :call SurroundWithPreformatter()<CR>

"vnoremap <Leader>1 I<Esc>O{{{cat<esc>gvA<esc>o}}}<esc>gv:!figlet -k -t<CR>
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
"<cr>`>my`<mzgv`yo`z

function! Figlet()
	return "figlet -c"
endfunction

" surround selection with quotes
":s/\%V\(.*\)\%V/"\1"/



function! Toggle_Conceal()
	let &concealcursor = &concealcursor == 'c' ? 'nc' : 'c'
	call Message(&concealcursor .. 'onceal')
endfunction


" Vimwiki functions
function! Update_Vimwiki(create)
	let g:vimwiki_create_link=a:create
	call vimwiki#vars#init()
endfunction


function! Create_Vimwiki_Link()
	:call Update_Vimwiki(1)
	:exe "normal \<CR>"
	:call Update_Vimwiki(0)
endfunction

" doesnt work
function! ToggleTableFormatting()
	let g:vimwiki_table_auto_fmt=!g:vimwiki_table_auto_fmt
	call Message('Vimwiki Table Format: ' .. g:vimwiki_table_auto_fmt)
	call vimwiki#vars#init()
endfunction

"===============================================================================
"                           => Helper functions <=
"===============================================================================

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call BufcloseCloseIt()
function! BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 


" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


fun! CenterScreen()
	let l:offset = 0
	let l:offset = 10
	let l:center_size = 80
	let l:center_left_side = (&columns - l:center_size + l:offset) / 2
	exec l:center_left_side . 'vnew'
	wincmd p
	" echo &columns
	" echo l:center_left_side
endfun

" nnoremap <Leader>' :call CenterScreen()<CR>


function! ExecuteMacroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
endfunction
" xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

