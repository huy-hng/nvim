local has_lualine, lualine = pcall(require, 'lualine')
if not has_lualine then return end

local comp = R('plugins.lualine.components')

local has_cat, cat = pcall(require, 'lualine.themes.catppuccin')
if not has_cat then return end

cat.normal.c.bg = 'bg'
cat.inactive.a.bg = 'bg'
cat.inactive.b.bg = 'bg'
cat.inactive.c.bg = 'bg'

lualine.setup {
	options = {
		icons_enabled = true,
		theme = cat,
		section_separators = { left = '', right = '' },
		component_separators = { left = '', right = '' },
		-- section_separators = { left = '', right = '' },
		-- component_separators = { left = '', right = '' },
		disabled_filetypes = { 'alpha' },
		-- disabled_filetypes = {
		-- 	statusline = { 'alpha' },
		-- 	winbar = { 'alpha' },
		-- 	tabline = { 'alpha' },
		-- },
		ignore_focus = {},
		always_divide_middle = false,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { comp.branch },
		lualine_c = { comp.session_name, comp.filepath },
		lualine_x = { 'searchcount', comp.extra_mode, comp.indentation, comp.filetype },
		lualine_y = { 'progress', 'location' },
		lualine_z = { comp.date, comp.time },
	},
	inactive_sections = {},
	tabline = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { comp.bufferline },
		-- lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { comp.tabs },
	},
	winbar = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { comp.diff, 'diagnostics', comp.filename },
		lualine_x = { comp.symbols },
		lualine_z = {},
	},
	inactive_winbar = {
		lualine_b = {},
		lualine_c = { comp.diff, 'diagnostics', comp.filename },
		lualine_x = {},
	},
	-- extensions = { 'nvim-tree', 'nvim-dap-ui', 'quickfix' },
	extensions = { 'nvim-dap-ui', 'quickfix' },
}

-- vim.api.nvim_del_augroup_by_name()

-- local cmds = vim.api.nvim_get_autocmds { event = 'CursorMoved' }
-- for _, cmd in ipairs(cmds) do
-- 	vim.api.nvim_clear_autocmds({event=cmd.event, group=cmd.group_name})
-- 	-- P(cmd)
-- end

function string.starts(String, Start) return string.sub(String, 1, string.len(Start)) == Start end

-- local groups = Exec('augroup')
-- local split = vim.fn.split(groups, '  ')
-- for _, s in ipairs(split) do
-- 	if string.starts(s, 'LspsagaSymbol') then vim.api.nvim_del_augroup_by_name(s) end
-- end
