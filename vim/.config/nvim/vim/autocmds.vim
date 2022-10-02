" Set to auto read when a file is changed from the outside
set autoread
"autocmd FocusGained,BufEnter * checktime


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" reload vim when '.vim' files are saved
augroup VimFiles
	autocmd!
	autocmd BufWritePost *.vim silent! exec "so $HOME/.config/nvim/init.vim"
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



autocmd BufNewFile */daily_log/[0-9]*.md : 0r !echo "= $(date -d '%:t:r' +'\%A, \%b \%d') =\n"
"autocmd BufNewFile */daily_log/[0-9]*.md : 0r !echo "= $(date -d '%:t:r' +'\%A, \%B \%d \%Y') =\n"

augroup filetypedetect
	autocmd!
	autocmd BufNewFile,BufRead *.env		set filetype=zsh
	autocmd BufNewFile,BufRead *.profile	set filetype=zsh
	autocmd BufNewFile,BufRead *.rc			set filetype=zsh
	autocmd BufNewFile,BufRead *.login		set filetype=zsh
	autocmd BufNewFile,BufRead *.logout		set filetype=zsh
	autocmd BufNewFile,BufRead *.tmux		set filetype=tmux
augroup END


"augroup VimrcAuGroup
"	autocmd!
"	autocmd FileType vimwiki setlocal foldmethod=expr |
"		\ setlocal foldenable | set foldexpr=VimwikiFoldLevelCustom(v:lnum)
"augroup END


" Plugins not listed here because of load order
" Goyo


" remove message from bottom
"autocmd CursorHold * :echo

