---@diagnostic disable: param-type-mismatch

-- TODO: refactor both main functions sectionize and sectionize_oneline to one function
-- that takes in basically the same paramaters plus options
-- options could be how many lines before and after should be commented
-- or whether to fill the line with the text with the divider as well

local status, comment = pcall(require, 'Comment.api')
if not status then return end

local create_divider = function(size, divider)
	comment.toggle.linewise.current(nil, {})
	local comment_len = vim.fn.strlen(vim.fn.getline('.'))
	local cmd = 'A' .. Repeat(divider, size - comment_len)
	-- Schedule(Feedkeys, cmd)
	Normal(cmd)
end

local function sectionize(size, location, divider, surround)
	Normal('O')
	create_divider(size, divider)

	vim.fn.cursor { vim.fn.line('.') + 1, 1 }

	Normal('i' .. surround[1])
	Normal('A' .. surround[2])

	comment.toggle.linewise.current()

	local text_len = vim.fn.strlen(vim.fn.getline('.'))
	local text_middle = vim.fn.floor(text_len / 2.0)
	local spaces = location * size - text_middle
	spaces = spaces - 2

	vim.fn.cursor { vim.fn.line('.'), 2 }
	Normal('wi' .. Repeat(' ', vim.fn.float2nr(spaces)))
	Normal('o')
	create_divider(size, divider)
end

-- comments line and returns length of comment string
local function comment_and_length()
	local line_len_before = vim.fn.strlen(vim.fn.getline('.'))
	comment.toggle.linewise.current(nil, {})
	local line_len_after = vim.fn.strlen(vim.fn.getline('.'))

	return line_len_after - line_len_before
end

local function set_cursor_col(col) vim.fn.cursor { vim.fn.line('.'), col } end

local function sectionize_oneline(size, location, divider, surround)
	local comment_len = comment_and_length()
	if comment_len == 0 then comment_len = 1 end
	set_cursor_col(comment_len)

	Normal('a' .. surround[1])
	Normal('A' .. surround[2])

	local text_len = string.len(vim.fn.getline('.'))
	local text_middle = vim.fn.floor(text_len / 2.0)
	local left_dividers = location * size - text_middle - comment_len
	local right_dividers = size - left_dividers - text_len

	left_dividers = vim.fn.float2nr(left_dividers)

	set_cursor_col(comment_len)
	Normal('a' .. Repeat(divider, left_dividers))
	Normal('A' .. Repeat(divider, right_dividers))
end

Commander('SmallSection', { sectionize, 80, 0.5, '-', { '-> ', ' <-' } })
Commander('BigSection', { sectionize, 80, 0.5, '=', { '|=> ', ' <=|' } })
Commander('BigSection', { sectionize, 100, 0.5, '=', { '', '' } })
Commander('OnelineSection', { sectionize_oneline, 100, 0.5, '-', { '-', '-' } })
