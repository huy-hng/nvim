local M = {}

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

M.get_win = vim.api.nvim_get_current_win
M.get_tab = vim.api.nvim_get_current_tabpage
M.list_wins = vim.api.nvim_list_wins
M.list_tabs = vim.api.nvim_list_tabpages
M.set_tab = vim.api.nvim_set_current_tabpage

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
