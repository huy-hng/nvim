----------------------------------------------Windows-----------------------------------------------
-- Move between windows
Nmap('<C-h>', Util.wrap(vim.cmd.wincmd, 'h'))
Nmap('<C-j>', Util.wrap(vim.cmd.wincmd, 'j'))
Nmap('<C-k>', Util.wrap(vim.cmd.wincmd, 'k'))
Nmap('<C-l>', Util.wrap(vim.cmd.wincmd, 'l'))

-- resize windows with arrow keys
Nmap('<Up>', { nvim.schedule, Util.wrap(vim.cmd.resize, '-4') })
Nmap('<Down>', { nvim.schedule, Util.wrap(vim.cmd.resize, '+4') })
Nmap('<Left>', { nvim.schedule, Util.wrap(vim.cmd.wincmd, '4>') })
Nmap('<Right>', { nvim.schedule, Util.wrap(vim.cmd.wincmd, '4<') })

-- nmap('<S-Up>',    '<cmd>aboveleft split<CR><cmd>bnext<CR><cmd>wincmd p<CR>')
-- nmap('<S-Down>',  '<cmd>belowright split<CR><cmd>bnext<CR><cmd>wincmd p<CR>')
-- nmap('<S-Left>',  '<cmd>belowright vsplit<CR><cmd>bnext<CR><cmd>wincmd p<CR>')
-- nmap('<S-Right>', '<cmd>vsplit<CR><cmd>bnext<CR><cmd>wincmd p<CR>')

-----------------------------------------------Tabs-------------------------------------------------

Nmap('<leader>tn', vim.cmd.tabnew, 'Open new Tab')
Nmap('<leader>tc', vim.cmd.tabclose, 'Close Tab')

Nmap('<leader>to', vim.cmd.tabonly, 'Close all Tabs except current')
Nmap('<leader>th', Util.wrap(vim.cmd.tabmove, '-'), 'Move Tab left')
Nmap('<leader>tl', Util.wrap(vim.cmd.tabmove, '+'), 'Move Tab right')

Nmap('<leader>h', vim.cmd.tabprevious, 'Previous Tab')
Nmap('<leader>l', vim.cmd.tabnext, 'Next Tab')

-------------------------------------------Quickfix List--------------------------------------------

-- nmap('<C-k>', '<cmd>cnext<CR>zz')
-- nmap('<C-j>', '<cmd>cprev<CR>zz')
-- nmap('<leader>k', '<cmd>lnext<CR>zz')
-- nmap('<leader>j', '<cmd>lprev<CR>zz')

-----------------------------------------Fold Navigation Mode---------------------------------------
-- folding shortcuts
Nmap('<A-h>', Util.wrap(pcall, vim.cmd.foldclose))
Nmap('<A-l>', Util.wrap(pcall, vim.cmd.foldopen))
