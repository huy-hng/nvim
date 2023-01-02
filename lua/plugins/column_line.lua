local M = {
	'huy-hng/column_line.nvim',
	dev = true,
}

function M.config()
	local column_line = require('column_line')
	column_line.setup()
	-- TODO: move this to the plugin folder, needs augroup and autocmd functions
	Augroup('ColumnLine', {
		Autocmd('OptionSet', 'colorcolumn', column_line.refresh),
		Autocmd({
			'FileChangedShellPost',
			'TextChanged',
			'TextChangedI',
			'CompleteChanged',
			'VimEnter',
			'SessionLoadPost',
			'BufWinEnter',
			'WinEnter',
		}, column_line.refresh),
	})
end

return M
