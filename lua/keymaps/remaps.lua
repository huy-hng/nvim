Map.n('<F1>', '')

Map.n('<S-SPACE>', '')
Map.n('<C-SPACE>', '')

Map.nv(Keys.cmdline_window, 'q:')
Map.nv(Keys.search_window, 'q/')

Map('-', '^')
Map('+', '$')

Map('Q', '')
Map(Keys.alt.q, 'q')

local remap = true
if not nrequire('which-key') then
	Map('`', "'", 'Jump to mark in line')
	remap = false
end
Map("'", '`', 'Jump to mark in column', { remap = remap })

-- Map('0', '^')
-- Map('^', '0')
-- Map('g0', 'g^')
-- Map('g^', 'g0')

Map(Keys.v, 'v', 'Visual')
Map.nv(Keys.ctrl.v, '<C-v>')
Map.n(Keys.vv, 'V', 'V-line')
Map.n(Keys.V, 'vg_')
Map.v(Keys.V, 'V')

-- break undo sequence before pasting from register
Map.i(',', ',<c-g>u')
Map.i('.', '.<c-g>u')
Map.i(';', ';<c-g>u')
Map.i('<C-r>', '<C-g>u<C-r>')
Map.i('<C-d>', '<C-g>u<C-r>+')
Map.c('<C-d>', '<C-r>+', 'Paste from clipboard', { silent = false })

local function direction(next)
	return function()
		local forward = vim.v.searchforward == 1
		local dir = forward and next or next == 'n' and 'N' or 'n'
		-- keep cursor centered when searching
		return dir .. 'zzzv'
	end
end

Map(Keys.n, direction('n'), 'Next search result', { expr = true })
Map(Keys.N, direction('N'), 'Next search result', { expr = true })
