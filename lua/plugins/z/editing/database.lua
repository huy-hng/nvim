local M = {
	'tpope/vim-dadbod',
	dependencies = {
		'kristijanhusak/vim-dadbod-ui',
		{ 'hrsh7th/nvim-cmp', lazy = true },
		'nvim-lua/plenary.nvim',
	},
	-- event = 'VeryLazy',
	command = { 'DB' },
}

function M.config()
	local g = vim.g
	g.db_ui_use_nerd_fonts = 1
	g.db_ui_show_database_icon = 1 -- next to database name
	g.db_ui_win_position = 'left'
	g.db_ui_winwidth = 40 -- 30
	g.db_ui_show_help = 0 -- hides `Press ? for help` from drawer
	g.db_ui_debug = 0 -- prints out infos about executed query
	g.db_ui_force_echo_notifications = 0 -- To force echoing messages to command line set this value to 1
	g.db_ui_save_location = vim.fn.stdpath('config') .. require('plenary.path').path.sep .. 'db_ui'

	-- DBUIOpened autocommand

	-- currently default
	-- g.db_ui_icons = {
	-- 	expanded = {
	-- 		db = '▾',
	-- 		buffers = '▾',
	-- 		saved_queries = '▾',
	-- 		schemas = '▾',
	-- 		schema = '▾',
	-- 		tables = '▾',
	-- 		table = '▾',
	-- 	},
	-- 	collapsed = {
	-- 		db = '▸',
	-- 		buffers = '▸',
	-- 		saved_queries = '▸',
	-- 		schemas = '▸',
	-- 		schema = '▸',
	-- 		tables = '▸',
	-- 		table = '▸',
	-- 	},
	-- 	saved_query = '*',
	-- 	new_query = '+',
	-- 	tables = '~',
	-- 	buffers = '»',
	-- 	add_connection = '[+]',
	-- 	connection_ok = '✓',
	-- 	connection_error = '✕',
	-- }

	local function focus_drawer()
		if vim.bo.filetype == 'dbui' then
			vim.cmd.DBUIToggle()
		else
			vim.cmd.DBUI()
		end
	end

	-- check out 'shortmess' to remove hit-enter prompt
	local buf_map = Map.new('', '', '[DB (Buffer)]', { remap = true, buffer = true })

	local function db_completion()
		require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
	end

	Augroup('DBUIMappings', {
		Autocmd('FileType', 'dbui', function()
			buf_map.n('j', 'j^')
			buf_map.n('k', 'k^')
			buf_map.n('l', '<Plug>(DBUI_SelectLine)<CR>', 'toggle / open')
			-- buf_map.n('l', '<Plug>(DBUI_SelectLine)', 'toggle / open')
		end),
		Autocmd('FileType', 'sql', 'setlocal omnifunc=vim_dadbod_completion#omni'),
		Autocmd('FileType', { 'sql', 'mysql', 'plsql' }, function() --
			vim.schedule(db_completion)
		end),
	})

	local db_map = Map.new('<leader>D', '', '[DB]')
	Map.n('<C-S-D>', focus_drawer, 'Toggle Drawer')
	db_map.n('u', vim.cmd.DBUIToggle, 'Toggle Drawer')
	db_map.n('f', vim.cmd.DBUIFindBuffer, 'Find buffer in DBUI drawer')
	db_map.n('r', vim.cmd.DBUIRenameBuffer, 'Rename buffer or saved query')
	db_map.n('q', vim.cmd.DBUILastQueryInfo, 'Print last query and time')
	db_map.n('q', vim.cmd.DBUIHideNotifications, 'Hide all visible notifications')
end

return M
