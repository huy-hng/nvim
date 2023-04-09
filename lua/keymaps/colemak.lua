local remap = MapCreator({'v', 'n', 'o'}, '', 'Colemak Rebinds', { remap = false })
-- local remap = MapCreator('n', '', 'Colemak Rebinds', { remap = false })
-- local reremap = MapCreator({'n'}, '', 'Colemak Rebinds', { remap = false })



-- local remap = MapCreator('i', '', 'Colemak Rebinds', { remap = false })
-- local remap = MapCreator('n', '', 'Colemak Rebinds')

-- local function remap(qwerty, colemak) remap(colemak, qwerty) end

local qwerty_to_colemak = {
	-- { 'q', 'q' },
	-- { 'w', 'w' },
	{ 'e', 'f' },
	{ 'r', 'p' },
	{ 't', '/' },
	{ 'T', '?' },
	{ 'y', ':' },
	{ 'Y', ';' },
	{ 'u', 'h' },
	{ 'i', 'u' },
	{ 'o', 'y' },
	{ 'p', 'j' },

	-- { 'a', 'a' },
	{ 's', 'r' },
	{ 'd', 's' },
	{ 'f', 't' },
	-- { 'g', 'g' },
	{ 'h', 'm' },
	{ 'j', 'n' },
	{ 'k', 'e' },
	{ 'l', 'i' },
	{ ':', 'o' },

	-- { 'z', 'z' },
	-- { 'x', 'x' },
	-- { 'c', 'c' },
	{ 'v', 'd' },
	{ 'b', ',' },
	{ 'B', '<' },
	{ 'n', '.' },
	{ 'N', '>' },
	{ 'm', 'l' },
	{ ',', 'k' },
	{ '.', 'b' },
	{ '/', 'v' },
}



local function set_qwerty_to_colemak()
	for _, pair in ipairs(qwerty_to_colemak) do
		remap(pair[2], pair[1])
		-- Imap(pair[1], pair[2])
		-- Cmap(pair[1], pair[2])
		-- Omap(pair[1], pair[2])
	end
end

-- local function set_colemak_to_qwerty()
-- 	for _, pair in ipairs(qwerty_to_colemak) do
-- 		reremap(pair[2], pair[1])
-- 	end
-- end

local function native_remaps()
	remap('f','e')
	remap('p','r')
	remap('/','t')
	remap(':','y')
	remap('h','u')
	remap('u','i')
	remap('y','o')
	remap('j','p')

	remap('r','s')
	remap('s','d')
	remap('t','f')
	remap('m','h')
	remap('n','j')
	remap('e','k')
	remap('i','l')
	remap('o',':')

	remap('d','v')
	remap('.','b') -- goes to 'n' on other splitkb side
	remap('l','n')
	remap('k','m')
	remap('b','.')
	remap('v','/')

	-- remap('v', '/')
end

local function alternate_remap()
	remap('h', 'n')
	remap('j', 'e')
	remap('k', 'i')
	remap('l', 'o')
end

-- alternate_remap()
-- native_remaps()
-- set_qwerty_to_colemak()

-- remap('q', 'q')
-- remap('w', 'w')
-- remap('e', 'e')
-- remap('r', 'r')
-- remap('t', 't')
-- remap('y', 'y')
-- remap('u', 'u')
-- remap('i', 'i')
-- remap('o', 'o')
-- remap('p', 'p')

-- remap('a', 'a')
-- remap('s', 's')
-- remap('d', 'd')
-- remap('f', 'f')
-- remap('g', 'g')
-- remap('h', 'h')
-- remap('j', 'j')
-- remap('k', 'k')
-- remap('l', 'l')
-- remap(';', ':')

-- remap('z', 'z')
-- remap('x', 'x')
-- remap('c', 'c')
-- remap('v', 'v')
-- remap('b', 'b')
-- remap('n', 'n')
-- remap('m', 'm')
-- remap(',', ',')
-- remap('.', '.')
-- remap('/', '/')
