local function toggle_conceal()
	if vim.o.concealcursor == 'c' then
		vim.notify('conceal normal')
		vim.o.concealcursor = 'nc'
	else
		vim.notify('dont conceal normal')
		vim.o.concealcursor = 'c'
	end
end

-- TODO: metamap
local function toggle_wrap()
	-- local wrap = vim.o.wrap
	if vim.o.wrap then
		vim.notify('No Word Wrap')
		vim.o.wrap = false
		Nmap('j', 'j')
		Nmap('k', 'k')
		Nmap('0', 'g^')
		Nmap('^', 'g0')
		Nmap('$', 'g$')
	else
		vim.notify('Word Wrap')
		vim.o.wrap = true
		Nmap('j', 'gj')
		Nmap('k', 'gk')
		Nmap('0', '^')
		Nmap('^', '0')
		Nmap('$', '$')
	end
end

Nmap('<F4>', { Util.toggle, 'concealcursor', false, { 'c', 'nc' } }, '[Toggle] Conceal')
-- Nmap('<F4>', toggle_conceal, '[Toggle] Conceal')
Nmap('<F8>', toggle_wrap, '[Toggle] Wrap')

-- toggle options
-- Nmap('<leader>tf', require('lazyvim.plugins.lsp.format').toggle, 'Toggle format on Save')
Nmap('<F6>', function() Util.toggle('spell') end, 'Toggle Spelling')
-- Nmap('', function() Util.toggle('wrap') end, 'Toggle Word Wrap')
-- Nmap("<leader>td", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
-- Nmap('<leader>tc', function() Util.toggle('conceallevel', false, { 0, 2 }) end, 'Toggle Conceal')
