vim.opt_local.expandtab = false

local noice = nrequire('noice')

local function execute()
	vim.cmd.write()
	vim.cmd('!python %')
end
local cmd = execute

local separator_length = 80
if noice then --
	cmd = function()
		noice.redirect(function()
			execute()
			print('.' .. nvim.Repeat(' ', separator_length - 2) .. '.')
			print(nvim.Repeat('-', separator_length))
			print('.' .. nvim.Repeat(' ', separator_length - 2) .. '.')
		end, {
			{
				view = false,
				filter = { event = 'msg_show' },
				-- stop = true,
				skip = true,
			},
		})
	end
end
Map.n('<localleader>r', cmd, 'Run current Python file', { buffer = true })
