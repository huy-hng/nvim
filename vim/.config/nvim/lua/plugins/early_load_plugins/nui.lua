--- @type number[]
PopupWindows = {}


local function close_all_floating_wins()
	local wins = vim.api.nvim_list_wins()
	for _, winid in ipairs(wins) do
		local config = vim.api.nvim_win_get_config(winid)
		if config.relative ~= '' then
			print(winid)
			vim.api.nvim_win_close(winid, false)
		end
	end
end

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

local event = require('nui.utils.autocmd').event

local M = {}

-- pretty interesting for neovide
local function open_externally()
	local win = vim.api.nvim_open_win(0, true, {
		external = true,
		width = 80,
		height = 50,
		border = 'rounded',
	})
end

local Split = require('nui.split')
local function create_split()
	return Split {
		relative = 'editor',
		position = 'bottom',
		size = '20%',
	}
end

local split = create_split()
-- split:mount()
function WriteToSplit(...)
	local args = Formatter(...)
	vim.api.nvim_buf_set_lines(split.bufnr, -1, -1, false, { args })
end

nmap('\\2', close_all_floating_wins, 'close all floating windows')

return M
