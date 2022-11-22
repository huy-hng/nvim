-- vim.g.colors_name = 'tokyonight-night'
-- vim.cmd "colorscheme tokyonight-night"

-- set colorscheme to nightfly with protected call
-- in case it isn't installed



local status, catpuccin = pcall(require, 'catpuccin')
if status then
	catpuccin.setup { transparent_background = false, }
	-- vim.g.catppuccin_flavour = 'latte' -- latte, frappe, macchiato, mocha
end
ColorTheme = 'catppuccin-mocha'

-- ColorTheme = 'tokyonight-night'
-- ColorTheme = 'tokyonight-day'

function SetColors(theme)
	-- if ColorTheme == nil then
	-- 	ColorTheme = 'tokyonight-night'
	-- end
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
