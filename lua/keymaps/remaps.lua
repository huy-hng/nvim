local native = require('config.native_keymaps')

Map.n('<F1>', '')

-- Nmap('<space>', '<nop>')
-- Nmap('<space><space>', '<nop>')

Map.n('<S-SPACE>', '')
Map.n('<C-SPACE>', '')

-- Nmap('QQ', 'Q')
-- Map('Q', 'q')
-- Nmap('q', '<nop>')
-- Nmap('q:', '')
-- Nmap('q/', '')
-- Unmap('n', 'q:')
-- UNmap('n', 'q/')

Map('<C-;>', 'q:')
-- Map(';', ':', '', { callback = function() vim.o.cmdheight = 1 end })
-- Map(':', ';', '', { silent = false })
-- Map(';', ':', '', { silent = false })
Map.n('<leader>;', 'q:')
Map.n('<leader>/', 'q/')

-- Remap 0 to first non-blank character
Map('0', '^')
Map('^', '0')
-- Map('g0', 'g^')
-- Map('g^', 'g0')

Map(native.v, 'v', 'Visual', { langmap = false })
Map(native.vv, 'V', 'V-line', { langmap = false })
Map(native.V, 'vg_o', { langmap = false })
Map(Map.ctrl(native.v), Map.ctrl('v'), { langmap = false })
Map.v(native.V, 'V', { langmap = false })

-- break undo sequence before pasting from register
Map.i(',', ',<c-g>u')
Map.i('.', '.<c-g>u')
Map.i(';', ';<c-g>u')
Map.i('<C-r>', '<C-g>u<C-r>')
Map.i('<C-v>', '<C-g>u<C-r>+')

Map.c('<C-v>', '<C-r>+', 'Paste from clipboard', { silent = false })

local function direction(next)
	return function()
		local forward = vim.v.searchforward == 1
		local direction = forward and next or next == 'n' and 'N' or 'n'
		-- keep cursor centered when searching
		return direction .. 'zzzv'
	end
end

-- Map('n', direction('n'), 'Next search result', { expr = true })
-- Map('N', direction('N'), 'Next search result', { expr = true })

Map.n('zj', 'zj^', 'Move to the start of the next fold')
Map.n('zk', 'zk^', 'Move to the end of the previous fold')
local has_ufo, ufo = pcall(require, 'ufo')
if has_ufo then Map.n('zk', ufo.goPreviousStartFold, 'Move to the end of the previous fold') end
