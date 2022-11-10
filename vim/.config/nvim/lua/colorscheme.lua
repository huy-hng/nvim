-- vim.g.colors_name = 'tokyonight-night'
-- vim.cmd "colorscheme tokyonight-night"

-- set colorscheme to nightfly with protected call
-- in case it isn't installed
-- local status, _ = pcall(vim.cmd, "colorscheme nightfly")
-- if not status then
-- 	  print("Colorscheme not found!") -- print error if colorscheme not installed
--   return
-- end

require('catppuccin').setup()
vim.g.catppuccin_flavour = 'latte' -- latte, frappe, macchiato, mocha
ColorTheme = 'catppuccin-mocha'
-- ColorTheme = 'tokyonight-night'
-- ColorTheme = 'tokyonight-day'

function SetColors(theme)
	if theme then
		ColorTheme = theme
	end
	vim.cmd('colorscheme ' .. ColorTheme)
	vim.cmd 'highlight Folded guibg=none'
end

-- 'tokyonight' -- this is same as storm
-- 'tokyonight-day'
-- 'tokyonight-storm'
-- 'tokyonight-moon'
-- 'tokyonight-night'
SetColors()
