local M = {
	'j-morano/buffer_manager.nvim',
}

function M.config()
	local ui = require('buffer_manager.ui')
	local nmap = MapCreator('n', '', '[Buffer Manager]')
	nmap('<leader>o', ui.toggle_quick_menu, 'Toggle quick menu')
	-- local keys = '1234567890'
	-- for i = 1, #keys do
	-- 	local key = keys:sub(i, i)
	-- 	Nmap(string.format('<leader>%s', key), function() require('buffer_manager.ui').nav_file(i) end)
	-- end

	require('buffer_manager').setup {
		line_keys = '1234567890',
		focus_alternate_buffer = false,
		width = 100,
		height = 10,
		select_menu_item_commands = {
			edit = {
				key = '<CR>',
				command = 'edit',
			},
			unmap = {
				key = 'u',
				command = '',
			},
			-- edit = {
			-- 	key = '<CR>',
			-- 	command = 'edit',
			-- },
		},
	}
end
-- M.config()

return M
