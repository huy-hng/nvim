local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then return end

configs.setup {
	-- ensure_installed = {'python', 'lua', 'bash', 'vim', }, -- one of 'all' or a list of languages
	-- ensure_installed = 'all', -- one of 'all' or a list of languages
	ensure_installed = { 'python', 'lua', 'markdown', 'bash', 'vim', 'javascript', 'json' },
	ignore_install = { '' }, -- List of parsers to ignore installing
	auto_install = true,
	additional_vim_regex_highlighting = true,
}

local parsers = require('nvim-treesitter.parsers')
local ft_to_parser = parsers.filetype_to_parsername
-- ft_to_parser.someft = "python" -- the someft filetype will use the python parser and queries.
-- local avail = parsers.available_parsers()
parsers.filetype_to_parsername['vimwiki'] = 'markdown'
-- ft_to_parser['vimwiki.markdown'] = nil
-- P(parsers)

-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
-- 	group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
-- 	callback = function()
-- 		vim.o.foldmethod = 'expr'
-- 		vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
-- 	end,
-- })
