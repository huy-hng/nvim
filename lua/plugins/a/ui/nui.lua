local M = {
	'MunifTanjim/nui.nvim',
	event = 'VeryLazy',
}

local Split

function M.config()
	Split = require('nui.split')

	local event = require('nui.utils.autocmd').event
end

--- @type number[]
PopupWindows = {}

local function get_buf_ft(filetype)
	local bufs = vim.api.nvim_list_bufs()

	local vwbufs = {}
	for _, bufnr in ipairs(bufs) do
		if not vim.api.nvim_buf_is_loaded(bufnr) then
			goto continue
		end

		local listed = vim.api.nvim_buf_get_option(bufnr, 'buflisted')
		local hidden = vim.api.nvim_buf_get_option(bufnr, 'bufhidden')
		local buftype = vim.api.nvim_buf_get_option(bufnr, 'buftype')

		local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')
		if ft == filetype then table.insert(vwbufs, bufnr) end

		::continue::
	end

	table.sort(vwbufs)
	return vwbufs[1]
end

-- pretty interesting for neovide
local function open_externally()
	local win = vim.api.nvim_open_win(0, true, {
		external = true,
		width = 80,
		height = 50,
		border = 'rounded',
	})
end

local function create_split()
	return Split {
		relative = 'editor',
		position = 'left',
		size = '25%',
		win_options = {
			number = false,
		},
	}
end

-- NuiOutput = create_split()

function NewOutput()
	if NuiOutput then NuiOutput:unmount() end

	NuiOutput = create_split()
	NuiOutput:mount()
	return NuiOutput
end

function ClearOutput()
	if not NuiOutput then return end
	if not NuiOutput.bufnr then return end
	vim.api.nvim_buf_set_lines(NuiOutput.bufnr, 0, -1, false, { '' })
	-- Try(1, vim.api.nvim_buf_set_lines, NuiOutput.bufnr, 0, -1, false, { '' })
end

local function inspector(arg)
	if type(arg) == 'string' then --
		return { arg }
	end

	arg = vim.inspect(arg)
	arg = vim.split(arg, '\n', {})
	return arg
end

function WriteToSplit(...)
	if not NuiOutput then NuiOutput = NewOutput() end
	NuiOutput:mount()

	local args = vim.tbl_map(inspector, { ... })
	for _, arg in ipairs(args) do
		vim.api.nvim_buf_set_lines(NuiOutput.bufnr, -1, -1, false, arg)
		-- Try(1, vim.api.nvim_buf_set_lines, NuiOutput.bufnr, -1, -1, false, arg)
	end
end

return M
