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
	on_new_config = function(new_config, new_root_dir) end,
	on_attach = function(client, bufnr) end,
	before_init = function(initialize_params, config) end,
	on_init = function(client, initialize_result) end,

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
