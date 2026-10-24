return {
	name = 'OpenSCAD',
	-- cmd = { 'openscad-lsp' },
	settings = {
		openscad = {
			search_paths = '/libs',
			fmt_exe = '/home/huy/.local/bin/clang-format',
			fmt_style = 'file',
			default_param = true,
		},
	},
}
