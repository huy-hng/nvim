---@param mode string?
---@return saved_buffer_keymap[]
local function get_keymaps(mode) return vim.api.nvim_get_keymap(mode or 'n') end

---@param mode string?
---@param bufnr number?
---@return saved_buffer_keymap[]
local function get_buf_keymaps(mode, bufnr)
	return vim.api.nvim_buf_get_keymap(bufnr or 0, mode or 'n')
end

local maps = get_keymaps()
table.sort(maps, function(a, b)
	-- print(a.desc, not a.desc or a.desc == '')
	-- if not a.desc or a.desc == '' then return false end
	-- if not b.desc or b.desc == '' then return false end
	return a.lhs < b.lhs
end)

for i, map in ipairs(maps) do
	-- if map.desc then P(i, map.lhs, map.desc) end
	if map.desc and map.desc ~= '' and not string.starts(map.lhs, '<Plug>') then P(i, map.lhs, map.desc) end
end
