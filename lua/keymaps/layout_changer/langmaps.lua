local M = {}

--stylua: ignore
local qwerty = {
	'q', 'w', 'e', 'r', 't',    'y', 'u', 'i', 'o', 'p',
	'a', 's', 'd', 'f', 'g',    'h', 'j', 'k', 'l', ';',
	'z', 'x', 'c', 'v', 'b',    'n', 'm', ',', '.', '/',

	'Q', 'W', 'E', 'R', 'T',    'Y', 'U', 'I', 'O', 'P',
	'A', 'S', 'D', 'F', 'G',    'H', 'J', 'K', 'L', ':',
	'Z', 'X', 'C', 'V', 'B',    'N', 'M', '<', '>', '?'
}

--stylua: ignore
local colemak = {
	-- colemak
	'q', 'w', 'f', 'p', '/',   ':', 'h', 'u', 'y', 'j',
	'a', 'r', 's', 't', 'g',   'm', 'n', 'e', 'i', 'o',
	'z', 'x', 'c', 'd', ',',   '.', 'l', 'k', 'b', 'v',

	'Q', 'W', 'F', 'P', '?',   ';', 'H', 'U', 'Y', 'J',
	'A', 'R', 'S', 'T', 'G',   'M', 'N', 'E', 'I', 'O',
	'Z', 'X', 'C', 'D', '<',   '>', 'L', 'K', 'B', 'V',
}

--stylua: ignore
local custom_mappings = {
	'q', 'o', 'v', 'p', 'n',   '~', 'b', 'w', 'e', 'z',
	'a', 'i', 'c', 'y', 'g',   'h', 'j', 'k', 'l', ':',
	's', 'x', 'r', 'd', ',',   '.', 'u', 'f', 't', '/',

	'Q', 'O', 'V', 'P', 'N',   '|', 'B', 'W', 'E', 'Z',
	'A', 'I', 'C', 'Y', 'G',   'H', 'J', 'K', 'L', ';',
	'S', 'X', 'R', 'D', '<',   '>', 'U', 'F', 'T', '?'
}

--stylua: ignore
local minimal_changes = {
	'q', 'b', 'w', 'e', 't',    'f', 'u', 'i', 'o', 'p',
	'a', 'r', 'y', 'd', 'g',    'h', 'j', 'k', 'l', ':',
	'z', 'x', 'c', 'v', 's',    'm', 'n', ',', '.', '/',

	'Q', 'B', 'W', 'E', 'T',    'Y', 'U', 'I', 'O', 'P',
	'A', 'R', 'Y', 'D', 'G',    'H', 'J', 'K', 'L', ';',
	'Z', 'X', 'C', 'V', 'S',    'F', 'N', '<', '>', '?',
}

--stylua: ignore
local append_test = {
	'q', 'b', 'w', 'e', 'r',    'y', 'u', 'i', 'o', 'a',
	's', 'r', 'y', 'd', 'g',    'h', 'j', 'k', 'l', ':',
	'z', 'x', 'c', 'v', 't',    'f', 'n', ',', '.', '/',

	'Q', 'B', 'W', 'E', 'R',    'Y', 'U', 'I', 'O', 'P',
	'A', 'S', 'Y', 'D', 'G',    'H', 'J', 'K', 'L', ';',
	'Z', 'X', 'C', 'V', 'T',    'F', 'N', '<', '>', '?',
}

M.colemak = table.concat(colemak)
M.custom_mappings = table.concat(custom_mappings)
M.qwerty = table.concat(qwerty)
M.minimal_changes = table.concat(minimal_changes)
M.append_test = table.concat(append_test)

local function escape(str)
	-- You need to escape these characters to work correctly
	local escape_chars = [[;,."|\]]
	return vim.fn.escape(str, escape_chars)
end

function M.langmap(from, to, disable)
	if disable then vim.opt.langmap = '' end

	-- | `to` should be first | `from` should be second
	vim.opt.langmap = vim.fn.join({ escape(from) .. ';' .. escape(to) }, ',')
	-- vim.o.langremap
end

return M
