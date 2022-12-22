----------------------------------------------Windows-----------------------------------------------
-- Move between windows
Nmap('<C-h>', Wrap(vim.cmd.wincmd, 'h'))
Nmap('<C-j>', Wrap(vim.cmd.wincmd, 'j'))
Nmap('<C-k>', Wrap(vim.cmd.wincmd, 'k'))
Nmap('<C-l>', Wrap(vim.cmd.wincmd, 'l'))

-- resize windows with arrow keys
Nmap('<Up>', { Schedule, Wrap(vim.cmd.resize, '-4') })
Nmap('<Down>', { Schedule, Wrap(vim.cmd.resize, '+4') })
Nmap('<Left>', { Schedule, Wrap(vim.cmd.wincmd, '4>') })
Nmap('<Right>', { Schedule, Wrap(vim.cmd.wincmd, '4<') })

-- nmap('<S-Up>',    '<cmd>aboveleft split<CR><cmd>bnext<CR><cmd>wincmd p<CR>')
-- nmap('<S-Down>',  '<cmd>belowright split<CR><cmd>bnext<CR><cmd>wincmd p<CR>')
-- nmap('<S-Left>',  '<cmd>belowright vsplit<CR><cmd>bnext<CR><cmd>wincmd p<CR>')
-- nmap('<S-Right>', '<cmd>vsplit<CR><cmd>bnext<CR><cmd>wincmd p<CR>')

-----------------------------------------------Tabs-------------------------------------------------

Nmap('<leader>tn', vim.cmd.tabnew, 'Open new Tab')
Nmap('<leader>tc', vim.cmd.tabclose, 'Close Tab')

Nmap('<leader>to', vim.cmd.tabonly, 'Close all Tabs except current')
Nmap('<leader>th', Wrap(vim.cmd.tabmove, '-'), 'Move Tab left')
Nmap('<leader>tl', Wrap(vim.cmd.tabmove, '+'), 'Move Tab right')

Nmap('<leader>h', vim.cmd.tabprevious, 'Previous Tab')
Nmap('<leader>l', vim.cmd.tabnext, 'Next Tab')

-------------------------------------------Quickfix List--------------------------------------------

-- nmap('<C-k>', '<cmd>cnext<CR>zz')
-- nmap('<C-j>', '<cmd>cprev<CR>zz')
-- nmap('<leader>k', '<cmd>lnext<CR>zz')
-- nmap('<leader>j', '<cmd>lprev<CR>zz')

-----------------------------------------Fold Navigation Mode---------------------------------------
-- folding shortcuts
Nmap('<A-h>', Wrap(pcall, vim.cmd.foldclose))
Nmap('<A-l>', Wrap(pcall, vim.cmd.foldopen))
