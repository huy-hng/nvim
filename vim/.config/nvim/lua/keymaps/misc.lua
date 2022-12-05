----------------------------------------
--        -> Abbreviations <-
----------------------------------------
local cnoreabbrev = vim.cmd.cnoreabbrev

cnoreabbrev('telp', 'tab help')
cnoreabbrev('hvw', 'tab help vimwiki')
cnoreabbrev('sovim', 'so $HOME/.config/nvim/init.vim')
cnoreabbrev('solua', 'so $HOME/.config/nvim/init.lua')

cnoreabbrev('h', 'vertical h')
cnoreabbrev('vwtoc', 'VimwikiTOC')
cnoreabbrev('packi', 'PackerInstall')
cnoreabbrev('kirbs', [[s/\(.*\)]])

vim.api.nvim_create_user_command('HighlightFile', 'so $VIMRUNTIME/syntax/hitest.vim', {})
-- vim.cmd [[command! -nargs=1 -complete=help Help :enew | :set buftype=help | :h <args>]]
vim.api.nvim_create_user_command('Help', function(data)
	Exec('enew | set buftype=help | h ' .. data.args)
end, { nargs = 1, complete = 'help' })
