local M = {}

local function printer(...)
	-- print(...)
end
local function Printer(...)
	-- P(...)
end

-- Augroup('Autosaver', {
-- 	Autocmd('BufWritePost', '*/ufo/fold_text_handler.lua', function(data)
-- 		vim.cmd.luafile('lua/plugins/ufo/init.lua')
-- 		Schedule(print, '======================================================================')
-- 	end),
-- })

local function calc_middle(lower, upper) return math.ceil((upper - lower) / 2) + lower end

---@return table | nil
local function bin_search_row(row_num, extmarks)
	local lower = 0
	local upper = #extmarks
	local middle = calc_middle(lower, upper)
	printer('looking for:', row_num)
	for _ = 1, 30 do
		printer('bin', lower, middle, upper)
		local ext_row_num = extmarks[middle][2]
		printer(ext_row_num)
		if ext_row_num > row_num then
			upper = middle
		elseif ext_row_num < row_num then
			lower = middle
		else
			printer('found!')
			return extmarks[middle]
		end
		middle = calc_middle(lower, upper)
	end
end

local function get_ext_marks(ns, lnum)
	local namespaces = vim.api.nvim_get_namespaces()
	local namespace = namespaces[ns]
	-- local cb = ns['neorg-code-blocks']
	if not namespace then return end
	local conceals = vim.api.nvim_buf_get_extmarks(0, namespace, 0, -1, { details = true })
	if #conceals > 0 then return bin_search_row(lnum, conceals) end
end

M.mark_copier = function(virtText, lnum, endLnum, width, truncate)
	local icons = get_ext_marks('neorg-conceals', lnum - 1)

	-- print('-----------------------------------')
	-- for _, chunk in ipairs(virtText) do
	-- 	P(chunk)
	-- end

	local details
	local conceal_pair
	local col_start
	local col_end
	if icons then
		details = icons[4]
		conceal_pair = details.virt_text[1]
		col_start = icons[3] -- this many chars have to be behind the mark
		col_end = details.end_col -- until this col the mark goes (exclusive)

		conceal_pair[1] = conceal_pair[1] .. ' '
		printer('start:', col_start, 'end:', col_end)
		Printer(conceal_pair[1])
		printer(' ')

		-- local conceal_length = #conceal_chars[1]
		-- conceal_length = col_end - col_start - 1
	end
	-- if icons then P(lnum, icons[4].virt_text, virtText) end
	-- if icons then P(lnum, icons, virtText) end

	local curWidth = 0
	local lastWidth = 0
	local newVirtText = {}
	for i, chunk in ipairs(virtText) do
		local chunkText = chunk[1] --[[@as string]]
		lastWidth = curWidth
		curWidth = curWidth + vim.fn.strdisplaywidth(chunkText)

		-- use indent lines
		if chunkText:match('\t') then
			local subbed = chunkText:gsub('\t', '▏   ')
			printer(subbed)
			-- virtText[i][1] = subbed
			-- virtText[i][2] = 'Whitespace'
			table.insert(newVirtText, { subbed, 'IndentLine' })
			goto continue
		end

		if icons then
			printer('last:', lastWidth, 'current:', curWidth, vim.inspect(chunkText))
			if lastWidth >= col_start and curWidth <= col_end then --
				if conceal_pair then
					table.insert(newVirtText, conceal_pair)
					conceal_pair = nil
				end
				goto continue
			end
		end

		table.insert(newVirtText, chunk)

		::continue::
		printer(' ')
	end

	for _, chunk in ipairs(newVirtText) do
		Printer(chunk)
	end

	local completed = get_ext_marks('neorg-completion-level', lnum - 1)
	if completed then
		local details = completed[4]

		for i, pair in ipairs(details.virt_text) do
			if i == 1 then pair[1] = ' ' .. pair[1] end
			if #pair == 1 then table.insert(pair, 'Normal') end
			table.insert(newVirtText, pair)
		end
	end

	local suffix = ('  %d '):format(endLnum - lnum)

	table.insert(newVirtText, { suffix, 'UfoFoldedEllipsis' })

	return newVirtText
end

M.fold_text_handler = function(virt_text, lnum, end_lnum, width, truncate)
	local newVirtText = {}
	local suffix = ('  %d '):format(end_lnum - lnum)
	local suffix_width = vim.fn.strdisplaywidth(suffix)
	local target = width - suffix_width
	local cur_width = 0

	for _, chunk in ipairs(virt_text) do
		local chunk_text = chunk[1]

		-- P(chunk)

		local chunk_width = vim.fn.strdisplaywidth(chunk_text)
		if target > cur_width + chunk_width then
			table.insert(newVirtText, chunk)
		else
			chunk_text = truncate(chunk_text, target - cur_width)
			local hl = chunk[2]
			table.insert(newVirtText, { chunk_text, hl })
			chunk_width = vim.fn.strdisplaywidth(chunk_text)
			-- str width returned from truncate() may less than 2nd argument, need padding
			if cur_width + chunk_width < target then
				suffix = suffix .. (' '):rep(target - cur_width - chunk_width)
			end
			break
		end
		cur_width = cur_width + chunk_width
	end

	table.insert(newVirtText, { suffix, 'UfoFoldedEllipsis' })
	return newVirtText
end

M.inspectVirtTextForFoldedLines = function(virtText, lnum, endLnum, width, truncate, ctx)
	P(ctx)
	P(virtText)
	-- for i = lnum, endLnum do
	-- 	P(i, ctx.get_fold_virt_text(i))
	-- end
	return virtText
end

return M
