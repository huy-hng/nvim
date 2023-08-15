-- NOTE: see file below for more info
-- /home/huy/.local/share/nvim/lazy/noice.nvim/lua/noice/config/views.lua

return {
	notify = { view = 'notify', replace = true },
	cmdline_popup = { view = 'cmdline_popup', position = { row = '33%', col = '45%' } },
	cmdline = {
		view = 'cmdline',
		position = { row = '100%', col = '50%' },
		size = { height = 'auto', width = '33%' },
	},

	-----------------------------------------------mini---------------------------------------------

	mini_left = {
		view = 'mini',
		position = { row = -1, col = 0 },
		align = 'message-left',
		reverse = false,
		replace = true,
		timeout = 4000,
	},
	mini_center = {
		view = 'mini_left',
		position = { row = '100%', col = '50%' },
		timeout = 8000,
	},

	----------------------------------------------Split---------------------------------------------

	hsplit = { view = 'split', position = 'bottom', size = '20%' },
	vsplit_left = { view = 'split', position = 'left' },
	split = {
		view = 'split',
		position = 'right',
		size = '40%',
		win_options = { wrap = false },
	},
	messages = {
		view = 'split',
		relative = 'editor',
		enter = true,
		size = { width = 'auto', max_width = '40%' },
		close = {
			keys = { 'q', '<esc>' },
		},
	},

	----------------------------------------------popup---------------------------------------------

	popup = {
		view = 'popup',
		border = { style = 'none' },
	},
	popup_ = {
		view = 'popup',
		enter = false,
		timeout = 4000,
		-- position = { row = '50%', col = '50%' },
		position = { row = '100%', col = '50%' },
		size = {
			width = 'auto',
			height = 'auto',
			max_height = 40,
		},
		win_options = {
			winblend = 100,
			winhighlight = {
				Normal = 'NoiceMini',
				-- Normal = 'NoicePopupmenu',
				-- FloatBorder = 'NoicePopupmenuBorder'
			},
		},
	},
	hover = {
		view = 'popup',
		relative = 'cursor',
		zindex = 45,
		enter = false,
		anchor = 'NE', -- fix for neovide putting window offscreen
		size = {
			width = 'auto',
			height = 'auto',
			max_height = 20,
			max_width = 120,
		},
		border = {
			style = 'none',
			padding = { 1, 2 },
			-- padding = { 0, 0 },
		},
		position = { row = 2, col = 2 },
		win_options = {
			wrap = true,
			linebreak = true,
		},
	},
}
