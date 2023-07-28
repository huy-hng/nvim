return {
	-- {
	--      view = Config.options.cmdline.view,
	--      opts = Config.options.cmdline.opts,
	--      filter = { event = "cmdline" },
	--    },
	-- {
	-- 	view = false,
	-- 	filter = { event = 'msg_show', find = 'E486' },
	-- 	opts = { skip = true },
	-- },
	{
		view = 'split',
		filter = { event = 'msg_show', min_height = 20 },
	},
	{
		view = 'messages',
		filter = {
			event = 'msg_show',
			kind = { '', 'echo', 'echomsg' },
			min_height = 20,
		},
		-- opts = { stop = true },
	},
	{
		view = 'messages',
		filter = {
			any = {
				{ event = 'msg_history_show' },
			},
		},
		opts = { lang = 'lua', replace = true, merge = true, title = 'Messages' },
	},
}
