local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then return end

M = {}

local popup_config = {
	row = -1,
	-- row = -1,
	col = 37,

	width = 80,
	height = vim.api.nvim_win_get_height(0) - 2,

	relative = 'win', -- editor | win | cursor
	-- bufpos = { 100, 10 },

	border = 'rounded', -- none | single | double | rounded | solid | shadow
	style = 'minimal',
	-- focusable = false,
}

local function is_already_loaded(filename)
	for _, buf_id in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf_id) and filename == vim.api.nvim_buf_get_name(buf_id) then
			return true
		end
	end
	return false
end

M.close_popup = function(winid)
	vim.api.nvim_del_augroup_by_name('NvimTreeRemovePreviewPopup')
	vim.schedule(function()
		vim.api.nvim_win_close(winid, true)
	end)
	-- vim.cmd 'augroup NvimTreeRemovePreviewPopup | au! CursorMoved | augroup END'
	-- if winid ~= nil then
	-- 	pcall(vim.api.nvim_win_close, winid, true)
	-- end
end

M.preview = function(node)
	local status, running = pcall(vim.api.nvim_get_autocmds, {
		-- event = 'CursorMoved',
		group = 'NvimTreeRemovePreviewPopup',
	})

	-- if preview already opened then return end
	if status and #running > 0 then
		return
	end

	if node.nodes or node.name == '..' then
		return
	end

	local path = node.absolute_path
	if node.link_to then
		path = node.link_to
	end
	local fname = vim.fn.fnameescape(path)

	local buf_loaded = is_already_loaded(path)

	local tree_width = vim.api.nvim_win_get_width(0)

	popup_config.width = PrevWinWidth - (tree_width + 7)
	local winid = vim.api.nvim_open_win(0, false, popup_config)


	local bufnum = vim.fn.bufadd(fname)
	vim.api.nvim_win_set_buf(winid, bufnum)
	vim.schedule(function()
		vim.api.nvim_create_autocmd('CursorMoved', {
			group = vim.api.nvim_create_augroup('NvimTreeRemovePreviewPopup', {}),
			-- callback = close_popup,
			callback = function()
				M.close_popup(winid)
				-- return true
			end,
		})
	end)
end

M.focus_tree = function()
	PrevWinWidth = vim.api.nvim_win_get_width(0)

	local api = require 'nvim-tree.api'
	local view = require 'nvim-tree.view'

	if view.is_visible() then
		api.tree.focus()
	else
		api.tree.toggle(true)
	end
end

local function print_node(node)
	for k, v in pairs(node) do
		print '============='
		print(k)
		print(v)
	end
end

-- local get_tree_width = function()
-- 	local win_id = vim.api.nvim_get_current_win()
-- 	local opt = vim.api.nvim_win_get_option(win_id)
-- 	print(opt)
-- end

-- get_tree_width()

return M
