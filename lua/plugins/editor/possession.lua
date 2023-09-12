local M = {
	'jedrzejboczar/possession.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	event = 'VeryLazy',
}

local function print_messages(...)
	-- Notify(unpack { ... })
end

function M.config()
	local possession = require('possession')

	local commands = require('possession.commands')
	-- require('telescope').load_extension('possession')

	SHOULD_AUTOSAVE_SESSION = true
	MAX_SAVE_INTERVAL = 5 -- in seconds
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
		prompt_no_cr = false, -- pressing y/n suffices
		autosave = {
			current = true, -- or fun(name): boolean, save current session if it exists
			tmp = function()
				local valid_bufs = 0
				for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
					local bufname = vim.api.nvim_buf_get_name(bufnr)
					if vim.fn.buflisted(bufnr) and bufname ~= '' then
						valid_bufs = valid_bufs + 1
					end
					if valid_bufs > 2 then return true end
				end
				return false
			end,
			tmp_name = 'tmp',
			on_load = false, -- when loading another session
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
		},
		hooks = {
			before_save = function(name)
				return {
					timestamp = os.time(),
					bufman = require('bufman.save_menu').encode_state(),
				}
			end,

			after_save = function(name, user_data, aborted) end,

			before_load = function(name, user_data)
				AutosaveSession(false)
				return user_data
			end,

			after_load = function(name, user_data)
				AutosaveSession()
				local buffers = vim.tbl_filter(
					function(bufnr) return vim.api.nvim_buf_get_option(bufnr, 'buflisted') end,
					vim.api.nvim_list_bufs()
				)
				for _, bufnr in ipairs(buffers) do
					local bufname = vim.api.nvim_buf_get_name(bufnr)
					local ft = vim.bo[bufnr].ft

					local extension = vim.fn.fnamemodify(bufname, ':t:e')

					-- delete tabs when they contain empty buffers
					if bufname == '' then --
						vim.api.nvim_buf_delete(bufnr, {})
					end
				end

				if user_data.bufman then
					require('bufman.save_menu').decode_state(user_data.bufman)
				end
			end,
		},
		plugins = {
			close_windows = {
				hooks = { 'before_load' },
				preserve_layout = true, -- or fun(win): boolean
				match = {
					-- floating = true,
					-- buftype = { 'nofile' },
					-- filetype = { },
					custom = function(win) -- delete buffers before load from previous session
						-- local win_conf = vim.api.nvim_win_get_config(win)
						-- local bufnr = vim.api.nvim_win_get_buf(win)
						-- local bufname = vim.api.nvim_buf_get_name(bufnr)
						return true
					end,
				},
			},
			delete_hidden_buffers = {
				hooks = { 'before_load' },
				force = function(bufnr) --
					if vim.bo[bufnr].buftype == 'terminal' then return true end
					return false
				end,
			},
			nvim_tree = false,
		},
	}
end

return M
