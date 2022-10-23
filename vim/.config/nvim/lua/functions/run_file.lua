local bufnr = 7
local start_line = 0
-- end_line = -1
local end_line = 0

local lines = {'asdhello', 'world'}
local commands = { }

-- vim.api.nvim_buf_set_lines(bufnr, start_line, end_line, false, lines)

vim.api.nvim_create_autocmd('BufWritePost', {
	group = vim.api.nvim_create_augroup('Runner', { clear = true }),
	pattern = 'run_file.lua',
	callback = function()
		vim.fn.jobstart(commands, {
			stdout_buffered = true,
			on_stdout = function(_, data)
				if data then
					vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
				end
			end,
			on_stderr = function(_, data)
				if data then
					vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
				end
			end,
		})
	end,
})

