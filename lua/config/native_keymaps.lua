-- left side should be native qwerty and right side should be new location of that keymap
local insensitive = {
	-- operators
	i = 'u',
	a = 'y',
	o = 'o',
	v = 's',
	p = 'p',
	y = 'f',

	d = 'd',
	c = 'c',

	-- movement
	b = 'r',
	w = 't',
	e = 'g',

	h = 'm',
	j = 'n',
	k = 'e',
	l = 'i',

	-- misc
	g = 'j',
	t = 'k',
	f = 'b',
}

local maps = {
	file_explorer = 'r', -- without modifier

	yy = 'ff',
	vv = 'ss',
	gg = 'jj',
	ge = 'a',
	gE = 'A',
}

-- local upper = {}
for key, value in pairs(insensitive) do
	insensitive[string.upper(key)] = string.upper(value)
	-- upper[key] = string.upper(value)
end
-- maps.upper = upper

return vim.tbl_extend('force', insensitive, maps)
