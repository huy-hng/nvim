ColorTheme = ''

local status, catppuccin = pcall(require, 'catppuccin')
if status then
	catppuccin.setup()
	ColorTheme = 'catppuccin-mocha'
	-- vim.g.catppuccin_flavour = 'latte' -- latte, frappe, macchiato, mocha
end

-- ColorTheme = 'tokyonight-night'
-- ColorTheme = 'tokyonight-day'

function SetColors(theme)
	-- if ColorTheme == nil then
	-- 	ColorTheme = 'tokyonight-night'
	-- end
	if theme then ColorTheme = theme end
	vim.cmd('colorscheme ' .. ColorTheme)
	vim.cmd('highlight Folded guibg=none')
end

-- 'tokyonight' -- this is same as storm
-- 'tokyonight-day'
-- 'tokyonight-storm'
-- 'tokyonight-moon'
-- 'tokyonight-night'
SetColors()

