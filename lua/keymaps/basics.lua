ICmap('<C-BS>', { nvim.feedkeys, '<C-w>' }, 'Delete Word')
ICmap('<C-h>', '<C-w>', 'Delete Word')

Nmap('<esc>', function()
	nvim.feedkeys('<esc>')
	vim.cmd.noh()
end, 'Escape / no highlight')

if vim.fn.has('nvim-0.9.0') == 1 then
	Nmap('<localleader>h', vim.show_pos, 'Highlight Groups at cursor')
end

Nmap('<leader>gt', Util.float_term, 'Terminal (cwd)')
Nmap(
	'<leader>gg',
	{ Util.float_term, 'lazygit', { size = { width = 0.6, height = 0.9 } } },
	'Lazygit (cwd)'
)
-- Nmap('<leader>gG', function() Util.float_term({ 'lazygit' }, { cwd = Util.get_root() }) end, 'Lazygit (root dir)')

-- floating terminal
-- Nmap(
-- 	'<leader>ot',
-- 	function() Util.float_term(nil, { cwd = Util.get_root() }) end,
-- 	'Terminal (root dir)'
-- )
-- Tmap('<esc><esc>', '<c-\\><c-n>', 'Enter Normal Mode')
Tmap('<C-c>', '<c-\\><c-n>', 'Enter Normal Mode')
