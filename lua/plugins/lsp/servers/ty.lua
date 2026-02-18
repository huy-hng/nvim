local py = require('plugins.lsp.servers.python')

return {
	cmd = { 'ty', 'server' },
	filetypes = { 'python' },
	root_dir = vim.fs.root(0, {
		'.git/',
		'pyproject.toml',
		'setup.py',
		'setup.cfg',
		'requirements.txt',
		'Pipfile',
		'Pipfile.lock',
		'poetry.lock',
		'pyrightconfig.json',
	}),
	settings = {
		ty = {
			-- ty language server settings go here
		}
	},

	-- NOTE: on_new_config only gets executed on bufenter. If lspconfig is lazy loaded
	--       it gets loaded after bufenter, ergo the pythonPath is not updated.

	-- on_new_config = function(new_config, new_root_dir) end,
	-- on_attach = function(client, bufnr) end,
	-- before_init = function(initialize_params, config) end,
	-- on_init = function(client, initialize_result) end,

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
