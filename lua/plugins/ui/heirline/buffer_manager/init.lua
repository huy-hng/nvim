local config = require('plugins.ui.heirline.buffer_manager.config')

local M = {}

function M.setup(user_config)
	config.init(user_config)

	vim.api.nvim_set_hl(0, 'BufferManagerHiddenCursor', { blend = 100, nocombine = true })
	local list_manger = require('plugins.ui.heirline.buffer_manager.list_manager')

	Augroup('BufferManager', {
		Autocmd('SessionLoadPost', { list_manger.synchronize_marks, true }),
		Autocmd(
			{ 'BufDelete', 'BufLeave', 'BufNew', 'BufEnter', 'BufRead' },
			list_manger.synchronize_marks
		),
	})
end

return M
