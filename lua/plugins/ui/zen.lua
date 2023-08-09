local M = {
	'folke/zen-mode.nvim',
	dependencies = {
		'folke/twilight.nvim',
	},
	event = 'VeryLazy',
}

local statuscolumn = require('core.statuscolumn.statuscolumn')

local zenmode_active = false
local parent_tab = 1
local zen_tab
local default_tabline = "%{%v:lua.require'heirline'.eval_tabline()%}"
local prev_tabline = default_tabline

local function hide_ui()
	prev_tabline = vim.o.tabline
	vim.o.tabline = ' '
	vim.schedule(function()
		vim.o.laststatus = 0 -- global statusline
		if nrequire('lualine') then --
			require('lualine').hide {
				place = { 'statusline', 'tabline', 'winbar' }, -- The segment this change applies to.
				unhide = false, -- whether to re-enable lualine again/
			}
		end
	end)
end

local function show_ui()
	vim.o.tabline = prev_tabline ~= ' ' and prev_tabline or default_tabline
	if nrequire('lualine') then --
		require('lualine').hide { unhide = true }
	end
end

local line_numbers = require('modules.line_numbers')
local tab_control = require('modules.tab_control')

local function new_tab() end

local function activate()
	local view = require('zen-mode.view')

	zenmode_active = true
	-- local tab_id, cursor_pos = tab_control.open_current_file_in_new_tab()
	local parent_win = vim.api.nvim_get_current_win()
	local cursor = vim.api.nvim_win_get_cursor(0)

	parent_tab = vim.api.nvim_get_current_tabpage()
	vim.cmd.tabedit('#' .. vim.api.nvim_get_current_buf())
	zen_tab = vim.api.nvim_get_current_tabpage()

	local scratch_buf = vim.api.nvim_create_buf(false, true)
	local tab_win = vim.api.nvim_get_current_win()

	hide_ui()

	require('zen-mode').open()
	vim.api.nvim_win_set_buf(tab_win, scratch_buf)
	view.parent = parent_win

	vim.api.nvim_win_set_cursor(0, cursor)
	nvim.feedkeys('zz')
	nvim.defer(0, function()
		line_numbers.delete_autocmds()
		vim.wo.relativenumber = false
		vim.wo.winbar = ''
		statuscolumn.remove_statuscolumn(tab_win)
	end)
end

local function deactivate()
	zenmode_active = false

	vim.o.laststatus = 3 -- global statusline
	line_numbers.create_autocmds()
	show_ui()

	vim.schedule(function()
		-- nvim.feedkeys('``')
		-- nvim.feedkeys('zz')
		vim.api.nvim_set_current_tabpage(parent_tab)
		local i = table.index(vim.api.nvim_list_tabpages(), zen_tab)
		if i then vim.cmd(i .. 'tabclose') end

		vim.cmd.TwilightDisable()
	end)
end

function M.config()
	Map.n('<leader>Z', vim.cmd.Twilight, 'Twilight')
	Map.n('<leader>z', function()
		-- TODO: use view.is_open()
		if zenmode_active then --
			return deactivate()
		end
		activate()
	end, 'Zen Mode')

	require('zen-mode').setup {
		window = {
			backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
			width = 105,
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
				-- this will change the font size on kitty when in zen mode
				-- to make this work, you need to set the following kitty options:
				-- - allow_remote_control socket-only
				-- - listen_on unix:/tmp/kitty
				enabled = false,
				font = '+4', -- font size increment
			},
		},
		-- callback where you can add custom code when the Zen window opens
		on_open = function(win)
			local bg_win = win - 1
			vim.wo[win].winblend = 100

			local conf = {
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
			vim.api.nvim_win_close(bg_win, false)
			nvim.defer(0, function()
				local column = statuscolumn.build {
					Statuscolumn.right_align,
					Statuscolumn.sparse_line_number,
					Statuscolumn.border,
					Statuscolumn.space,
				}
				statuscolumn.set_statuscolumn(win, column)

				vim.api.nvim_clear_autocmds {
					event = { 'VimResized', 'CursorHold', 'CursorMoved' },
					group = 'Zen',
					pattern = '*',
				}
				local win_conf = vim.api.nvim_win_get_config(win)
				win_conf.col = win_conf.col[false] + 15
				vim.api.nvim_win_set_config(win, win_conf)
				-- vim.wo[win].winhl = 'NormalFloat:NoiceMini'
			end)
		end,
		-- callback where you can add custom code when the Zen window closes
		on_close = function(win) deactivate() end,
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
