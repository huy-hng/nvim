local pickers = require('telescope.pickers')
local previewers = require('telescope.previewers.buffer_previewer')
local utils = require('telescope.previewers.utils')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

return function(opts)
	opts = opts or require('plugins.telescope.layouts').vert_list_insert

	local view = vim.fn.winsaveview()
	local filetypes = vim.fn.getcompletion('', 'filetype')
	table.remove(filetypes, 1)

	local bufnr = vim.api.nvim_create_buf(false, true)

	local contents = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, contents)

	pickers
		.new(opts, {
			prompt_title = 'File Types',
			finder = finders.new_table { results = filetypes },
			sorter = conf.generic_sorter(opts),
			previewer = previewers.new_buffer_previewer {
				define_preview = function(self, entry, status)
					local ft = entry[1]
					local telescope_bufnr = self.state.bufnr
					local winid = self.state.winid

					utils.highlighter(bufnr, ft)
					-- vim.api.nvim_buf_set_option(buff, 'filetype', ft)
					nvim.schedule(vim.api.nvim_win_set_buf, winid, bufnr)
					nvim.schedule(vim.api.nvim_win_call, winid, function() vim.fn.winrestview(view) end)
					vim.api.nvim_buf_set_lines(telescope_bufnr, 0, -1, false, contents)
				end,
				teardown = function(self) vim.api.nvim_buf_delete(bufnr, {}) end,
			},
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					local ft = selection[1]

					vim.bo.filetype = ft
				end)
				return true
			end,
		})
		:find()
end
