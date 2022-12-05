local M = {}

local function db_completion()
	require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
end

function M.setup()
	vim.g.db_ui_save_location = vim.fn.stdpath('config')
		.. require('plenary.path').path.sep
		.. 'db_ui'

	vim.api.nvim_create_autocmd('FileType', {
		pattern = {
			'sql',
		},
		command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
	})

	vim.api.nvim_create_autocmd('FileType', {
		pattern = {
			'sql',
			'mysql',
			'plsql',
		},
		callback = function()
			vim.schedule(db_completion)
		end,
	})
end

local g = vim.g
g.db_ui_use_nerd_fonts = 1
g.db_ui_show_database_icon = 1 -- next to database name
g.db_ui_win_position = 'left'
g.db_ui_winwidth = 40 -- 30
g.db_ui_show_help = 0 -- hides `Press ? for help` from drawer
g.db_ui_debug = 0 -- prints out infos about executed query
g.db_ui_force_echo_notifications = 0 -- To force echoing messages to command line set this value to 1

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
		Exec('DBUIToggle')
	else
		Exec('DBUI')
	end
end

-- check out 'shortmess' to remove hit-enter prompt
local buf_map = PrefixMap('n', '', '[DB (Buffer)]', { silent=true, noremap = false, buffer = true })
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'dbui',
	group = vim.api.nvim_create_augroup('DBUIMappings', { clear = true }),
	callback = function()
		buf_map('j', 'j^')
		buf_map('k', 'k^')
		buf_map('l', '<Plug>(DBUI_SelectLine)<CR>', 'toggle / open')
		-- buf_map('l', '<Plug>(DBUI_SelectLine)', 'toggle / open')
	end,
})

local db_map = PrefixMap('n', '<leader>D', '[DB]')
nmap('<C-S-D>', focus_drawer, 'Toggle Drawer')
db_map('u', CMD('DBUIToggle'), 'Toggle Drawer')
db_map('f', CMD('DBUIFindBuffer'), 'Find buffer in DBUI drawer')
db_map('r', CMD('DBUIRenameBuffer'), 'Rename buffer or saved query')
db_map('q', CMD('DBUILastQueryInfo'), 'Print last query and time')
db_map('q', CMD('DBUIHideNotifications'), 'Hide all visible notifications')

return M
