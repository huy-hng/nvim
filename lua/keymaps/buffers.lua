function Group_bufferline_tabs()
	local windows = vim.fn.getwininfo()
	for _, win in ipairs(windows) do
		local tabnr = win.tabnr
		local buffer = vim.fn.getbufinfo(win.bufnr)[1]
		print(buffer.name)
	end
end

local function get_buffers()
	return vim.tbl_filter(
		function(bufnr) return vim.api.nvim_buf_get_option(bufnr, 'buflisted') end,
		vim.api.nvim_list_bufs()
	)
end

local function buffer_cycle(val)
	-- local buffers = get_buffers()
	local buffers = require('plugins.ui.heirline.buffer_manager.ui').get_ordered_bufids()

	local cur_buf = vim.api.nvim_get_current_buf()
	local index = table.index(buffers, cur_buf)

	local target = index + val

	if target > #buffers then
		target = 1
	elseif target < 1 then
		target = #buffers
	end

	vim.api.nvim_win_set_buf(0, buffers[target])
end

local function buffer_switch(index)
	local buffers = get_buffers()
	if index > #buffers or index == -1 then index = #buffers end
	vim.api.nvim_win_set_buf(0, buffers[index])
end

-- Nmap('H', { buffer_cycle, -1 }, 'Prev Buffer')
-- Nmap('L', { buffer_cycle, 1 }, 'Next Buffer')

local buf_manager = require('plugins.ui.heirline.buffer_manager.navigation')

Map.n('H', buf_manager.nav_prev, 'Prev Buffer')
Map.n('L', buf_manager.nav_next, 'Next Buffer')

Map.n('<leader>0', { buffer_switch, -1 }, '')
for i in ipairs(vim.fn.range(1, 9)) do
	local keymap = string.format('<leader>%s', i)
	Map.n(keymap, { buffer_switch, i }, 'Go to Buffer')
end
