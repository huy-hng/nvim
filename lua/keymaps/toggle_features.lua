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

local function toggle_commenting()
	P(vim.opt_local.formatoptions:get())

	if vim.opt_local.formatoptions:get()['c'] then
		vim.opt_local.formatoptions:remove { 'c', 'r', 'o' }
		vim.notify('No Auto Comment')
		return
	end
	vim.opt_local.formatoptions:append('cro')
	vim.notify('Auto Comment')
end

Nmap('<F4>', { Util.toggle, 'concealcursor', false, { 'c', 'nc' } }, '[Toggle] Conceal')

Nmap('<F8>', toggle_wrap, '[Toggle] Wrap')
Nmap('<F7>', toggle_commenting, '[Toggle] Auto Comment')
Nmap('<F10>', 'gg=G<C-o>zz')
-- Nmap('<F10>', 'gg=G')

-- Nmap('<leader>tf', require('lazyvim.plugins.lsp.format').toggle, 'Toggle format on Save')

Nmap('<F6>', function() Util.toggle('spell') end, 'Toggle Spelling')
-- Nmap('', function() Util.toggle('wrap') end, 'Toggle Word Wrap')
-- Nmap("<leader>td", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
-- Nmap('<leader>tc', function() Util.toggle('conceallevel', false, { 0, 2 }) end, 'Toggle Conceal')
