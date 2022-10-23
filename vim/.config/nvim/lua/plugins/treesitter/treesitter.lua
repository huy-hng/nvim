local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
	return
end

configs.setup({
	-- ensure_installed = {'python', 'lua', 'bash', 'vim', }, -- one of 'all' or a list of languages
	ensure_installed = 'all', -- one of 'all' or a list of languages
	ignore_install = { '' }, -- List of parsers to ignore installing
	auto_install = true,
	-- additional_vim_regex_highlighting = false
})

local parsers = require"nvim-treesitter.parsers"
local ft_to_parser = parsers.filetype_to_parsername
-- ft_to_parser.someft = "python" -- the someft filetype will use the python parser and queries.
-- local avail = parsers.available_parsers()
parsers.filetype_to_parsername['vimwiki'] = 'markdown'
-- parsers.filetype_to_parsername['vimwiki'] = 'markdown_inline'
-- ft_to_parser['vimwiki.markdown'] = nil
-- P(parsers)


