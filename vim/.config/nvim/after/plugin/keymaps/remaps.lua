Nmap('<F1>', '<nop>')

Nmap('<space>', '<nop>')
Nmap('<space><space>', '<nop>')

Nmap('<S-SPACE>', '<nop>')
Nmap('<C-SPACE>', '<nop>')

Nmap('QQ', 'Q')
Map('Q', 'q')
Nmap('q', '<nop>')

Map('<C-;>', 'q:')
-- Map(';', ':', '', { callback = function() vim.o.cmdheight = 1 end })
Map(':', ';', '', { silent = false })
Map(';', ':', '', { silent = false })

Nmap('q:', '<nop>')
Nmap('q/', '<nop>')
Nmap('<leader>:', 'q:')
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
Imap('<C-r>', '<C-g>u<C-r>')
Imap('<C-v>', '<C-g>u<C-r>+')
Cmap('<C-v>', '<C-r>+')

-- keep cursor centered when searching
Nmap('n', 'nzzzv')
Nmap('N', 'Nzzzv')

Nmap('#', '*NN')


Nmap('zj', 'zj^', 'Move to the start of the next fold')
Nmap('zk', 'zk^', 'Move to the end of the previous fold')
local has_ufo, ufo = pcall(require, 'ufo')
if has_ufo then
	Nmap('zk', ufo.goPreviousStartFold, 'Move to the end of the previous fold')
end
