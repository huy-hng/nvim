set autoread

augroup somegroup
	autocmd!
	" Set to auto read when a file is changed from the outside
	" autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

	" Return to last edit position when opening files
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	" autocmd FileType help : set conceallevel=0
		autocmd BufEnter * if &filetype == 'help' | set conceallevel=0 | else | set conceallevel=2 | endif
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
	autocmd BufNewFile,BufRead *.env		set filetype=zsh
	autocmd BufNewFile,BufRead *.profile	set filetype=zsh
	autocmd BufNewFile,BufRead *.rc			set filetype=zsh
	autocmd BufNewFile,BufRead *.login		set filetype=zsh
	autocmd BufNewFile,BufRead *.logout		set filetype=zsh

	autocmd BufNewFile,BufRead *.tmux		set filetype=tmux
	autocmd BufNewFile,BufRead *.vim		set filetype=vim

augroup END

augroup filestuff
	autocmd!

	" reload vim when '.vim' files are saved
	autocmd BufWritePost *.vim silent! exec "so $HOME/.config/nvim/init.lua"
	autocmd BufWritePost *.lua silent! exec "so $HOME/.config/nvim/init.lua"
	autocmd BufWritePost *.lua silent! exec "so %"
	" autocmd BufWritePost *.vim silent! exec "so $HOME/.config/nvim/init.vim"
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

