---@diagnostic disable: undefined-field

local M = {}
local preferences = {}

-- Tree-sitter includes
local ts_parsers = nrequire('nvim-treesitter.parsers')
local ts_highlighter = nrequire('vim.treesitter.highlighter')
local ts_utils = nrequire('nvim-treesitter.ts_utils')

-- Get the configuration's value or its default if not set
local function config(config_key, default_value)
	-- Attempt to get filetype specific config if available
	local ft_preferences = preferences['filetype_' .. vim.bo.filetype]
	if type(ft_preferences) == 'table' then
		local value = ft_preferences[config_key]
		if value ~= nil then return value end
	end

	-- No filetype specific config, try the global one or fallback to default
	local value = preferences[config_key]
	if value == nil then value = default_value end

	return value
end

-- Detect default indentation values (0 for tabs, N for N spaces)
local function get_default_indent()
	if not vim.go.expandtab then return 0 end

	-- If shiftwidth is 0, use tabstop (see: `:help shiftwidth`)
	local spaces = vim.go.shiftwidth
	if spaces == 0 then spaces = vim.go.tabstop end
	return spaces
end

-- Detect if the line is a comment or a string based on Vim's syntax module
local function is_multiline_syn(line_number)
	-- Originally taken from leisiji's code:
	-- https://github.com/leisiji/indent-o-matic/blob/c440898e3e6bcc12c9c24d4867875712c4d1b5f7/lua/indent-o-matic.lua#L51-L57
	local syntax = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.synID(line_number, 1, 1)), 'name')
	return syntax == 'Comment' or syntax == 'String'
end

-- Detect if the line is a comment or a string based on Neovim's tree-sitter module
local function is_multiline_ts(line_number)
	local root_lang_tree = ts_parsers and ts_parsers.get_parser()
	if not root_lang_tree then
		-- No syntax tree => no strings/comments
		return false
	end

	local root = ts_utils and ts_utils.get_root_for_position(line_number, 0, root_lang_tree)
	if not root then
		-- No syntax tree on this line
		return false
	end

	-- Get the node's type for the first character of the line
	local node = root:named_descendant_for_range(0, line_number, 0, line_number)
	local node_type = node:type()

	return node_type == 'comment' or node_type == 'string'
end

-- Get the correct `is_multiline` function based on the current buffer's configuration
local function get_is_multiline_function()
	local buf = vim.api.nvim_get_current_buf()

	if ts_highlighter and ts_highlighter.active[buf] then
		-- Buffer is highlighted through tree-sitter
		return is_multiline_ts
	else
		-- Default fallback
		return is_multiline_syn
	end
end

local function get_options()
	-- Options
	local standard_widths = config('standard_widths', { 2, 4, 8 })
	table.sort(standard_widths)

	-- Figure out the maximum space indentation possible
	local max_indentation
	if #standard_widths == 0 then
		max_indentation = 0
	else
		max_indentation = standard_widths[#standard_widths]
	end

	return {
		max_lines = config('max_lines', 2048),
		skip_multiline = config('skip_multiline', true),
		standard_widths = standard_widths,
		max_indentation = max_indentation,
	}
end

function M.set_indentation(indent, bufnr)
	bufnr = bufnr or 0
	local default = get_default_indent()

	if indent == default then return end
	local expandtab = indent == 0 and false or true

	vim.bo[bufnr].expandtab = expandtab
	if not expandtab then return end

	vim.bo[bufnr].shiftwidth = indent
	vim.bo[bufnr].softtabstop = indent
end

-- Attempt to detect current buffer's indentation and apply it to local settings
function M.detect(data)
	local bufnr = data.buf
	if not vim.api.nvim_buf_is_loaded(bufnr) then return end

	local opt = get_options()
	-- Detect which method to use to detect multiline strings and comments
	local is_multiline
	if opt.skip_multiline then --
		is_multiline = get_is_multiline_function()
	end

	local detected
	-- Loop over every line, breaking once it finds something that looks like a
	-- standard indentation or if it reaches end of file
	for i, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, opt.max_lines, false)) do
		-- Skip empty lines
		if #line == 0 then
			goto continue
		end

		-- If a line starts with a tab then the file must be tab indented
		-- else if it starts with spaces it tries to detect if it's the file's indentation
		local first_char = line:sub(1, 1)
		if first_char == '\t' then
			-- Skip multi-line comments and strings (1-indexed)
			if opt.skip_multiline and is_multiline(i + 1) then
				goto continue
			end

			detected = 0
			break
		elseif first_char == ' ' then
			-- Figure out the number of spaces used and if it should be the indentation
			local j = 2
			while j ~= #line and j < opt.max_indentation + 2 do
				local c = line:sub(j, j)
				if c == '\t' then
					-- Spaces and then a tab? WTF? Ignore this unholy line
					goto continue
				elseif c ~= ' ' then
					break
				end

				j = j + 1
			end

			-- If it's a standard number of spaces it's probably the file's indentation
			j = j - 1
			if vim.tbl_contains(opt.standard_widths, j) then
				-- Skip multi-line comments and strings (1-indexed)
				if opt.skip_multiline and is_multiline(i + 1) then
					goto continue
				end

				detected = j
				break
			end
		end

		-- "We have continue at home"
		::continue::
	end

	if not detected then
		-- vim.notify('Indentation could not be detected.')
		return
	end

	M.set_indentation(detected, bufnr)
	return detected
end

return M
