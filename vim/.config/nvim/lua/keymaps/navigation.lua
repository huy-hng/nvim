--==============================================================================
--                              |=> Windows <=|
--==============================================================================

-- Move between windows
nmap('<C-h>', '<C-W>h')
nmap('<C-j>', '<C-W>j')
nmap('<C-k>', '<C-W>k')
nmap('<C-l>', '<C-W>l')


-- resize windows with arrow keys
nmap('<Up>',    CMD('resize -4'))
nmap('<Down>',  CMD('resize +4'))
nmap('<Left>',  CMD('vertical resize -4'))
nmap('<Right>', CMD('vertical resize +4'))

-- nmap('<S-Up>',    '<cmd>aboveleft split<CR><cmd>bnext<CR><cmd>wincmd p<CR>')
-- nmap('<S-Down>',  '<cmd>belowright split<CR><cmd>bnext<CR><cmd>wincmd p<CR>')
-- nmap('<S-Left>',  '<cmd>belowright vsplit<CR><cmd>bnext<CR><cmd>wincmd p<CR>')
-- nmap('<S-Right>', '<cmd>vsplit<CR><cmd>bnext<CR><cmd>wincmd p<CR>')
--==============================================================================
--                                |=> Tabs <=|
--==============================================================================

nmap('<leader>tn', CMD('tabnew'), 'Open new Tab')
nmap('<leader>tc', CMD('tabclose'), 'Close Tab')

nmap('<leader>to', CMD('tabonly'), 'Close all Tabs except current')
nmap('<leader>th', CMD('tabmove -'), 'Move Tab left')
nmap('<leader>tl', CMD('tabmove +'), 'Move Tab right')

nmap('<leader>h', CMD('tabprevious'), 'Previous Tab')
nmap('<leader>l', CMD('tabnext'), 'Next Tab')
