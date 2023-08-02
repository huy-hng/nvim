local g = vim.g
-- g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
g.qs_highlight_on_keys = {}

local M = {
	'unblevable/quick-scope',
	keys = g.qs_highlight_on_keys,
	event = 'VeryLazy',
	-- lazy = false,
}

function M.config()
	g.qs_enable = 1
	g.qs_ignorecase = 0
	Map(Keys.t, '<Plug>(QuickScopet)')
	Map(Keys.T, '<Plug>(QuickScopeT)')
	Map(Keys.f, '<Plug>(QuickScopef)')
	Map(Keys.F, '<Plug>(QuickScopeF)')

	-- local copy = g.qs_accepted_chars
	-- for _, val in ipairs({ '{', '}', '[', ']', 'alskdj3joqiweds' }) do
	-- 	table.insert(copy, val)
	-- end
	-- g.qs_accepted_chars = copy

	g.qs_filetype_blacklist = { 'alpha' }

	-- vim.cmd([[
	-- augroup qs_colors
	-- 	autocmd!
	-- 	autocmd ColorScheme * highlight QuickScopePrimary guifg='#ff4400' gui=bold ctermfg=155 cterm=underline
	-- 	autocmd ColorScheme * highlight QuickScopeSecondary guifg='#ff8800' gui=bold,italic ctermfg=81 cterm=underline
	-- augroup END
	-- ]])

	local set_colors = function()
		vim.cmd.highlight('QuickScopePrimary guifg=#ff4400 gui=bold,underline')
		vim.cmd.highlight('QuickScopeSecondary guifg=#44ffff gui=bold,italic,underline')
	end
	set_colors()

	Augroup('qs_colors', {
		Autocmd('ColorScheme', '*', set_colors),
	})
end

return M
