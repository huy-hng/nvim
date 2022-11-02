set autoread

augroup Python
	autocmd FileType python nnoremap <buffer> <A-m> <cmd>!python %<CR>
augroup END

augroup CommandlineWindow
	autocmd!
	autocmd CmdwinEnter * nnoremap <buffer> <ESC> <cmd>q<CR>
	autocmd CmdwinEnter * nnoremap <buffer> ; :
	autocmd WinEnter * nnoremap <buffer> <CR> g_
	" autocmd BufEnter * nnoremap <buffer> <CR> g_
augroup END


augroup DisableCompletion
	autocmd!
	" change to vimwiki TODO
	" autocmd FileType TelescopePrompt lua require('cmp').setup.buffer {enabled = false}
augroup END

augroup somegroup
	autocmd!
    autocmd User Startified setlocal statusline=\ 
	" autocmd TabNewEntered * Startify

	" Set to auto read when a file is changed from the outside
	" autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

	" Return to last edit position when opening files
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

	" autocmd BufEnter * if &filetype == 'help' | set conceallevel=0 | else | set conceallevel=2 | endif
augroup END

" augroup startup
" 	autocmd!
" 	autocmd VimEnter *
" 			\   if !argc()
" 			\ |   Startify
" 			\ |   NvimTreeOpen
" 			\ |   wincmd w
" 			\ | endif
" augroup END


augroup NoComment
	autocmd!
	autocmd BufEnter * :set formatoptions-=cro
	autocmd InsertEnter * :set formatoptions-=cro
	autocmd InsertLeave * :set formatoptions-=cro
augroup END

function! LineNumbers(show=1)
	augroup line_numbers
		autocmd!
		autocmd InsertEnter * :set norelativenumber
		autocmd InsertLeave * :set relativenumber
	augroup END
	if (a:show == 0)
		autocmd! line_numbers
	endif
endfunction
call LineNumbers()


augroup filetypes
	autocmd!
	autocmd BufNewFile,BufRead *.env		set filetype=bash
	autocmd BufNewFile,BufRead *.profile	set filetype=bash
	autocmd BufNewFile,BufRead *.rc			set filetype=bash
	autocmd BufNewFile,BufRead *.login		set filetype=bash
	autocmd BufNewFile,BufRead *.logout		set filetype=bash

	autocmd BufNewFile,BufRead *.tmux		set filetype=tmux
	autocmd BufNewFile,BufRead *.vim		set filetype=vim

augroup END

augroup filestuff
	autocmd!
	" reload vim when vim/lua files are saved
	" autocmd BufWritePost *.vim,*.lua :so %
	" autocmd BufWritePost *.vim,*.lua :so $HOME/.config/nvim/init.lua
	" autocmd BufWritePost *.vim,*.lua silent! exec "so $HOME/.config/nvim/init.vim"

	" add date in vimwikiw
	autocmd BufNewFile */daily_log/[0-9]*.md : 0r !echo "= $(date -d '%:t:r' +'\%A, \%b \%d') =\n"
augroup END


"augroup VimrcAuGroup
"	autocmd!
"	autocmd FileType vimwiki setlocal foldmethod=expr |
"		\ setlocal foldenable | set foldexpr=VimwikiFoldLevelCustom(v:lnum)
"augroup END


" Plugins not listed here because of load order
" Goyo

