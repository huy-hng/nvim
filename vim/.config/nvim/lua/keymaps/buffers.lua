local status, wk = pcall(require, 'which-key')
if not status then
	print(status, wk)
	return
end

local wrappers = require 'core.wrappers'
local cmd = wrappers.cmd
local fn = wrappers.fn


wk.register({ ['<leader>b'] = { name = '+Buffers' } })

-- nmap('<leader>bb', ':buffers<cr>:buffer<space>', 'Select')
nmap('<leader>ba', cmd('%bd | e# | bd#'), 'Close all, except current')
nmap('<leader>bf', cmd('Telescope buffers'), 'Fuzzy find')

----------------------------------------
--          -> BufferLine <-
----------------------------------------
local bufferline = require 'bufferline'

nmap('<leader>bh', fn(bufferline.move, -1), 'Move Right')
nmap('<leader>bl', fn(bufferline.move, 1), 'Move Right')
nmap('<leader>bd', bufferline.close_buffer_with_pick, 'Pick')
-- nmap('<leader>bd', bufferline.close_with_pick, 'Pick')

nmap('H', fn(bufferline.cycle, -1), 'Prev Buffer')
nmap('L', fn(bufferline.cycle, 1), 'Next Buffer')


local absolute = true
local jump_to_buffer = function(target_buffer)
	local num_visible_buffers

	bufferline.exec(1, function(buf, visible_buffers)
		num_visible_buffers = #visible_buffers
	end)

	if target_buffer > num_visible_buffers then
		bufferline.group_action('Vimwiki', 'toggle')
	end

	bufferline.go_to_buffer(target_buffer, absolute)
end

-- nmap('<A-1>', fn(jump_to_buffer, 1), 'Go to BufferLine')
for i in ipairs(vim.fn.range(1, 9)) do
	nmap('<A-' .. i .. '>', fn(jump_to_buffer, i), 'Go to BufferLine')
	-- nmap('<A-' .. i .. '>', fn(bufferline.go_to_buffer, i, absolute), 'Go to BufferLine')
end

nmap('<A-0>', fn(bufferline.go_to_buffer, -1, absolute), '')
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
		-- print(buffer.)
		print(buffer.name)
		-- P(buffer)
		-- P(win)
	end
end
