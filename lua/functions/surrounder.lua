return function (...)
	local args = { ... }
	return function()
		local char1 = args[1]
		local char2 = args[1]
		if #args > 1 then
			char2 = args[2]
		end

		nvim.feedkeys('<esc>`>a' .. char2 .. '<esc>`<i' .. char1 .. '<esc>')
		-- move_selection(vim.fn.strlen(char1))
		local len = vim.fn.strlen(char1)
		nvim.feedkeys('gv' .. len .. 'lo' .. len .. 'l')
	end
end
