local function upper_mod(keys)
	local modified = {
		leader = {},
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
	end
	return modified
end

-- left side should be native qwerty and right side should be new location of that keymap
local letters = {
	-- operators
	i = 'u',
	a = 'y',
	o = 'o',
	-- r = 'w',
	r = 't', -- this is actually the 'w' key but that key has been langmapped to t
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
	-- g = 'g',
	g = 'j',
	t = 'k',
	f = 'b',
	u = 'h',
	n = 'l',
}

local functions = {
	file_explorer = 'p',
	harpoon = 'h',
	telescope = 't',
	fold_navigation = 'f',
	save_file = 'f',
	comment = 'v',
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
