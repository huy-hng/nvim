local M = {
	'jedrzejboczar/possession.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	event = 'VeryLazy',
}

local function get_buffer_elements()
	---@module bufferline
	local bufferline = nrequire('bufferline')
	if not bufferline then return end
	P(bufferline)

	local elements = bufferline.get_elements().elements
end

local function print_messages(...)
	if PRINT_SESSION_ACTIONS then Notify(unpack { ... }) end
end

function M.config()
	local possession = require('possession')

	local commands = require('possession.commands')
	-- require('telescope').load_extension('possession')

	SHOULD_AUTOSAVE_SESSION = true
	PRINT_SESSION_ACTIONS = false
	MAX_SAVE_INTERVAL = 1 -- in seconds
	local last_save = os.time()

	--- good autocommands:
	--- not during startup:
	---   BufAdd new buffer added to list
	---   WinEnter: (good) after entering another window, not for the first window on startup
	---   WinNew: (good) after creating a window, not for the first window on startup
	---
	--- BufDelete
	--- BufEnter
	--- BufLeave may be a less expensive BufEnter
	--- BufWinEnter may also be a less expensive BufEnter
	--- BufWinLeave before buffer is removed from a window
	local function save(data)
		local session = require('possession.session')
		if not session.session_name then return end

		print_messages(data.event)
		if data.event == 'CmdWinEnter' or vim.fn.mode() == 'c' then return end
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
		-- dont save when entering floating window
		if vim.api.nvim_win_get_config(0).relative ~= '' then return end

		local new_save = os.time()
		if new_save - last_save < MAX_SAVE_INTERVAL then return end
		last_save = new_save
		nvim.schedule(commands.save, '', true)
		-- commands.save('', true)
	end

	local function start_autosave_autocmd()
		print_messages('Starting Autosave Session')
		Augroup('AutosaveSession', {
			Autocmd({ 'WinEnter', 'WinNew' }, save),
		})
	end

	local function stop_autosave_autocmd()
		print_messages('Stopping Autosave Session')
		pcall(vim.api.nvim_del_augroup_by_name, 'AutosaveSession')
	end

	local function reload_autosaver()
		stop_autosave_autocmd()
		start_autosave_autocmd()
	end
	-- reload_autosaver()

	function AutosaveSession(save)
		if save == false then
			stop_autosave_autocmd()
			return
		end
		if SHOULD_AUTOSAVE_SESSION then nvim.schedule(start_autosave_autocmd) end
	end

	possession.setup {
		session_dir = vim.fn.stdpath('data') .. '/possession',
		silent = true,
		load_silent = true,
		debug = false,
		prompt_no_cr = true, -- pressing y/n suffices
		autosave = {
			current = true, -- or fun(name): boolean, save current session if it exists
			tmp = true, -- or fun(): boolean, save a tmp session if no session has been loaded yet
			tmp_name = 'No Name',
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
				return { timestamp = os.time() }
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
				hooks = { 'before_load', 'after_load' },
				preserve_layout = true, -- or fun(win): boolean
				match = {
					-- buftype = { 'nofile', 'help' },
					-- buftype = { 'nofile' },
					-- filetype = { 'vimwiki' },
					-- custom = function(win)
					-- 	local win_conf = vim.api.nvim_win_get_config(win)
					-- 	local buf = vim.api.nvim_win_get_buf(win)
					-- end,
				},
			},
			delete_hidden_buffers = {
				hooks = { 'before_load' },
				force = function(bufnr) --
					local name = vim.api.nvim_buf_get_name(bufnr)
					print(name)

					-- if name:match('wiki') then return true end
					return true
				end,
			},
			nvim_tree = false,
			-- tabby = false,
		},
	}
end

return M
