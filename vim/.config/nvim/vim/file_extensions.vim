augroup filetypedetect
	autocmd BufNewFile,BufRead *.env		set filetype=zsh
	autocmd BufNewFile,BufRead *.profile	set filetype=zsh
	autocmd BufNewFile,BufRead *.rc			set filetype=zsh
	autocmd BufNewFile,BufRead *.login		set filetype=zsh
	autocmd BufNewFile,BufRead *.logout		set filetype=zsh

	autocmd BufNewFile,BufRead *.tmux		set filetype=tmux
	"autocmd BufRead,BufNewFile /home/huy/.dotfiles/tmux/.config/tmux/config/* set syntax=tmux
augroup END

