
function test()
	id = vim.fn.win_getid(vim.fn.winnr())
	cond = vim.g.statusline_winid == id
	-- print(cond)
	print(vim.g.statusline_winid)

	if cond then
		return 'ues'
	else
		return 'no'
	end
	-- print(focused)
end
