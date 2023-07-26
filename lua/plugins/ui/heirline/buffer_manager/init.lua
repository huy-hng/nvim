local config = require('plugins.ui.heirline.buffer_manager.config')

local M = {}

function M.setup(user_config)
	config.init(user_config)

	local list_manger = require('plugins.ui.heirline.buffer_manager.list_manager')
	list_manger.update_marks()

	Augroup('BufferManager', {
		Autocmd('SessionLoadPost', { list_manger.update_marks, true }),
		Autocmd(
			{ 'BufDelete', 'BufLeave', 'BufNew', 'BufEnter', 'BufRead' },
			function() vim.schedule(list_manger.update_marks) end
		),
	})
end

return M
