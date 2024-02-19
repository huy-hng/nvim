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
		Map.n('j', 'j')
		Map.n('k', 'k')
		Map.n('0', 'g^')
		Map.n('^', 'g0')
		Map.n('$', 'g$')
	else
		vim.notify('Word Wrap')
		vim.o.wrap = true
		Map.n('j', 'gj')
		Map.n('k', 'gk')
		Map.n('0', '^')
		Map.n('^', '0')
		Map.n('$', '$')
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

Map.n('<F4>', { Util.toggle, 'concealcursor', false, { 'c', 'nc' } }, '[Toggle] Conceal')

Map.n('<F8>', toggle_wrap, '[Toggle] Wrap')
Map.n('<F7>', toggle_commenting, '[Toggle] Auto Comment')
Map.n('<F10>', function ()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	nvim.feedkeys('gg=G')
	vim.schedule(function()
		vim.api.nvim_win_set_cursor(0, cursor_pos)
	end)
end)
-- Nmap('<F10>', 'gg=G')

-- Nmap('<leader>tf', require('lazyvim.plugins.lsp.format').toggle, 'Toggle format on Save')

Map.n('<F6>', function() Util.toggle('spell') end, 'Toggle Spelling')
-- Nmap('', function() Util.toggle('wrap') end, 'Toggle Word Wrap')
-- Nmap("<leader>td", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
-- Nmap('<leader>tc', function() Util.toggle('conceallevel', false, { 0, 2 }) end, 'Toggle Conceal')
