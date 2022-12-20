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
		echo('conceal normal')
		vim.o.concealcursor = 'nc'
	else
		echo('dont conceal normal')
		vim.o.concealcursor = 'c'
	end
end

local function toggle_wrap()
	-- local wrap = vim.o.wrap
	if vim.o.wrap then
		echo('not wrapping text')
		vim.o.wrap = false
		Nmap('j', 'j')
		Nmap('k', 'k')
	else
		echo('wrapping text')
		vim.o.wrap = true
		Nmap('j', 'gj')
		Nmap('k', 'gk')
	end
end

Nmap('<F4>', toggle_conceal, '[Toggle] Conceal')
Nmap('<F8>', toggle_wrap, '[Toggle] Wrap')
