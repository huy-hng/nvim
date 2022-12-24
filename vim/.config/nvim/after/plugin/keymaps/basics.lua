ICmap('<C-BS>', { Feedkeys, '<C-w>' }, 'Delete Word')
ICmap('<C-h>', '<C-w>', 'Delete Word')

Nmap('<esc>', function()
	Feedkeys('<esc>')
	vim.cmd.noh()
end, 'Escape / no highlight')
