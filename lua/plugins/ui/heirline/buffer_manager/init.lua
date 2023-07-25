local utils = require('plugins.ui.heirline.buffer_manager.utils')

local M = {}

local config = {}

local default_config = {
	line_keys = '1234567890',
	select_menu_item_commands = {
		edit = {
			key = '<CR>',
			command = 'edit',
		},
	},
	sort_by = 'alphabet',
	sort_on_close = true,
	focus_alternate_buffer = false,
	short_file_names = true,
	cursorline = true,
	short_term_names = false,
	highlight = 'Float',
	borderchars = { '─', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
	-- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
	-- highlight = 'Normal',
	-- width = 0.5,
	-- height = 0.5
}

function M.setup(user_config)
	config = utils.merge_tables(default_config, user_config or {})

	local list_manger = require('plugins.ui.heirline.buffer_manager.list_manager')
	list_manger.initialize_marks()

	Augroup('BufferManager', {
		Autocmd('SessionLoadPost', function() list_manger.initialize_marks() end),
		Autocmd({ 'BufLeave' }, function() vim.schedule(list_manger.update_marks) end),
	})
end

function M.get_config() return config or {} end

return M
