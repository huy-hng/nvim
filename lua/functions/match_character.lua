----------------------------------------
--           -> Helpers <-
----------------------------------------

function index_of(array, value)
	for i, v in ipairs(array) do
		if v == value then return i end
	end
	return nil
end

local auto_match = {
	{ '(', ')' },
	{ '[', ']' },
	{ '{', '}' },

	'"',
	"'",
	'<',
	'>',
}

-- local no_auto_match = { '"', "'", '<', '>' }
local no_auto_match = { '"', "'" }
-- no_auto_match = [[\("\)\?\(\'\)\?\(<\)\?\(>\)]]

function MatchCharacter()
	local line = vim.fn.getline('.')
	local col = vim.fn.col('.')

	local char = get_char_under_cursor(line, col)
	if not contains(no_auto_match, char) then
		vim.fn.execute('normal! %')
		return
	end

	local locs = get_matches_in_line(col, char)
	-- print(unpack(locs))

	if table.getn(locs) % 2 ~= 0 then
		print('Odd number of pairs.')
		vim.fn.execute('normal! %')
		return
	end

	local char_index = index_of(locs, col)

	local direction
	if char_index % 2 == 0 then
		direction = -1
	else
		direction = 1
	end

	local target_char_index = char_index + direction

	local target_char_col = locs[target_char_index]
	-- print(target_char_col)

	vim.fn.cursor(line, target_char_col)
	-- print(unpack(locs))

	-- 'bcnswW rm'
	-- local res = vim.fn.searchpos('(', 'eW', vim.fn.line('.')
	-- local res = vim.fn.searchpairpos('\'', '', '\'', 'bcnWrm')
end

function get_matches_in_line(col, char)
	local linenr = vim.fn.line('.')
	-- local curr_col = vim.fn.col('.')

	vim.fn.cursor(linenr, 1)
	local locations = {}
	local num = 0
	while num < 10 do
		local res = vim.fn.searchpos(char, 'eW', linenr)

		if res[1] == 0 and res[2] == 0 then break end
		num = num + 1

		table.insert(locations, res[2])
	end
	vim.fn.cursor(linenr, col)
	return locations
end

function get_char_under_cursor(line, column)
	return vim.fn.matchstr(line, '\\%' .. column .. 'c.')
end

function get_closest()
	print('')
end

function contains(list, x)
	for _, v in pairs(list) do
		if v == x then return true end
	end
	return false
end
