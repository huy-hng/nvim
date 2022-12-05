local has_possession, possession = pcall(require, 'possession')
if not has_possession then return end

require('telescope').load_extension('possession')

-- for statusline

possession.setup {
	session_dir = vim.fn.stdpath('data') .. '/possession',
	-- session_dir = '$HOME/.local/share/nvim/session/',
	silent = true,
	load_silent = true,
	debug = false,
	prompt_no_cr = false,
	autosave = {
		current = true, -- or fun(name): boolean, save current session if it exists
		tmp = true, -- or fun(): boolean, save a tmp session if no session has been loaded yet
		tmp_name = 'tmp',
		on_load = true, -- when loading another session
		on_quit = true,
	},
	commands = {
		save = 'SSave',
		load = 'SLoad',
		delete = 'SDelete',
		list = 'SList',
		close = 'SClose',
		show = 'SShow',
		migrate = 'SMigrate',
		-- save = 'PossessionSave',
		-- load = 'PossessionLoad',
		-- delete = 'PossessionDelete',
		-- list = 'PossessionList',
		-- close = 'PossessionClose',
		-- show = 'PossessionShow',
		-- migrate = 'PossessionMigrate',
	},
	-- hooks = {
	-- 	before_save = function(name)
	-- 		return {}
	-- 	end,
	-- 	after_save = function(name, user_data, aborted) end,
	-- 	before_load = function(name, user_data)
	-- 		return user_data
	-- 	end,
	-- 	after_load = function(name, user_data) end,
	-- },
	plugins = {
		close_windows = {
			hooks = { 'before_save', 'before_load' },
			preserve_layout = true, -- or fun(win): boolean
			match = {
				floating = true,
				buftype = {},
				filetype = {},
				custom = false, -- or fun(win): boolean
			},
		},
		delete_hidden_buffers = {
			hooks = {
				'before_load',
				vim.o.sessionoptions:match('buffer') and 'before_save',
			},
			force = true, -- or fun(buf): boolean
		},
		nvim_tree = true,
		tabby = true,
	},
}
