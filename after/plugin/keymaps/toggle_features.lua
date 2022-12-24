local function echo(...)
	local cmdheight_before = vim.o.cmdheight

	vim.o.cmdheight = 1

	local args = ...
	-- args = type(args) == 'table' and unpack(args)
	vim.cmd.echo(string.format('"%s"', args))

	Defer(2000, function() vim.o.cmdheight = cmdheight_before end)
end

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
		vim.notify('nowrap text')
		vim.o.wrap = false
		Nmap('j', 'j')
		Nmap('k', 'k')
		Nmap('0', 'g^')
		Nmap('^', 'g0')
		Nmap('$', 'g$')
	else
		vim.notify('wrap text')
		vim.o.wrap = true
		Nmap('j', 'gj')
		Nmap('k', 'gk')
		Nmap('0', '^')
		Nmap('^', '0')
		Nmap('$', '$')
	end
end

Nmap('<F4>', toggle_conceal, '[Toggle] Conceal')
Nmap('<F8>', toggle_wrap, '[Toggle] Wrap')
