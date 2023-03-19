local utils = require('plugins.ui.heirline.buffer_manager.utils')

local M = {}

BufferManagerConfig = BufferManagerConfig or {}

function M.setup(config)
	if not config then config = {} end

	local default_config = {
		line_keys = '1234567890',
		select_menu_item_commands = {
			edit = {
				key = '<CR>',
				command = 'edit',
			},
		},
		focus_alternate_buffer = false,
		short_file_names = true,
		short_term_names = false,
		highlight = 'Float',
	}

	BufferManagerConfig = utils.merge_tables(default_config, config)
	require('plugins.ui.heirline.buffer_manager.ui').initialize_marks()

	Augroup('BufferMangaer', {
		Autocmd('SessionLoadPost', function()
			require('plugins.ui.heirline.buffer_manager.ui').marks = {}
			require('plugins.ui.heirline.buffer_manager.ui').initialize_marks()
		end),
	})
end

function M.get_config() return BufferManagerConfig or {} end

return M
