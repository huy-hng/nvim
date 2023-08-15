-- NOTE: see file below for more info
-- /home/huy/.local/share/nvim/lazy/noice.nvim/lua/noice/config/routes.lua

local short_timeout = 500
local timeout = 2000
local long_timeout = 5000
return {
	-----------------------------------------------Hide---------------------------------------------
	{
		view = false,
		filter = {
			event = 'msg_show',
			any = {
				{ kind = 'wmsg' },
				{ find = 'search hit' },
			},
		},
		opts = { skip = true, stop = true },
	},

	-----------------------------------------------mini---------------------------------------------

	{ -- Config Change Detected
		view = 'mini',
		filter = { find = 'Config Change Detected' },
		opts = { lang = 'markdown' },
	},
	{
		view = 'mini_left',
		filter = {
			event = 'msg_show',
			any = {
				{ kind = 'wmsg' },
				{ kind = 'lua_error' },
			},
		},
	},
	{ -- short timout
		view = 'mini_left',
		filter = {
			event = 'msg_show',
			any = {
				{ find = 'E486' }, -- search pattern not found
				{ find = 'E21' }, -- buffer is not modifiable
				{ find = 'written' },
			},
		},
		opts = { timeout = short_timeout, stop = true, skip = false },
	},

	----------------------------------------------split---------------------------------------------

	{
		view = 'split',
		filter = { event = 'msg_show', kind = 'return_prompt' },
	},
	-- {
	-- 	view = 'messages',
	-- 	filter = {
	-- 		event = 'msg_show',
	-- 		min_height = 11,
	-- 	},
	-- },
	-- {
	-- 	view = 'hsplit',
	-- 	filter = {
	-- 		event = 'msg_show',
	-- 		min_height = 3,
	-- 		max_height = 10,
	-- 	},
	-- 	opts = {
	-- 		enter = true,
	-- 		close = { keys = { 'q', '<esc>' } },
	-- 	},
	-- },
	{
		view = 'messages',
		filter = { event = 'msg_history_show' },
		opts = { lang = 'lua', replace = true, merge = true, title = 'Messages' },
	},
}
