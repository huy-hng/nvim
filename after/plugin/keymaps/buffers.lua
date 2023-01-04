-- nmap('<leader>bb', ':buffers<cr>:buffer<space>', 'Select')
Nmap('<leader>ba', { nvim.exec, '%bd | e# | bd#' }, 'Close all, except current')
Nmap('<leader>bf', { nvim.exec, 'Telescope buffers' }, 'Fuzzy find')

----------------------------------------
--          -> BufferLine <-
----------------------------------------
local loaded, bufferline = pcall(require, 'bufferline')
if not loaded then
	vim.notify('Bufferline not loaded for keymaps')
	return
end

Nmap('<leader>bh', { bufferline.move, -1 }, 'Move Right')
Nmap('<leader>bl', { bufferline.move, 1 }, 'Move Right')
Nmap('<leader>bd', bufferline.close_buffer_with_pick, 'Pick')

Nmap('<leader>bcd', { vim.fn.chdir, Util.wrap(vim.fn.expand, '%:p:h') }, 'Change dir to current buffer')
-- nmap('<leader>bd', bufferline.close_with_pick, 'Pick')

Nmap('H', { bufferline.cycle, -1 }, 'Prev Buffer')
Nmap('L', { bufferline.cycle, 1 }, 'Next Buffer')

local absolute = true
local jump_to_buffer = function(target_buffer)
	local num_visible_buffers

	bufferline.exec(1, function(buf, visible_buffers) num_visible_buffers = #visible_buffers end)

	if target_buffer > num_visible_buffers then bufferline.group_action('Vimwiki', 'toggle') end

	bufferline.go_to_buffer(target_buffer, absolute)
end

for i in ipairs(vim.fn.range(1, 9)) do
	local keymap = string.format('<leader>%s', i)
	Nmap(keymap, { jump_to_buffer, i }, 'Go to BufferLine')
end

Nmap('<leader>0', { bufferline.go_to_buffer, -1, absolute }, '')
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
