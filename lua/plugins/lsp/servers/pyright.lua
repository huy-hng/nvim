local py = require('plugins.lsp.servers.python')

local util = require('lspconfig.util')

local root_files = {
	'pyproject.toml',
	'setup.py',
	'setup.cfg',
	'requirements.txt',
	'Pipfile',
	'pyrightconfig.json',
	'.git',
}

local function get_root_dir(fname) --
	return util.root_pattern(unpack(root_files))(fname)
end

return {
	default_config = {
		cmd = { 'pyright-langserver', '--stdio' },
		filetypes = { 'python' },
		root_dir = get_root_dir,
		single_file_support = true,
	},
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
		py.init(new_config, new_root_dir)
		-- new_config.cmd_env.PATH = py.env(new_root_dir) .. new_config.cmd_env.PATH

		-- not needed apparently
		-- new_config.settings.python.pythonPath = vim.fn.exepath('python')
		-- new_config.settings.python.analysis.extraPaths = { py.pep582(new_root_dir) }
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
