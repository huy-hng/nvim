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

local function buffer_switch(index)
	local buffers = get_buffers()
	if index > #buffers or index == -1 then index = #buffers end
	vim.api.nvim_win_set_buf(0, buffers[index])
end

-- Nmap('H', { buffer_cycle, -1 }, 'Prev Buffer')
-- Nmap('L', { buffer_cycle, 1 }, 'Next Buffer')

local bufman = require('bufman.navigation')

Map.n(Keys.H, {bufman.goto, -1}, 'Prev Buffer')
Map.n(Keys.L, {bufman.goto, 1}, 'Next Buffer')

Map.n('<leader>0', { buffer_switch, -1 }, '')
for i in ipairs(vim.fn.range(1, 9)) do
	local keymap = string.format('<leader>%s', i)
	Map.n(keymap, { buffer_switch, i }, 'Go to Buffer')
end
