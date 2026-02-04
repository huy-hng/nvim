local M = {}

M.get_win = vim.api.nvim_get_current_win
M.set_win = vim.api.nvim_set_current_win
M.close_win = vim.api.nvim_win_close

M.get_win_buf = vim.api.nvim_win_get_buf
M.get_win_config = vim.api.nvim_win_get_config
M.set_win_config = vim.api.nvim_win_set_config
M.set_win_cursor = vim.api.nvim_win_set_cursor
M.list_wins = vim.api.nvim_list_wins

M.list_tabs = vim.api.nvim_list_tabpages
M.get_tab = vim.api.nvim_get_current_tabpage
M.set_tab = vim.api.nvim_set_current_tabpage

local parent_tab = 1
-- local default_tabline = "%{%v:lua.require'heirline'.eval_tabline()%}"
-- local prev_tabline = default_tabline

function M.hide_ui()
	vim.o.showtabline = 0
	vim.o.laststatus = 0 -- global statusline
	if nrequire('lualine') then --
		require('lualine').hide { place = { 'winbar' }, unhide = false }
	end
end

function M.show_ui()
	vim.o.showtabline = 2
	vim.o.laststatus = 3 -- global statusline
	-- vim.o.tabline = prev_tabline ~= ' ' and prev_tabline or default_tabline
	if nrequire('lualine') then --
		require('lualine').hide { unhide = true }
	end
end

function M.get_line_count(win)
	local bufnr = M.get_win_buf(win)
	local filetype = vim.bo[bufnr].filetype
	local line_count = vim.api.nvim_buf_line_count(bufnr)
end

function M.get_win_by_filetype(ft, min_lines)
	min_lines = min_lines or 2
	for _, win in ipairs(M.list_wins()) do
		local bufnr = M.get_win_buf(win)
		local filetype = vim.bo[bufnr].filetype
		local line_count = vim.api.nvim_buf_line_count(bufnr)

		local config = M.get_win_config(win)
		local is_split = config.relative == ''

		if is_split and filetype == ft and line_count >= min_lines then
			return { id = win, bufnr = bufnr, line_count = line_count }
		end
	end
end

function M.set_cursor_to_last_line(win, ft)
	win = win or M.get_win_by_filetype(ft)
	if not win then return end
	-- vim.api.nvim_win_set_cursor()
	pcall(M.set_win_cursor, win.id, { win.line_count, 0 })
end

---@return number tab_id id of the newly opened tab
---@return table cursor_pos elements as returned by vim.api.nvim_win_get_cursor
function M.open_current_file_in_new_tab(move_cursor)
	local cursor_pos = vim.api.nvim_win_get_cursor(0)

	vim.cmd.tabedit('#' .. vim.api.nvim_get_current_buf())
	local tab_id = vim.api.nvim_get_current_tabpage()

	if move_cursor then
		vim.api.nvim_win_set_cursor(0, cursor_pos)
		nvim.feedkeys('zz')
	end

	return tab_id, cursor_pos
end

function M.show_empty_buffer(winid)
	local scratch_buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_win_set_buf(winid, scratch_buf)
end

function M.create_tab_background()
	local current_tab = vim.api.nvim_get_current_tabpage()
	M.hide_ui()

	local tab_id, _ = M.open_current_file_in_new_tab()
	M.show_empty_buffer(0)
	return tab_id, current_tab
end

function M.is_float(winid)
	local config = M.get_win_config(winid)
	return config.relative ~= ''
end

function M.save_win_sizes()
	local sizes = {}
	for _, id in ipairs(M.list_wins()) do
		if not M.is_float(id) then
			local width = vim.api.nvim_win_get_width(id)
			local height = vim.api.nvim_win_get_height(id)
			sizes[id] = { width, height }
		end
	end
	return sizes
end

function M.restore_win_sizes(win_sizes)
	for winid, size in pairs(win_sizes) do
		if vim.api.nvim_win_is_valid(winid) then
			vim.api.nvim_win_set_width(winid, size[1])
			vim.api.nvim_win_set_height(winid, size[2])
		end
	end
end

function M.close_win_keep_layout(winid, force)
	local sizes = M.save_win_sizes()
	M.close_win(winid, force or false)

	M.restore_win_sizes(sizes)
end

function M.close_tab(tab_id)
	local i = table.index(M.list_tabs(), tab_id)
	if i then vim.cmd(i .. 'tabclose') end
end

function M.delete_tab_background(tab_id, prev_tab)
	if prev_tab and vim.api.nvim_tabpage_is_valid(prev_tab) then M.set_tab(prev_tab) end
	if #M.list_tabs() > 1 then M.close_tab(tab_id) end

	M.show_ui()
end

return M
