
local function echo(...)
	vim.o.cmdheight = 1

	local args = ...
	if type(args) == 'table' then args = unpack(args) end
	vim.cmd.echo(string.format('"%s"', args))

	Defer(2000, function() vim.o.cmdheight = 0 end)
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
		nmap('j', 'j')
		nmap('k', 'k')
	else
		echo('wrapping text')
		vim.o.wrap = true
		nmap('j', 'gj')
		nmap('k', 'gk')
	end
end

nmap('<F4>', toggle_conceal)
nmap('<F8>', toggle_wrap)
