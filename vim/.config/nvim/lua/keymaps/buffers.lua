-- nmap('<leader>bb', ':buffers<cr>:buffer<space>', 'Select')
nmap('<leader>ba', CMD('%bd | e# | bd#'), 'Close all, except current')
nmap('<leader>bf', CMD('Telescope buffers'), 'Fuzzy find')

----------------------------------------
--          -> BufferLine <-
----------------------------------------
local status, bufferline = pcall(require, 'bufferline')
if not status then return end

nmap('<leader>bh', FN(bufferline.move, -1), 'Move Right')
nmap('<leader>bl', FN(bufferline.move, 1), 'Move Right')
nmap('<leader>bd', bufferline.close_buffer_with_pick, 'Pick')
-- nmap('<leader>bd', bufferline.close_with_pick, 'Pick')

nmap('H', FN(bufferline.cycle, -1), 'Prev Buffer')
nmap('L', FN(bufferline.cycle, 1), 'Next Buffer')

local absolute = true
local jump_to_buffer = function(target_buffer)
	local num_visible_buffers

	bufferline.exec(1, function(buf, visible_buffers)
		num_visible_buffers = #visible_buffers
	end)

	if target_buffer > num_visible_buffers then bufferline.group_action('Vimwiki', 'toggle') end

	bufferline.go_to_buffer(target_buffer, absolute)
end

for i in ipairs(vim.fn.range(1, 9)) do
	nmap('<A-' .. i .. '>', FN(jump_to_buffer, i), 'Go to BufferLine')
end

nmap('<A-0>', FN(bufferline.go_to_buffer, -1, absolute), '')
-- bufferline.group_action('Vimwiki', function(buf)
-- 	P(buf)
-- end)

-- bufferline.exec(1, function(buf, visible_buffers)
-- 	P(buf)
-- 	-- P(visible_buffers)
-- end)

function Group_bufferline_tabs()
	local windows = vim.fn.getwininfo()
	for _, win in ipairs(windows) do
		local tabnr = win.tabnr
		local buffer = vim.fn.getbufinfo(win.bufnr)[1]
		print(buffer.name)
	end
end
