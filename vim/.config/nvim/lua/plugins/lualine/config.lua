local status, lualine = pcall(require, 'lualine')
if not status then
	return
end

local components = R('plugins.lualine.components')

local ls_status, symbolwinbar = pcall(require, 'lspsaga.symbolwinbar')
if not ls_status then
	return
end

local cat = require('lualine.themes.catppuccin')
cat.normal.c.bg = 'bg'
cat.inactive.a.bg = 'bg'
cat.inactive.b.bg = 'bg'
cat.inactive.c.bg = 'bg'

lualine.setup {
	options = {
		icons_enabled = true,
		theme = cat,
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = { 'startify' },
			winbar = { 'startify' },
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { components.branch, 'diff', 'diagnostics' },
		lualine_c = { 'filename' },
		lualine_x = { 'searchcount', 'filetype' },
		lualine_y = { 'progress', 'location' },
		lualine_z = { { 'os.date("%a")', icons_enabled = true, icon = '' }, 'os.date("%H:%M")' },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'progress' },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { components.bufferline },
		lualine_x = {},
		lualine_y = {},
		lualine_z = { components.tabs },
	},
	winbar = {
		-- lualine_a = {},
		lualine_c = { components.filename },
		lualine_x = { symbolwinbar.get_symbol_node },
	},
	inactive_winbar = {
		lualine_c = { components.filename },
	},
	extensions = { 'nvim-tree', 'nvim-dap-ui', 'symbols-outline', 'quickfix' },
}

-- vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
-- 	pattern = '*',
-- 	callback = function()
-- 		lualine.refresh()
-- 	end,
-- })
