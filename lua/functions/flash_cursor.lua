local function show_cursor(show)
	vim.cmd('hi CursorColumn guibg=#3a3b4c')
	vim.cmd('hi CursorLine guibg=#3a3b4c')
	-- vim.cmd('hi CursorLine guibg=#2a2b3c')
	vim.o.cursorlineopt = 'screenline,number'
	vim.o.cursorline = show
	vim.o.cursorcolumn = show
	vim.cmd.redraw()
end

local function blink(duration)
	show_cursor(true)
	nvim.defer(duration, show_cursor, false)
end

return function(times, blink_time)
	times = times == nil and 1 or times
	blink_time = blink_time == nil and 200 or blink_time
	for i = 1, times do
		local wait = blink_time * 2 * (i - 1)
		nvim.defer(wait, blink, blink_time)
	end
end
