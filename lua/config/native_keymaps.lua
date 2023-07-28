local function upper_mod(keys)
	local modified = {
		leader = {},
		localleader = {},
		ctrl = {},
		alt = {},
	}
	for native, translated in pairs(keys) do
		local up_native = string.upper(native)
		local up_translated = string.upper(translated)

		modified[up_native] = up_translated

		modified.ctrl[native] = string.format('<C-%s>', translated)
		modified.alt[native] = string.format('<A-%s>', translated)
		modified.alt[up_native] = string.format('<A-%s>', up_translated)

		modified.leader[native] = string.format('<leader>%s', translated)
		modified.leader[up_native] = string.format('<leader>%s', up_translated)

		modified.localleader[native] = string.format('<localleader>%s', translated)
		modified.localleader[up_native] = string.format('<localleader>%s', up_translated)
	end
	return modified
end

-- left side should be native qwerty and right side should be new location of that keymap
local og_letters = {
	-- operators
	i = 'i',
	a = 'a',
	o = 'o',
	r = 'r',
	v = 'v',
	p = 'p',
	y = 'y',

	d = 'd',
	c = 'c',

	-- movement
	b = 'b',
	w = 'w',
	e = 'e',

	h = 'h',
	j = 'j',
	k = 'k',
	l = 'l',

	-- misc
	g = 'g',
	t = 't',
	f = 'f',
	u = 'u',
	n = 'n',
	x = 'x',
}

local letters = {
	-- operators
	i = 'u',
	a = 'y',
	o = 'o',
	r = 'w',
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
	m = 'v',
	g = 'j',
	t = 'k',
	f = 'b',
	u = 'h',
	n = 'l',
	x = 'x',
}

local functions = {
	file_explorer = 'p',
	harpoon = 'h',
	telescope = 't',
	fold_navigation = 'f',
	save_file = 'f',
	comment = 'v',
}

local special_keys = {
	enter = '<CR>',
	backspace = '<BS>',
}

local unique = {
	yy = 'ff',
	vv = 'ss',
	gg = 'jj',
	ge = 'a',
	gE = 'A',
	redo = '<C-h>',
}

local upper_mod_letters = upper_mod(letters)
local upper_mod_functions = upper_mod(functions)
Keys = vim.tbl_deep_extend(
	'keep',
	{},
	unique,

	letters,
	upper_mod_letters,

	functions,
	upper_mod_functions
)

return Keys
