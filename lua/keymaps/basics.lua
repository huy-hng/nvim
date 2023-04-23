Map.ic('<C-BS>', { nvim.feedkeys, '<C-w>' }, 'Delete Word')
-- ICmap('<C-h>', '<C-w>', 'Delete Word')

Map.n('<space><space>', '<nop>')
Map.n('<esc>', function()
	nvim.feedkeys('<esc>')
	vim.cmd.noh()
end, 'Escape / no highlight')

if vim.fn.has('nvim-0.9.0') == 1 then
	Map.n('<localleader>h', vim.show_pos, 'Highlight Groups at cursor')
end

Map.n('<leader>gt', Util.float_term, 'Terminal (cwd)')
Map.n(
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

Map.t('<C-c>', '<c-\\><c-n>', 'Enter Normal Mode')
