local M = {}

local options = require('plugins.ui.alpha.options')

function M.pad(text, width)
	width = width or options.width
	local needed_spaces = width - string.len(text)
	local padded_name = text .. nvim.Repeat(' ', needed_spaces)
	return padded_name
end

function M.pad_text(val, width)
	if type(val) == 'function' then --
		return function() M.pad(val(), width) end
	elseif type(val) == 'string' then
		return M.pad(val, width)
	end
	return val
end

local seed = math.floor(os.time() + os.clock() * 10 ^ 6)
math.randomseed(seed)

math.random()
math.random()
math.random()

function M.get_random_element(elements) return elements[math.random(#elements)] end

function M.colorizer(header, text_arr)
	for i, value in ipairs(text_arr) do
		local handle = io.popen('echo ' .. value .. ' | lolcat -f')
		if handle ~= nil then
			local line = handle:read('*l')
			header[i] = line
			handle:close()
		end
	end
end

function M.change_native_keymap_fn()
	---@diagnostic disable-next-line: duplicate-set-field
	require('alpha').keymaps_element.button = function(el, conf, state)
		if el.opts and el.opts.keymap then
			local map = el.opts.keymap
			map[4].buffer = state.buffer
			vim.keymap.set(map[1], map[2], map[3], map[4])
		end
	end
end

function M.should_show()
	local not_embedded = vim.v.argv[2] ~= '--embed'
	local no_args = #vim.v.argv > 1
	if no_args and not_embedded then return false end

	-- taken from mini.starter
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
	if #lines > 1 or (#lines == 1 and lines[1]:len() > 0) then return false end

	-- - Several buffers are listed (like session with placeholder buffers). That
	--   means unlisted buffers (like from `nvim-tree`) don't affect decision.
	local listed_buffers = vim.tbl_filter(
		function(buf_id) return vim.fn.buflisted(buf_id) == 1 end,
		vim.api.nvim_list_bufs()
	)
	if #listed_buffers > 1 then return false end

	-- - There are files in arguments (like `nvim foo.txt` with new file).
	if vim.fn.argc() > 0 then return false end

	return true
end

return M
