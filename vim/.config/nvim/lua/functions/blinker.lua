function FlashCursor(times, blink_time)
	times = times == nil and 1 or times
	blink_time = blink_time == nil and 200 or blink_time
	for i = 1, times do
		local wait = blink_time*2*(i-1)
		-- print(wait)
		vim.defer_fn((function()blink(blink_time)end), wait)
	end
end

function blink(duration)
	show_position(true)
	vim.defer_fn(show_position(false), duration)
end

function show_position(show)
	vim.opt.cursorline = show
	vim.opt.cursorcolumn = show
	vim.cmd "redraw"
end

