local M = {}

--stylua: ignore
local qwerty = {
	-- qwerty
	'q', 'w', 'e', 'r', 't',    'y', 'u', 'i', 'o', 'p',
	'a', 's', 'd', 'f', 'g',    'h', 'j', 'k', 'l', ';',
	'z', 'x', 'c', 'v', 'b',    'n', 'm', ',', ',', '/',

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
local custom_mappings_old = {
	'q', 'o', 'v', 'p', '/',   'n', 'u', 'f', 't', ';',
	'a', 'i', 'c', 'y', 'g',   'h', 'j', 'k', 'l', ':',
	's', 'x',
	'r', 'd', ',',   '.', 'b', 'w', 'e', '/',

	'Q', 'O', 'V', 'P', '?',   'N', 'U', 'F', 'T', ';',
	'A', 'I', 'C', 'Y', 'G',   'H', 'J', 'K', 'L', '~',
	'S', 'X', 'R', 'D', '<',   '>', 'B', 'W', 'E', '?'
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

M.colemak = table.concat(colemak)
M.custom_mappings = table.concat(custom_mappings)
M.qwerty = table.concat(qwerty)

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
