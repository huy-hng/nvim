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

nmap('<leader>Du', CMD('DBUIToggle'), 'Toggle UI')
nmap('<leader>Df', CMD('DBUIFindBuffer'), 'Find buffer')
nmap('<leader>Dr', CMD('DBUIRenameBuffer'), 'Rename buffer')
nmap('<leader>Dq', CMD('DBUILastQueryInfo'), 'Last query info')

return M
