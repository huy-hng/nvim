local M = {}

local function split(input, sep)
	sep = sep or '%s'
	local t = {}
	for str in string.gmatch(input, '([^' .. sep .. ']+)') do
		table.insert(t, str)
	end
	return t
end

M.qwerty = split([[
	q w e r      u i o p
	a s d f g  h j k l ;
	z x c v      m , . /

	Q W E R      U I O P
	A S D F G  H J K L :
	Z X C V      M < > ?
]])

M.colemak = split([[
	q w f p      h u y j
	a r s t g  m n e i o
	z x c d      l k b v

	Q W F P      H U Y J
	A R S T G  M N E I O
	Z X C D      L K B V
]])

-- S can be used for someting else since its useless
M.word_nav_gap = split([[
	q r y p      u i a g
	s b v w e  h j k l o
	z x c d      n t f v

	Q R Y P      U I A G
	S B V W E  H J K L O
	Z X C D      N T F V
]])

M.colemak_lower = split([[
	q w f p      h u y j
	a r s t g  m n e i o
	z x c d      l k b v
]])

M.custom = split([[
	_ t _ _      _ _ _ _
	_ _ _ w _  _ _ _ _ _
	_ _ _ _      _ _ _ _
]])

local function escape(str)
	-- You need to escape these characters to work correctly
	local escape_chars = [[;,."|\]]
	return vim.fn.escape(str, escape_chars)
end

function M.minimize(from_keys, to_keys)
	local combined = {}
	for i, to in ipairs(to_keys) do
		if to ~= '_' then
			local from = from_keys[i]
			table.insert(combined, from .. to)
			table.insert(combined, string.upper(from) .. string.upper(to))
		end
	end
	return vim.fn.join(combined, ',')
end

function M.langmap(from, to, disable)
	from = type(from) == 'table' and table.concat(from) or from
	to = type(to) == 'table' and table.concat(to) or to

	if disable then
		vim.opt.langmap = ''
		return
	end

	vim.opt.langmap = vim.fn.join({ escape(from) .. ';' .. escape(to) }, ',')
	-- vim.o.langremap
end

return M
