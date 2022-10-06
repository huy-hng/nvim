" silent !stty -ixon > /dev/null 2>/dev/null " causes slow startup


"===============================================================================
"                             |=> Status line <=|
"===============================================================================
fun Statusline3()
	set statusline=\ 
	set statusline+=%{HasPaste()}
	set statusline+=%F%m%r%h\ 
	set statusline+=%w\ \ 
	set statusline+=CWD:\ %r%{getcwd()}%h\ \ \ 
	set statusline+=Line:\ %l\ \ 
	set statusline+=Column:\ %c
endfun


fun Statusline1()
	set statusline=
	set statusline+=%#NonText#
	set statusline+=%=
	set statusline+=\ %f
	set statusline+=\ 
	set statusline+=%#CursorLineNr#
	set statusline+=\ %y
	set statusline+=\ %r
	set statusline+=%#IncSearch#
	set statusline+=\ %l/%L
	set statusline+=\ [%c]
endfun


fun Statusline2()
	set statusline=
	set statusline+=%#PmenuSel#
	set statusline+=\ %M
	set statusline+=\ %y
	set statusline+=\ %r
	set statusline+=\ %F
	set statusline+=%= " Right side
	set statusline+=%#DiffChange#
	set statusline+=\ %c:%l/%L
	set statusline+=\ %p%%
	set statusline+=\ [%n]
endfun


" function! GitStatus()
"   let [a,m,r] = GitGutterGetHunkSummary()
"   return printf('+%d ~%d -%d', a, m, r)
" endfunction

fun! SessionTracking()
	return ObsessionStatus('', 'No Session')
endfun

" fun! Statusline() abort
" 	return statusline
" endfun


" augroup vimrc-statusline
"     autocmd!
"     autocmd WinEnter * :setlocal statusline=active
"     autocmd WinLeave * :setlocal statusline=inactive
" augroup END

function! LightlineFilename()
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
	let modified = &modified ? ' +' : ''
	return filename . modified
endfunction

fun! GitBranch()
	try
		let l:branch_name = fugitive#Head()
	catch
		let l:branch_name = ''
	endtry
	return strlen(l:branch_name) > 0 ? ' |  ' .. l:branch_name : ''

endfun

function! GitStatus()
	try
		let [a,m,r] = GitGutterGetHunkSummary()
	catch
		return ''
	endtry

	return printf('+%d ~%d -%d', a, m, r)
endfunction


fun! MyStatusline() abort
	let focused = g:statusline_winid == win_getid(winnr())

	let l:StatusLine = focused ? '%#StatusLine#' : '%#StatusLineNC#'
	let l:TablineTabLineSel = focused ? '%#TabLineSel#' : '%#StatusLineNC#'
	let l:PmenuSel = focused ? '%#PmenuSel#' : '%#StatusLineNC#'

	let l:normal_text = focused ? '%1*' : '%#StatusLineNC#'

	let l:filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
	let l:modified = &modified ? ' +' : ''

	let s = ''
	let s = s .. l:TablineTabLineSel
	" let s = s .. 'lkja'
	let s = s .. l:PmenuSel
	let s = s .. ' %<'
	let s = s .. l:filename
	let s = s .. l:modified
	let s = s .. '%h'
	let s = s .. '%r'
	let s = s .. '%{GitBranch()} '
	let s = s .. ' | '
	let s = s .. '%{GitStatus()} '
	let s = s .. l:normal_text
	let s = s .. '%='
	let s = s .. '%#ErrorMsg#'
	let s = s .. '%{SessionTracking()} '
	let s = s .. l:normal_text
	let s = s .. '%y '
	let s = s .. l:PmenuSel
	let s = s .. ' %p%% '
	let s = s .. ' %l:%c '
	let s = s .. l:TablineTabLineSel
	let s = s .. ' %l:%c(%v) '

	return s
endfun


fun! Mode()
	function! GitBranch()
	  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	endfunction

	function! StatuslineGit()
	  let l:branchname = GitBranch()
	  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
	endfunction

	let g:currentmode={
		  \ 'n' : 'Normal',
		  \ 'v' : 'Visual',
		  \ 'V' : 'V-Line',
		  \ ''  : 'V-Block',
		  \ 'i' : 'Insert',
		  \ 'R' : 'Replace',
		  \ 'Rv': 'V-Replace',
		  \ 'c' : 'Command',
		  \ 't' : 'Terminal',
		  \}

	hi NormalColor ctermbg=black ctermfg=white
	hi InsertColor ctermbg=darkgreen ctermfg=black
	hi ReplaceColor ctermbg=darkred ctermfg=black
	hi VisualColor  ctermbg=darkblue ctermfg=black

	set statusline+=%#NormalColor#%{(g:currentmode[mode()]=='n')?'\ \ normal\ ':''}
	set statusline+=%#InsertColor#%{(g:currentmode[mode()]=='i')?'\ \ insert\ ':''}
	set statusline+=%#ReplaceColor#%{(g:currentmode[mode()]=='r')?'\ \ replace\ ':''}
	set statusline+=%#ReplaceColor#%{(g:currentmode[mode()]=='rv')?'\ \ v-replace\ ':''}
	set statusline+=%#VisualColor#%{(g:currentmode[mode()]=='v')?'\ \ visual\ ':''}
	set statusline+=%#VisualColor#%{(g:currentmode[mode()]=='vl')?'\ \ v-line\ ':''}
	set statusline+=%#VisualColor#%{(g:currentmode[mode()]=='vb')?'\ \ v-block\ ':''}
	set statusline+=%#NormalColor#%{(g:currentmode[mode()]=='c')?'\ \ command\ ':''}
	set statusline+=%#NormalColor#%{(g:currentmode[mode()]=='f')?'\ \ finder\ ':''}
endfun

	" let statusline += '%#CursorLineNr#'
fun DefaultStatusline()
	set statusline=%<		" where to truncate the line if too long
	set statusline+=%f\ 	" buffer name (path to a file, or something)
	set statusline+=%h		" help flag
	set statusline+=%m		" modified flag
	set statusline+=%r		" readonly flag

	set statusline+=%=		" separater between the left (buffer name) and the right (ruler) parts

	set statusline+=%-14.(%l,%c%V%)\ 
	" %-14.(...%) - minimum field width == 14
	" %l - line
	" %c - column
	" %V - virtual column
	set statusline+=%P		" percentage
endfun


" call Statusline3()
" call Statusline2()
" call Statusline1()
" call DefaultStatusline()


set statusline=
set statusline+=%!MyStatusline()

" Set a line at 80 chars
"set colorcolumn=80

" Ps = 0  -> blinking block.
" Ps = 1  -> blinking block (default).
" Ps = 2  -> steady block.
" Ps = 3  -> blinking underline.
" Ps = 4  -> steady underline.
" Ps = 5  -> blinking bar (xterm).
" Ps = 6  -> steady bar (xterm).

let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
set ruler

" reset the cursor on start (for older versions of vim, usually not required)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 8 lines to the cursor - when moving vertically using j/k
set scrolloff=8
set sidescroll=1
set sidescrolloff=8

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif


set magic " For regular expressions turn magic on
set showmatch " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500



