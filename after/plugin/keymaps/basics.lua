ICmap('<C-BS>', { nvim.feedkeys, '<C-w>' }, 'Delete Word')
ICmap('<C-h>', '<C-w>', 'Delete Word')

Nmap('<esc>', function()
	nvim.feedkeys('<esc>')
	vim.cmd.noh()
end, 'Escape / no highlight')
