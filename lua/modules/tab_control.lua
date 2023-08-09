local M = {}

local parent_tab = 1
-- local default_tabline = "%{%v:lua.require'heirline'.eval_tabline()%}"
-- local prev_tabline = default_tabline

function M.hide_ui()
	-- prev_tabline = vim.o.tabline
	-- vim.o.tabline = ' '
	vim.schedule(function()
		vim.o.showtabline = 0
		vim.o.laststatus = 0 -- global statusline
		if nrequire('lualine') then --
			require('lualine').hide {
				place = { 'statusline', 'tabline', 'winbar' }, -- The segment this change applies to.
				unhide = false, -- whether to re-enable lualine again/
			}
		end
	end)
end

function M.show_ui()
	vim.o.showtabline = 2
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
	M.open_current_file_in_new_tab()
	M.show_empty_buffer(0)

	M.hide_ui()
end

function M.delete_tab_background(tab_id)
	vim.api.nvim_set_current_tabpage(parent_tab)
	local i = table.index(vim.api.nvim_list_tabpages(), tab_id)
	if i then vim.cmd(i .. 'tabclose') end
	M.show_ui()
end

return M
