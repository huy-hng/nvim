local M = {
	'folke/zen-mode.nvim',
	dependencies = {
		'folke/twilight.nvim',
	},
	event = 'VeryLazy',
	-- keys = { '<leader>Z', '<leader>z', 'Z' },
}

local statuscolumn = require('core.statuscolumn')

local parent_tab = 1
local zen_tab

-- local default_tabline = "%{%v:lua.require'heirline'.eval_tabline()%}"

local line_numbers = require('modules.line_numbers')
local winman = require('modules.window_manager')

local function deactivate_neovide()
	winman.delete_tab_background(zen_tab, parent_tab)
	line_numbers.create_autocmds()

	-- nvim.feedkeys('``')
	-- nvim.feedkeys('zz')
end

local function activate_neovide()
	local view = require('zen-mode.view')

	local parent_win = winman.get_win()

	if winman.is_float(parent_win) then
		vim.notify("We don't Zen floating windows here >:(")
		return
	end

	parent_tab = winman.get_tab()

	local tab_id, cursor_pos = winman.open_current_file_in_new_tab()
	zen_tab = tab_id

	winman.hide_ui()
	local tab_win = winman.get_win()

	local success = pcall(require('zen-mode').open)
	if not success then return end

	winman.show_empty_buffer(tab_win)

	view.parent = parent_win

	vim.api.nvim_win_set_cursor(0, cursor_pos)
	nvim.feedkeys('zz')
	nvim.defer(0, function()
		line_numbers.delete_autocmds()
		vim.wo.relativenumber = false
		vim.wo.winbar = ''
		statuscolumn.remove_column(tab_win)
	end)
end

local function activate()
	if vim.g.has_neovide then --
		return activate_neovide()
	end

	pcall(require('zen-mode').open)
end

local function deactivate_callback()
	vim.cmd.TwilightDisable()
	if vim.g.has_neovide then --
		return deactivate_neovide()
	end
end

local function toggle()
	local view = require('zen-mode.view')
	if view.is_open() then --
		-- cant put close inside deactivate_callback, otherwise infinite recursion
		pcall(require('zen-mode').close)
		return deactivate_callback()
	end
	activate()
end

function M.config()
	Map.n('<leader>Z', vim.cmd.Twilight, 'Twilight')
	Map.n('<leader>z', toggle, 'Zen Mode')
	Map.n('Z', toggle, 'Zen Mode')

	require('zen-mode').setup {
		window = {
			backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
			width = 125,
			height = 1,
		},
		plugins = {
			-- disable some global vim options (vim.o...)
			-- comment the lines to not apply the options
			options = {
				enabled = true,
				ruler = false, -- disables the ruler text in the cmd line area
				showcmd = false, -- disables the command in the last line of the screen
			},
			twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
			gitsigns = { enabled = true }, -- disables git signs
			tmux = { enabled = false }, -- disables the tmux statusline
			kitty = {
				enabled = false,
				font = '+1', -- font size increment
			},
		},
		on_open = function(win)
			if vim.g.has_neovide then
				vim.api.nvim_win_close(win - 1, false) -- close background window
				vim.wo[win].winblend = 50
			end

			nvim.defer(0, function()
				vim.w[win].statuscolumn_ignore = true
				statuscolumn.set_column(win, statuscolumn.columns.sparse)

				vim.api.nvim_clear_autocmds {
					event = { 'VimResized', 'CursorHold', 'CursorMoved' },
					group = 'Zen',
					pattern = '*',
				}
				local win_conf = vim.api.nvim_win_get_config(win)
				win_conf.col = win_conf.col[false] + 15
				vim.api.nvim_win_set_config(win, win_conf)
			end)
			local reference = {
				anchor = 'NW',
				col = {
					[false] = 54,
					[true] = 3,
				},
				external = false,
				focusable = true,
				height = 60,
				relative = 'editor',
				row = {
					[false] = 0,
					[true] = 3,
				},
				width = 105,
				zindex = 40,
			}
		end,
		on_close = function(win) deactivate_callback() end,
	}

	require('twilight').setup {
		dimming = {
			alpha = 0.25, -- amount of dimming
		},
		treesitter = false,
		context = 0, -- amount of lines we will try to show around the current line
		-- treesitter = true, -- use treesitter when available for the filetype
		-- treesitter is used to automatically expand the visible text,
		-- but you can further control the types of nodes that should always be fully expanded
		expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
			'function',
			'method',
			'table',
			'if_statement',
		},
		exclude = {}, -- exclude these filetypes
	}
end

return M
