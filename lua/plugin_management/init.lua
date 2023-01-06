require('plugin_management.ensure_lazy')

local config = require('plugin_management.config')
require('lazy').setup('plugins', config)

-- local group = vim.api.nvim_create_augroup('startertest2',{})
-- vim.api.nvim_create_autocmd('User', {
-- 	group = group,
-- 	pattern = { 'LazyDone', 'VeryLazy', 'LazyVimStarted' },
-- 	callback = function(data) print(data.event) end,
-- })
