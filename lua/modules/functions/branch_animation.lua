local function is_white_space(str) return str:gsub('%s', '') == '' end

local symbol_lookup = { '˥', '˦', '˧', '˨', '˩' }

---@param digits string
local function convert_digits_to_symbols(digits)
	local symbols = ''
	for i = 1, #digits do
		local digit = tonumber(digits:sub(i, i))
		if not digit then return symbols end
		symbols = symbols .. (symbol_lookup[digit] or '')
	end
	return symbols
end

local ns = vim.api.nvim_create_namespace('AnimationHelper')
local function set_extmark(bufnr, row, symbols)
	local mark_opts = {
		virt_text = { { symbols } },
		virt_text_pos = 'eol',
		hl_mode = 'combine',

		-- virt_text_win_col = 4,
		virt_lines_leftcol = true,
		virt_lines_above = true,
	}

	vim.api.nvim_buf_set_extmark(bufnr, ns, row, 0, mark_opts)
end

local function remove_extmarks(bufnr) vim.api.nvim_buf_clear_namespace(bufnr or 0, ns, 0, -1) end

local function set_extmarks(bufnr)
	remove_extmarks(bufnr)
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, true)

	for i, line in ipairs(lines) do
		if not is_white_space(line) then
			local symbols = convert_digits_to_symbols(line)
			set_extmark(bufnr, i - 1, symbols)
		end
	end
end

Map.n('<localleader>h', function()
	local bufnr = vim.api.nvim_get_current_buf()
	Augroup('AnimationHelper', {
		Autocmd(
			{ 'BufWrite', 'TextChanged', 'TextChangedI' },
			nil,
			function() set_extmarks(bufnr) end,
			{ buffer = bufnr }
		),
	})
end)

Map.n('<localleader>u', function()
	remove_extmarks()
	DeleteAugroup('AnimationHelper')
end)
