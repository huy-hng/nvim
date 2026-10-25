local M = {}

local config = require('plugins.editor.alpha.config')

function M.pad(text, width)
	width = width or config.width
	local needed_spaces = width - string.len(text)
	local padded_name = text .. nvim.Repeat(' ', needed_spaces)
	return padded_name
end

-- TODO:
function M.pad3(text_segments, width)
	local total_length = #string.join(text_segments)
	local space_needed = width - total_length
	local space_between_segments = math.round(space_needed / (#text_segments - 1), 0)
	return string.join(text_segments, nvim.Repeat(' ', space_between_segments))
end

function M.pad_text(val, width)
	if type(val) == 'function' then --
		return function() M.pad(val(), width) end
	elseif type(val) == 'string' then
		return M.pad(val, width)
	elseif type(val) == 'table' then
		return table.map(function(elem) return M.pad(elem, width) end, val)
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

-- similar style how extmarks does highlighting
function M.hl_arr(tbl)
	local lines, all_hls = {}, {}

	for _, line in ipairs(tbl) do
		local line_str = ''

		local hls = {}
		for _, segment in ipairs(line) do
			local hl_start = #line_str
			line_str = line_str .. (segment[1] or '')
			local hl_end = #line_str

			local hl = { segment[2], hl_start, hl_end }

			table.insert(hls, hl)
		end
		table.insert(all_hls, hls)
		table.insert(lines, line_str)
	end
	return lines, all_hls
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
