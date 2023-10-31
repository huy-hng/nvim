local py = require('plugins.lsp.servers.python')

return {
	root_dir = py.get_root_dir,
	settings = {
		python = {
			analysis = {
				typeCheckingMode = 'basic', -- ["off", "basic", "strict"]
				autoImportCompletions = true,
				autoSearchPaths = true,
				diagnosticMode = 'workspace', -- ["openFilesOnly", "workspace"]
				useLibraryCodeForTypes = true,
			},
		},
	},
	-- NOTE: on_new_config only gets executed on bufenter. If lspconfig is lazy loaded
	--       it gets loaded after bufenter, ergo the pythonPath is not updated.
	on_new_config = function(new_config, new_root_dir)
		-- print('on new config', new_root_dir)
		-- new_config.root_dir = new_root_dir
		-- new_config.root_dir = '/home/huy/repositories/roseville/arst'
		-- new_root_dir = '/home/huy/repositories/roseville/arst'
		-- py.init(new_config, new_root_dir)
		-- new_config.cmd_env.PATH = py.env(new_root_dir) .. new_config.cmd_env.PATH

		-- not needed apparently
		-- new_config.settings.python.pythonPath = vim.fn.exepath('python')
		-- new_config.settings.python.analysis.extraPaths = { py.pep582(new_root_dir) }

		-- py.get_venv_path(new_config.root_dir, function(venv_path)
		-- 	local python_path = venv_path .. '/bin/python'
		-- 	new_config.settings.python.pythonPath = python_path

		-- 	print(new_config.root_dir)
		-- 	print(new_config.settings.python.pythonPath)
		-- 	print(' ')
		-- end)
	end,

	on_attach = function(client, bufnr)
		-- py.get_venv_path(client.config.root_dir, function(venv_path)
		-- 	local python_path = venv_path .. '/bin/python'
		-- 	client.config.settings.python.pythonPath = python_path
		-- 	vim.b[bufnr].pythonPath = python_path

		-- 	print(bufname)
		-- 	print(client.config.root_dir)
		-- 	print(client.config.settings.python.pythonPath)
		-- 	print('')
		-- end)

		-- print('on attach')
	end,

	before_init = function(initialize_params, config)
		-- print('before init')
	end,

	on_init = function(client, initialize_result)
		-- print('on init')
		-- P(client)
		-- P(initialize_result)
	end,

	commands = {
		PyrightOrganizeImports = {
			py.organize_imports,
			description = 'Organize Imports',
		},
		PyrightSetPythonPath = {
			py.set_python_path,
			description = 'Reconfigure pyright with the provided python path',
			nargs = 1,
			complete = 'file',
		},
		PyrightUpdateEnv = {
			function() py.set_python_path() end,
			description = 'Update pyright environment',
		},
	},
}
