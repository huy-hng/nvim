local has_possession, possession = pcall(require, 'possession')
if not has_possession then return end

local commands = require('possession.commands')
require('telescope').load_extension('possession')

SHOULD_AUTOSAVE_SESSION = true
PRINT_SESSION_ACTIONS = false

-- good autocommands:
-- not during startup:
--   BufAdd new buffer added to list
--   WinEnter: (good) after entering another window, not for the first window on startup
--   WinNew: (good) after creating a window, not for the first window on startup

-- BufDelete
-- BufEnter
-- BufLeave may be a less expensive BufEnter
-- BufWinEnter may also be a less expensive BufEnter
-- BufWinLeave before buffer is removed from a window

local function print_messages(...)
	if PRINT_SESSION_ACTIONS then print(unpack { ... }) end
end

local function stop_save()
	print_messages('Stopping Autosave Session')
	pcall(vim.api.nvim_del_augroup_by_name, 'AutosaveSession')
end

local function start_save()
	print_messages('Starting Autosave Session')
	local group = vim.api.nvim_create_augroup('AutosaveSession', { clear = true })

	-- vim.api.nvim_create_autocmd('CmdwinEnter', {
	-- 	group = group,
	-- 	callback = function(data)
	-- 		if
	-- 	end
	-- })
	vim.api.nvim_create_autocmd({ 'WinEnter', 'WinNew', 'CmdWinEnter' }, {
		group = group,
		callback = function(data)
			if data.event == 'CmdWinEnter' then return end
			-- if data.file == '' and data.match == '' then return end -- use this for BufAdd
			local buftype = {
				'acwrite',
				'help',
				'nofile',
				'nowrite',
				'quickfix',
				'terminal',
				'prompt',
			}
			local win_conf = vim.api.nvim_win_get_config(0)
			-- dont save when entering floating window
			if win_conf.relative == '' then
				-- Schedule(commands.save, '', true)
				commands.save('', true)
			end
		end,
	})
end

-- stop_save()
-- start_save()

function AutosaveSession(save)
	if save == false then
		stop_save()
		return
	end
	if SHOULD_AUTOSAVE_SESSION then Schedule(start_save) end
end

possession.setup {
	session_dir = vim.fn.stdpath('data') .. '/possession',
	-- session_dir = '$HOME/.local/share/nvim/session/',
	silent = true,
	load_silent = true,
	debug = false,
	prompt_no_cr = true, -- pression y/n suffices
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
	hooks = {
		before_save = function(name)
			print_messages('Saving Session ' .. name)
			-- AutosaveSession(false)
			return {}
			-- return false
		end,

		after_save = function(name, user_data, aborted)
			print_messages('Session ' .. name .. ' saved')
			-- AutosaveSession()
		end,

		before_load = function(name, user_data)
			print_messages('Loading Session ' .. name)
			-- if vim.bo.filetype == 'alpha' then Exec('Bwipeout') end
			AutosaveSession(false)
			return user_data
		end,

		after_load = function(name, user_data)
			print_messages('Session ' .. name .. ' loaded')
			AutosaveSession()
		end,
	},
	plugins = {
		close_windows = {
			-- hooks = { 'before_load' },
			hooks = {},
			preserve_layout = false, -- or fun(win): boolean
			match = {
				floating = false,
				-- buftype = { 'nofile' },
				buftype = {},
				filetype = {},
				custom = function(win)
					local win_conf = vim.api.nvim_win_get_config(win)
					-- P(win_conf)
					-- if vim.bo.filetype == 'alpha' then Exec('Bdelete') end
					print('close window:', vim.bo.buftype, vim.bo.filetype)
				end, -- or fun(win): boolean
				-- i could make a custom function to not close vimwiki buffers
			},
		},
		delete_hidden_buffers = {
			hooks = {
				-- 'before_load',
				-- vim.o.sessionoptions:match('buffer') and 'before_save',
			},
			force = function()
				print('hiddenbuffer force:', vim.bo.buftype, vim.bo.filetype)
			end, -- or fun(buf): boolean
		},
		nvim_tree = false,
		-- tabby = false,
	},
}
