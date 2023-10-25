vim.opt_local.expandtab = false

local function execute()
	vim.cmd.write()
	vim.cmd('!$PYTHONPATH %')
end
local cmd = execute

local separator_length = 80

local noice = nrequire('noice')
if noice then --
	cmd = function()
		noice.redirect(function()
			print('.' .. nvim.Repeat(' ', separator_length - 2) .. '.')
			print(nvim.Repeat('-', separator_length))
			print('.' .. nvim.Repeat(' ', separator_length - 2) .. '.')
			execute()
		end, { { view = false, filter = { event = 'msg_show' }, skip = true } })
	end
end

Map.n('<localleader>r', cmd, 'Run current Python file', { buffer = true })
