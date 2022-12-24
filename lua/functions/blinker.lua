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
	Defer(duration, show_cursor, false)
end

function FlashCursor(times, blink_time)
	times = times == nil and 1 or times
	blink_time = blink_time == nil and 200 or blink_time
	for i = 1, times do
		local wait = blink_time * 2 * (i - 1)
		Defer(wait, blink, blink_time)
	end
end

Nmap('<leader><CR>', { FlashCursor, 3 }, 'Flash Cursor')
