local M = {}

--- sets line numbers or relative line numbers but saves the cursor position before
---@param on boolean
---@param relative boolean
function M.set_number(on, relative)
	local cursor = vim.fn.getcurpos()
	if relative then --
		vim.o.relativenumber = on
	else
		vim.o.number = on
		if not on and not relative then --
			vim.o.relativenumber = false
		end
	end
	vim.fn.cursor { select(2, unpack(cursor)) }
end

local ft_ignore = {
	'buffer_manager',
	'harpoon',
}

function M.renu_autocmd(on)
	return function()
		if not vim.o.number then
			if vim.o.relativenumber then vim.o.relativenumber = false end
			return
		end

		if on and not vim.o.relativenumber then
			if vim.tbl_contains(ft_ignore, vim.bo.filetype) then return end
			M.set_number(true, true)
		elseif vim.o.relativenumber then
			M.set_number(false, true)
		end
	end
end

return M
