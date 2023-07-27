return {
	-- {
	-- 	view = 'mini',
	-- 	filter = {
	-- 		event = 'msg_show',
	-- 		kind = { '', 'echo', 'echomsg' },
	-- 	},
	-- },
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
