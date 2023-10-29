-- vim.opt_local.expandtab = false

local noice = nrequire('noice')

local function execute()
	vim.cmd.write()
	vim.cmd('!$PYTHONPATH %')
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
	noice.redirect(pretty_print_output, {
		{ view = false, filter = { event = 'msg_show' }, skip = true },
	})
end

local cmd = noice and redirect_output or execute

Map.n('<localleader>r', cmd, 'Run current Python file', { buffer = true })
