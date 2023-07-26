local config = require('plugins.ui.heirline.buffer_manager.config')
local Debounce = require('plugins.ui.heirline.buffer_manager.debounce')

local M = {}

function M.setup(user_config)
	config.init(user_config)

	local list_manger = require('plugins.ui.heirline.buffer_manager.list_manager')
	list_manger.synchronize_marks()

	local updater = Debounce(vim.schedule_wrap(list_manger.synchronize_marks), 100)

	Augroup('BufferManager', {
		Autocmd('SessionLoadPost', { list_manger.synchronize_marks, true }),
		Autocmd({ 'BufDelete', 'BufLeave', 'BufNew', 'BufEnter', 'BufRead' }, updater),
	})
end

return M
