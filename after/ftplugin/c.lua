vim.o.commentstring = '// %s'
Map.n(
	'<localleader>h',
	vim.cmd.ClangdSwitchSourceHeader,
	'Switch between Source and Header',
	{ buffer = true }
)
