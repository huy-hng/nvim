local function upper_mod(keys)
	local modified = {
		leader = {},
		lleader = {},
		ctrl = {},
		alt = {},
	}
	for native, translated in pairs(keys) do
		local up_native = string.upper(native)
		local up_translated = string.upper(translated)

		modified[up_native] = up_translated

		modified.ctrl[native] = string.format('<C-%s>', translated)
		-- modified.ctrl[up_native] = string.format('<C-%s>', up_translated)
		modified.alt[native] = string.format('<A-%s>', translated)
		modified.alt[up_native] = string.format('<A-%s>', up_translated)

		modified.leader[native] = string.format('<leader>%s', translated)
		modified.leader[up_native] = string.format('<leader>%s', up_translated)

		modified.lleader[native] = string.format('<localleader>%s', translated)
		modified.lleader[up_native] = string.format('<localleader>%s', up_translated)
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
	q = 'q',
}

local letters = {
	-- operators
	i = 'u',
	a = 'y',
	o = 'o',
	v = 's',
	p = 'p',
	y = 'f',

	r = 'w',
	s = 'W',

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
	q = 'q',
}

local functions = {
	file_explorer = 'p',
	harpoon = 'h',
	telescope = 't',
	fold_navigation = 'f',
	save_file = 'f',
	comment = 'v',

	join_lines = 'j',
	cmdline_window = '<leader>:',
	search_window = '<leader>/',
	-- cmdline_window = '<C-:>',
	-- search_window = '<C-/>',
	-- message_history = '<leader>/',
	message_history = '<C-/>',
	plugin_manager = '<C-A-P>',
	start_screen = '<leader>s',
	open_fold = '<A-i>',
	close_fold = '<A-m>',
}

local keys = {
	-- special keys
	esc = '<esc>',
	enter = '<cr>',
	space = '<space>',
	backspace = '<bs>',

	up = '<up>',
	down = '<down>',
	left = '<left>',
	right = '<right>',

	-- unique
	yy = 'ff',
	vv = 'ss',
	gg = 'jj',
	ge = 'a',
	gE = 'A',
	redo = '<C-h>',
}

local letters_upper_mod = upper_mod(letters)
local functions_upper_mod = upper_mod(functions)
keys = vim.tbl_deep_extend(
	'keep',
	keys,
	letters,
	letters_upper_mod,
	functions,
	functions_upper_mod
)
keys.ctrl.enter = '<C-CR>'

return keys
