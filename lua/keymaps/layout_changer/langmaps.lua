local M = {}

--- split string by separator (space by default)
---@param input string string to separate
---@param sep string? separator to separate with
function string.split(input, sep)
	sep = sep or '%s'
	local t = {}
	for str in string.gmatch(input, '([^' .. sep .. ']+)') do
		table.insert(t, str)
	end
	return t
end


M.qwerty = string.split([[
	q w e r t y u i o p
	a s d f g h j k l ;
	z x c v b n m , . /

	Q W E R T Y U I O P
	A S D F G H J K L :
	Z X C V B N M < > ?
]])

M.colemak = string.split([[
	q w f p / : h u y j
	a r s t g m n e i o
	z x c d , . l k b v

	Q W F P ? ; H U Y J
	A R S T G M N E I O
	Z X C D < > L K B V
]])

M.custom_mappings = string.split([[
	q o v p n ~ b w e z
	a i c y g h j k l :
	s x r d , . u f t /

	Q O V P N | B W E Z
	A I C Y G H J K L ;
	S X R D < > U F T ?
]])

M.minimal_changes = string.split([[
	q b w e t f u i o p
	a r y d g h j k l :
	z x c v s m n , . /

	Q B W E T Y U I O P
	A R Y D G H J K L ;
	Z X C V S F N < > ?
]])

-- S can be used for someting else since its useless
M.word_nav_gap = string.split([[
	s r y p /  g u i a o
	q b v w e  h j k l :
	z x c d ,  ; n t f .

	S R Y P ?  G U I A O
	Q B V W E  H J K L ;
	Z X C D <  > N T F .
]])

local function escape(str)
	-- You need to escape these characters to work correctly
	local escape_chars = [[;,."|\]]
	return vim.fn.escape(str, escape_chars)
end

function M.langmap(from, to, disable)
	from = type(from) == 'table' and table.concat(from) or from
	to = type(to) == 'table' and table.concat(to) or to

	if disable then vim.opt.langmap = '' end

	-- | `to` should be first | `from` should be second
	vim.opt.langmap = vim.fn.join({ escape(from) .. ';' .. escape(to) }, ',')
	-- vim.o.langremap
end

return M
