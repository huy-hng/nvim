local M = {}

-- available comparisons from cmp.config.compare ordered by default ordering
-- compare.offset, -- in python offset is the same everywhere
-- compare.exact, -- if whats written is exactly found in the completion menu
-- compare.scopes, -- i think ranks stuff in the same scope higher (off by default)
-- compare.score, -- in python score is the same everywhere, in lua in ranks lsp stuff higher
-- compare.recently_used,
-- compare.locality, -- no clue what this does, i think which code is closer?
-- compare.kind, -- sort by kind (method, enum, function, etc.)
-- compare.sort_text, -- kinda sorts alphabetically but not quite
-- compare.length,
-- compare.order, -- perfect for python: putting __ completions further down



-- %s/^<\(.*\)>{/local entry_\1 = {
-- %s/= <\(.*\)>{/= {
-- %s/<\(.*\)> = {/\1 = {
-- %s/= <\(.*\)>{/=
-- %s/ <\(.*\)>{/{/
-- %s/= <\(.*\)>,/= '\1',/
-- %s/= <\(.*\)>/= '\1'/
-- %s/<\(table .\)>,/'\1',/g
-- %s/<\(table ..\)>,/'\1',/g
-- %s/, <\(table .\)>//g

local CompletionItemKind = {
	Text = 1,
	Method = 2,
	Function = 3,
	Constructor = 4,
	Field = 5,
	Variable = 6,
	Class = 7,
	Interface = 8,
	Module = 9,
	Property = 10,
	Unit = 11,
	Value = 12,
	Enum = 13,
	Keyword = 14,
	Snippet = 15,
	Color = 16,
	File = 17,
	Reference = 18,
	Folder = 19,
	EnumMember = 20,
	Constant = 21,
	Struct = 22,
	Event = 23,
	Operator = 24,
	TypeParameter = 25,
}
local reverse = vim.tbl_add_reverse_lookup(CompletionItemKind)

local kind_mapper =
	{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25 }

local function redir(data)
	return vim.schedule(function()
		local path = '/home/huy/.dotfiles/vim/.config/nvim/lua/plugins/cmp/'
		local file_name = 'comparisons.txt'
		vim.cmd.redir('>> ' .. path .. file_name)
		vim.pretty_print(data)
		vim.cmd.redir('END')
	end)
end

M.order = function(entry1, entry2)
	-- redir({entry1:get_word(), entry2:get_word()})
	local diff = entry1.id - entry2.id
	if diff < 0 then return true end
	-- return false
	-- if diff > 0 then
	-- 	return false
	-- end
	-- if diff < 0 then
	-- 	return true
	-- elseif diff > 0 then
	-- 	return false
	-- end
end

local is_normal = function(name)
	local double = string.starts(name, '__')
	local single = string.starts(name, '_')
	return not (double or single)
end

M.base_comparer = function(entry1, entry2)
	local item_name1 = entry1:get_word()
	local item_name2 = entry2:get_word()
	local normal1 = is_normal(item_name1)
	local normal2 = is_normal(item_name2)

	local better
	local diff = entry1.id - entry2.id
	if diff < 0 then better = true end

	-- local better = (entry1.id - entry2.id) < 0
	return normal1, normal2, better
end

M._underscore = function(entry1, entry2)
	-- entry1:get_vim_item() could also be useful
	local normal1, normal2, better = M.base_comparer(entry1, entry2)
	-- works
	-- if not normal1 then return end
	-- if not normal2 then return true end

	local function printer() P(better, entry1:get_word(), entry2:get_word()) end
	-- if entry1:get_word() == '__doc__' or entry2:get_word() == '__doc__' then
	-- 	print('=====================================')
	-- 	printer()
	-- end

	if better and normal1 and normal2 then return true end
	if better and normal1 and not normal2 then return true end
	if better and not normal1 and normal2 then
		printer()
		return true
	end
	if better and not normal1 and not normal2 then return true end

	-- if not better and     normal1 and     normal2 then return false end
	-- -- if not better and     normal1 and not normal2 then return end
	-- if not better and not normal1 and     normal2 then return true end
	-- if not better and not normal1 and not normal2 then return false end
end

M.underscore = function(entry1, entry2)
	local normal1, normal2, better = M.base_comparer(entry1, entry2)
	-- local better = compare_fn.base_comparer(entry1, entry2)
	-- if not normal1 then return false end
	-- if normal1 and not normal2 then return true end
	if better and normal1 and normal2 then return end
	if better and normal1 and not normal2 then return end
	if better and not normal1 and normal2 then return false end
	if better and not normal1 and not normal2 then return end

	if not better and normal1 and normal2 then return end
	if not better and normal1 and not normal2 then return true end
	if not better and not normal1 and normal2 then return end
	if not better and not normal1 and not normal2 then return end
end

return M
