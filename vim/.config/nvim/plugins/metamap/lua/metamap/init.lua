local M = {}

function M.pop_key_from_tbl(tbl, key)
	local value = tbl[key]
	tbl[key] = nil
	return value
end

function M.restore_maps(saved, bufnr)
	for lhs, map in pairs(saved) do
		if type(map) ~= 'table' then
			-- print('Deleting ' .. lhs)
			vim.keymap.del('n', lhs, { buffer = bufnr })
			goto continue
		end
		-- print('Restoring ' .. lhs)

		local mode = M.pop_key_from_tbl(map, 'mode')
		local rhs = M.pop_key_from_tbl(map, 'rhs')
		_ = M.pop_key_from_tbl(map, 'lnum')
		_ = M.pop_key_from_tbl(map, 'lhsraw')
		_ = M.pop_key_from_tbl(map, 'lhs')
		_ = M.pop_key_from_tbl(map, 'sid')
		_ = M.pop_key_from_tbl(map, 'expr')
		vim.keymap.set(mode, lhs, rhs or '', map)

		::continue::
	end
	saved = {}
end

local function look_for_mapping(lhs, maps)
	for _, map in ipairs(maps) do
		if map.lhs == lhs then return map end
	end
end

function M.create_mapper(mode, saved)
	return function(lhs, rhs, desc, opts)
		opts = opts or {}
		local bufnr = vim.api.nvim_get_current_buf()
		local maps = vim.api.nvim_buf_get_keymap(bufnr, mode)

		if not saved[lhs] then
			local map = look_for_mapping(lhs, maps)
			map = map or ''
			saved[lhs] = map
		end

		opts.buffer = bufnr
		-- opts.desc = desc or ''
		-- vim.keymap.set(lhs, rhs, opts)
		Nmap(lhs, rhs, desc, opts)
	end
end

return require('metamap.metamap')
