return {
	name = 'OpenSCAD',
	-- cmd = { 'openscad-lsp' },
	settings = {
		openscad = {
			search_paths = '/libs',
			fmt_exe = '/usr/bin/clang-format',
			fmt_style = 'file',
			default_param = true,
		},
	},
}
