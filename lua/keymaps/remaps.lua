Nmap('<F1>', '<nop>')

-- Nmap('<space>', '<nop>')
-- Nmap('<space><space>', '<nop>')

Nmap('<S-SPACE>', '<nop>')
Nmap('<C-SPACE>', '<nop>')

Nmap('QQ', 'Q')
Map('Q', 'q')
-- Nmap('q', '<nop>')
-- Nmap('q:', '')
-- Nmap('q/', '')
-- Unmap('n', 'q:')
-- UNmap('n', 'q/')

Map('<C-;>', 'q:')
-- Map(';', ':', '', { callback = function() vim.o.cmdheight = 1 end })
Map(':', ';', '', { silent = false })
Map(';', ':', '', { silent = false })
Nmap('<leader>;', 'q:')
Nmap('<leader>/', 'q/')

-- Remap 0 to first non-blank character
Map('0', '^')
Map('^', '0')
Map('g0', 'g^')
Map('g^', 'g0')

Nmap('vv', 'V')
Nmap('V', 'vg_')
Vmap('V', 'V')

-- break undo sequence before pasting from register
Imap(',', ',<c-g>u')
Imap('.', '.<c-g>u')
Imap(';', ';<c-g>u')
Imap('<C-r>', '<C-g>u<C-r>')
Imap('<C-v>', '<C-g>u<C-r>+')

Cmap('<C-v>', '<C-r>+', 'Paste from clipboard', { silent = false })

-- keep cursor centered when searching
Nmap('n', 'nzzzv')
Nmap('N', 'Nzzzv')

local function direction(next)
	return function()
		local forward = vim.v.searchforward == 1
		local direction = forward and next or next == 'n' and 'N' or 'n'
		return direction .. 'zzzv'
	end
end

Map('n', direction('n'), 'Next search result', { expr = true })
Map('N', direction('N'), 'Next search result', { expr = true })

Nmap('zj', 'zj^', 'Move to the start of the next fold')
Nmap('zk', 'zk^', 'Move to the end of the previous fold')
local has_ufo, ufo = pcall(require, 'ufo')
if has_ufo then Nmap('zk', ufo.goPreviousStartFold, 'Move to the end of the previous fold') end