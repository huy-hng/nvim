-- vim.opt_local.expandtab = false

local noice = nrequire('noice')
local winman = R('modules.window_manager')

local function execute()
	vim.cmd.write()

	local bufnr = vim.api.nvim_get_current_buf()

	local python_path = vim.b[bufnr].pythonPath
	python_path = python_path or '$(which python)'

	-- print(python_path, )
	-- vim.cmd(string.format('!%s %%', python_path))
	-- print()
	vim.cmd('!python %')
end

local function pretty_print_output()
	local separator_length = 80
	print('.' .. nvim.Repeat(' ', separator_length - 2) .. '.')
	print(nvim.Repeat('-', separator_length))
	print('.' .. nvim.Repeat(' ', separator_length - 2) .. '.')
	execute()
end

local function redirect_output()
	if not noice then return end

	local win = winman.get_win_by_filetype('noice')

	-- noice.redirect(pretty_print_output, {
	-- 	{ view = 'vsplit', filter = { event = 'msg_show' }, skip = true },
	-- })

	execute()

	if not win then return end

	-- set active win to noice win, put the last line at top and switch back to prev win
	local curr_win = winman.get_win()
	nvim.schedule(function ()
		winman.set_win(win.id)
		nvim.normal(tostring(win.line_count + 1) .. 'zt')
		winman.set_win(curr_win)
	end)
end

local cmd = noice and redirect_output or execute

Map.n('<localleader>r', cmd, 'Run current Python file', { buffer = true })
