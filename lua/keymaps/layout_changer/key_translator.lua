local M = {}

local function some(tbl, cb)
	if not vim.tbl_islist(tbl) or vim.tbl_isempty(tbl) then return false end

	for _, item in ipairs(tbl) do
		if cb(item) then return true end
	end

	return false
end

local function split_multibyte(str)
	-- From: https://neovim.discourse.group/t/how-do-you-work-with-strings-with-multibyte-characters-in-lua/2437/4
	local function char_byte_count(s, i)
		local char = string.byte(s, i or 1)

		-- Get byte count of unicode character (RFC 3629)
		if char > 0 and char <= 127 then
			return 1
		elseif char >= 194 and char <= 223 then
			return 2
		elseif char >= 224 and char <= 239 then
			return 3
		elseif char >= 240 and char <= 244 then
			return 4
		end
	end

	local symbols = {}
	for i = 1, vim.fn.strlen(str), 1 do
		local len = char_byte_count(str, i)
		if len then table.insert(symbols, str:sub(i, i + len - 1)) end
	end

	return symbols
end

---Return list of tuples where first elem - start index of keycode, last - end index of keycode
---@param key_seq string[] Lhs like list of chars
---@return table
local function get_keycode_ranges(key_seq)
	local ranges = {}

	for i, char in ipairs(key_seq) do
		if char == '<' then table.insert(ranges, { i }) end

		if char == '>' then
			local last = ranges[#ranges]
			if last and #last < 2 then table.insert(last, i) end
		end
	end

	ranges = vim.tbl_filter(
		function(item) return #item == 2 and (item[2] - item[1]) > 2 end,
		ranges
	)

	return ranges
end

---Checks if lhs if forbidden
---@param lhs string
---@return boolean
local function lhs_forbidden(lhs)
	local matches = { '<plug>', '<sid>', '<snr>', '<C-M>' }
	return some(matches, function(m) return string.lower(lhs):match(m) end)
end

function M.translate_keycode(lhs, from_lang, to_lang)
	if lhs_forbidden(lhs) or #lhs == 1 then return lhs end

	local seq = split_multibyte(lhs)
	local keycode_ranges = get_keycode_ranges(seq)
	local trans_seq = {}
	local in_keycode = false
	local modifiers = { ['<C-'] = true, ['<M-'] = true, ['<A-'] = true, ['<D-'] = true }

	local modifiers_seq = ''
	local modifiers_len = 3

	---Processed char:
	--- - if it inside CTRL, ALT or META - translate char, no translate special code
	--- - if it inside < .. > - no translate but do it uppercase
	--- - if it just char - translate according layout
	---@param char string
	---@param flag boolean Checking if char inside < .. >
	---@param ms string Checking if char inside mod keys (CTRL, ALT, META)
	---@param idx integer Index of current char in sequence
	---@return string
	local function process_char(char, flag, ms, idx)
		local in_modifier = modifiers[ms] and seq[idx - 1] == '-' and seq[idx + 1] == '>'

		if flag and (char:match('[-<>]') or not in_modifier) then return char end

		local tr_char = char
		tr_char = vim.fn.tr(char, from_lang, to_lang)

		-- Ctrl shouldn't be mapped with uppercase letter
		if ms == '<C-' then tr_char = vim.fn.tr(char:lower(), from_lang, to_lang) end

		return tr_char
	end

	local is_in_keycode = function(idx)
		return some(keycode_ranges, function(range) return idx >= range[1] and idx <= range[2] end)
	end

	for i, char in ipairs(seq) do
		in_keycode = is_in_keycode(i)
		-- Reset value of `modifiers_seq` on end `keycode`
		if not in_keycode then
			modifiers_seq = ''
		else
			modifiers_seq = #modifiers_seq < modifiers_len and modifiers_seq .. char:upper()
				or modifiers_seq
		end

		table.insert(trans_seq, process_char(char, in_keycode, modifiers_seq, i))
	end

	local tlhs = table.concat(trans_seq, '')

	local leaders = {
		['<LEADER>'] = vim.g.mapleader,
		['<LOCALLEADER>'] = vim.g.maplocalleader,
	}

	for leader, val in pairs(leaders) do
		if from_lang:find(val, 1, true) then
			local repl = vim.fn.tr(val, from_lang, to_lang)
			local rg = vim.regex('\\c' .. leader)
			local range = { rg:match_str(tlhs) }
			if repl and #range > 0 then
				local found = tlhs:sub(unpack(range))
				tlhs = tlhs:gsub(found, repl)
			end
		end
	end

	return tlhs
end

return M
