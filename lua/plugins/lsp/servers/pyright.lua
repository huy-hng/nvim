local py = require('plugins.lsp.servers.python')

return {
	settings = {
		python = {
			analysis = {
				-- typeCheckingMode = 'strict',
				typeCheckingMode = 'basic',
			},
			-- venvPath = '/home/huy/.local/share/virtualenvs/spot_loader-a9V3X1fP/',
			-- venv = 'spot_loader-a9V3X1fP',
		},
	},
	on_new_config = function(new_config, new_root_dir)
		local root_dir = py.env(new_root_dir)
		-- new_config.settings.python.pythonPath = root_dir..'/bin/python'
		new_config.settings.python.pythonPath = vim.fn.exepath('python')
		-- new_config.cmd_env.PATH = py.env(new_root_dir) .. new_config.cmd_env.PATH
		new_config.settings.python.analysis.extraPaths = { py.pep582(new_root_dir) }
	end,
}
