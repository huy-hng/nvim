set noshowmode " hide current mode (insert, normal, etc)

"===============================================================================
"                            |=> My Statusline <=|
"===============================================================================

"---------------------------------------
"            -> Helpers <-
"---------------------------------------
fun! SessionTracking()
	return ObsessionStatus('', 'No Session')
endfun


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

augroup statusline
    autocmd!
    autocmd WinEnter * :lua Statusline()
    " autocmd WinEnter * :call ActiveStatusline()
    " autocmd WinEnter * :setlocal statusline=%!ActiveStatusline()
    " autocmd WinLeave * :setlocal statusline=%!ActiveStatusline()
augroup END

" set statusline=%!MyStatusline()
hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red
hi User1 cterm=bold ctermfg=blue ctermbg=red
hi User1 gui=bold cterm=bold guibg=none guifg=none
hi User2 guibg=#1a1b26 guifg=none
" g:statusline_winid doesnt get set compared to line above
" set statusline=%{%MyStatusline()%}
" set statusline+=%!MyStatusline()\ %{strftime('%H:%M')}
" set statusline+=\ '%{strftime('%H:%M')}'

" visual block mode is one single  (^V) character
let g:currentmode={
	  \ 'n' : 'Normal',
	  \ 'v' : 'Visual',
	  \ 'V' : 'V-Line',
	  \ '': 'V-Block',
	  \ 'i' : 'Insert',
	  \ 'R' : 'Replace',
	  \ 'Rv': 'V-Replace',
	  \ 'c' : 'Command',
	  \ 't' : 'Terminal',
	  \}


fun! ActiveStatusline()
	" let focused = g:statusline_winid == win_getid(winnr())
	let focused = 1

	let l:StatusLine = focused ? '%#StatusLine#' : '%#StatusLineNC#'
	let l:TablineTabLineSel = focused ? '%#TabLineSel#' : '%#StatusLineNC#'
	let l:Bold = focused ? '%1*' : '%#StatusLineNC#'
	let l:PmenuSel = focused ? '%#PmenuSel#' : '%#StatusLineNC#'

	let l:normal_text = focused ? '%#StatusLine#' : '%#StatusLineNC#'
	let l:normal_text = focused ? '%2*' : '%#StatusLineNC#'
	let l:normal_text = focused ? '%1*' : '%#StatusLineNC#'

	let l:filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
	let l:modified = &modified ? ' +' : ''


	let s = ''
	let s = s .. l:TablineTabLineSel .. l:Bold .. ' %{g:currentmode[mode()]}%* '

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
	" let s = s .. '%#ErrorMsg#' .. '%{SessionTracking()} ' .. l:normal_text
	let s = s .. '%y '
	let s = s .. l:PmenuSel
	let s = s .. ' %p%% '
	let s = s .. l:TablineTabLineSel
	let s = s .. ' %l:%c '
	" let s = s .. ' %l:%c(%v) '
	let &l:stl = s
	" let &l:stl = &l:stl .. ' %l :     %c(%v) '
	" return s

endfun

" autocmd User StartifyReady 

fun! InactiveStatusline()

endfun


fun! CombinedStatusline()
	let focused = g:statusline_winid == win_getid(winnr())

	let l:StatusLine = focused ? '%#StatusLine#' : '%#StatusLineNC#'
	let l:TablineTabLineSel = focused ? '%#TabLineSel#' : '%#StatusLineNC#'
	let l:Bold = focused ? '%1*' : '%#StatusLineNC#'
	let l:PmenuSel = focused ? '%#PmenuSel#' : '%#StatusLineNC#'

	let l:normal_text = focused ? '%#StatusLine#' : '%#StatusLineNC#'
	let l:normal_text = focused ? '%2*' : '%#StatusLineNC#'
	" let l:normal_text = focused ? '%1*' : '%#StatusLineNC#'

	let l:filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
	let l:modified = &modified ? ' +' : ''

	" visual block mode is one single  (^V) character
	let g:currentmode={
		  \ 'n' : 'Normal',
		  \ 'v' : 'Visual',
		  \ 'V' : 'V-Line',
		  \ '': 'V-Block',
		  \ 'i' : 'Insert',
		  \ 'R' : 'Replace',
		  \ 'Rv': 'V-Replace',
		  \ 'c' : 'Command',
		  \ 't' : 'Terminal',
		  \}

	let s = ''
	let s = s .. l:TablineTabLineSel
	let s = s .. l:Bold .. ' %{g:currentmode[mode()]}%* '
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
	" let s = s .. '%#ErrorMsg#'
	" let s = s .. '%{SessionTracking()} '
	" let s = s .. l:normal_text
	let s = s .. '%y '
	let s = s .. l:PmenuSel
	let s = s .. ' %p%% '
	let s = s .. ' %l:%c '
	let s = s .. l:TablineTabLineSel
	let s = s .. ' %l:%c(%v) '

	return s
endfun




"===============================================================================
"                         |=> Simple Statuslines <=|
"===============================================================================
fun! DefaultStatusline()
	" from examples in the docs
	set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

	set statusline=%<		" where to truncate the line if too long
	set statusline+=%f\		" buffer name (path to a file, or something)
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


fun! Statusline1()
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


fun! Statusline2()
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

fun! Statusline3()
	set statusline=\ 
	set statusline+=%{HasPaste()}
	set statusline+=%F%m%r%h\ 
	set statusline+=%w\ \ 
	set statusline+=CWD:\ %r%{getcwd()}%h\ \ \ 
	set statusline+=Line:\ %l\ \ 
	set statusline+=Column:\ %c
endfun


"===============================================================================
"                         |=> Complex Statuslines <=|
"===============================================================================

"---------------------------------------
"        -> Changing modes <-
"---------------------------------------
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


"---------------------------------------
"         -> super complex <-
"---------------------------------------
function! Buf_total_num()
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction

function! File_size(f)
    let l:size = getfsize(expand(a:f))
    if l:size == 0 || l:size == -1 || l:size == -2
        return ''
    endif
    if l:size < 1024
        return l:size.' bytes'
    elseif l:size < 1024*1024
        return printf('%.1f', l:size/1024.0).'k'
    elseif l:size < 1024*1024*1024
        return printf('%.1f', l:size/1024.0/1024.0) . 'm'
    else
        return printf('%.1f', l:size/1024.0/1024.0/1024.0) . 'g'
    endif
endfunction

fun! OtherStatusLine()
	" [B-buffer number]
	set statusline=%1*[B-%n]%*
	" TOT is an abbreviation for total, [TOT:total buffer number]
	set statusline+=%2*[TOT:%{Buf_total_num()}]%*
	" File size
	set statusline+=%3*\ %{File_size(@%)}\ %*
	" full path
	set statusline+=%<%4*\ %F\ %*
	" set statusline+=%5*\ %{exists('g:loaded_ale')?ALEGetStatusLine():''}%*
	set statusline+=%6*\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}%*
	set statusline+=%7*\ %m%r%y\ %*
	set statusline+=%=%8*\ %{&ff}\ \|\ %{\"\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"\ \|\"}\ %-10.(%l:%c%V%)%*
	set statusline+=%9*\ %P\ %*

	" hi User1 gui=bold guifg=232 guibg=179
	hi User2 gui=None guifg=214 guibg=242
	hi User3 gui=None guifg=251 guibg=240
	hi User4 gui=bold guifg=169 guibg=239
	hi User5 gui=None guifg=208 guibg=238
	hi User6 gui=None guifg=178 guibg=237
	hi User7 gui=None guifg=250 guibg=237
	hi User8 gui=None guifg=249 guibg=238
	hi User9 gui=None guifg=249 guibg=240

	" hi User1 cterm=bold ctermfg=232 ctermbg=179
	hi User2 cterm=None ctermfg=214 ctermbg=242
	hi User3 cterm=None ctermfg=251 ctermbg=240
	hi User4 cterm=bold ctermfg=169 ctermbg=239
	hi User5 cterm=None ctermfg=208 ctermbg=238
	hi User6 cterm=None ctermfg=178 ctermbg=237
	hi User7 cterm=None ctermfg=250 ctermbg=237
	hi User8 cterm=None ctermfg=249 ctermbg=238
	hi User9 cterm=None ctermfg=249 ctermbg=240
	" default bg for statusline is 236 in space-vim-dark
endfun

