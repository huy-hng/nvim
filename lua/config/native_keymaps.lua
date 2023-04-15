-- left side should be native qwerty and right side should be new location of that keymap
return {
	file_explorer = '<C-e>',

	K = 'K', -- lsp hover
	J = 'J', -- join lines

	p = 'p',
	P = 'P',

	y = 'y',
	Y = 'Y',

	d = 'd',
	D = 'D',

	c = 'c',
	C = 'C',

	v = 'v', -- visual
	vv = 'vv', -- visual line
	V = 'V', -- visual until end on line
	['<C-v>'] = '<C-v>', -- visual block

	['<C-d>'] = '<C-d>', -- half page down
	['<C-u>'] = '<C-u>', -- half page up
}
