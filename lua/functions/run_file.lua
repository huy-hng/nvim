local attach_to_buffer = function(output_bufnr, pattern, command)
	vim.api.nvim_create_autocmd('BufWritePost', {
		group = vim.api.nvim_create_augroup('CodeRunner', { clear = true }),
		pattern = pattern,
		callback = function()
			local append_data = function(_, data)
				if data then
					vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
				end
			end

			vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, { 'main.py output:' })
			vim.fn.jobstart(command, {
				stdout_buffered = true,
				on_stdout = append_data,
				on_stderr = append_data,
			})
		end,
	})
end

-- local output_bufnr, command = 7, {'python', 'main.py'}

vim.api.nvim_create_user_command('RunCurrentFile', function()
	local bufname = vim.fn.bufname '%'
	local output_bufnr = vim.fn.input 'Bufnr: '

	local command = 'python ' .. bufname
	attach_to_buffer(tonumber(output_bufnr), '.py', command)
end, {})

vim.api.nvim_create_user_command('AutoRun', function()
	print 'autorunner'

	local bufnr = vim.fn.input 'Bufnr: '
	local pattern = vim.fn.input 'Pattern: '
	local command = vim.fn.input 'Command: '
	local parsed_command = vim.split(command, ' ')
	attach_to_buffer(tonumber(bufnr), pattern, parsed_command)
end, {})

function test_automatic_buffer()
	local all_buffers = vim.fn.getbufinfo { bufloaded = 1, buflisted = 1 }
	local output_bufnr = 42069
	for _, buf in ipairs(all_buffers) do
		if buf['bufnr'] ~= output_bufnr then
			print 'exists!!'
		end
		P(buf['bufnr'])
	end
end
