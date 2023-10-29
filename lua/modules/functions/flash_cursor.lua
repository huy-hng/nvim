local function set_options(opts)
	vim.o.cursorlineopt = opts.cursorlineopt
	vim.o.cursorcolumn = opts.cursorcolumn
	vim.o.cursorline = opts.cursorline
end
local function show_cursor(show)
	set_options {
		cursorlineopt = 'screenline,number',
		cursorcolumn = show,
		cursorline = show,
	}
	vim.cmd.redraw()
end

local function blink(duration)
	show_cursor(true)
	nvim.defer(duration, show_cursor, false)
end

return function(times, blink_time)
	-- vim.cmd('hi CursorColumn guibg=#3a3b4c')
	-- vim.cmd('hi CursorLine guibg=#3a3b4c')

	local opts_before = {
		cursorlineopt = vim.o.cursorlineopt,
		cursorcolumn = vim.o.cursorcolumn,
		cursorline = vim.o.cursorline,
	}

	times = times == nil and 1 or times
	blink_time = blink_time == nil and 200 or blink_time
	for i = 1, times do
		local wait = blink_time * 2 * (i - 1)
		nvim.defer(wait, blink, blink_time)
	end

	nvim.defer(2 * blink_time * (times + 1), set_options, opts_before)
end
