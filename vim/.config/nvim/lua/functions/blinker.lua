function redraw(show)
	vim.opt.cursorline = show
	vim.opt.cursorcolumn = show
	vim.cmd 'redraw'
end

function hide_position() redraw(false) end
function show_position() redraw(true) end

function blink(duration)
	show_position()
	vim.defer_fn(hide_position, duration)
end

function FlashCursor(times, blink_time)
	times = times == nil and 1 or times
	blink_time = blink_time == nil and 200 or blink_time
	for i = 1, times do
		local wait = blink_time * 2 * (i - 1)
		vim.defer_fn(function() blink(blink_time) end, wait)
	end
end
