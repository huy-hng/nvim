local has_lualine, lualine = pcall(require, 'lualine')
if not has_lualine then return end

local components = require('plugins.lualine.components')

local has_cat, cat = pcall(require, 'lualine.themes.catppuccin')
if not has_cat then return end

cat.normal.c.bg = 'bg'
cat.inactive.a.bg = 'bg'
cat.inactive.b.bg = 'bg'
cat.inactive.c.bg = 'bg'

local function session_name()
	local has_session, session = pcall(require, 'possession.session')
	if not has_session then return '' end
	return ('  ' .. session.session_name) or '%#Error#NO SESSION'
end

lualine.setup {
	options = {
		icons_enabled = true,
		theme = cat,
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = { 'alpha' },
		-- disabled_filetypes = {
		-- 	statusline = { 'alpha' },
		-- 	winbar = { 'alpha' },
		-- 	tabline = { 'alpha' },
		-- },
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
		lualine_c = { 'filename', session_name },
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
		-- lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { components.tabs },
	},
	winbar = {
		lualine_c = { components.filename },
		lualine_x = { components.symbols },
	},
	inactive_winbar = {
		lualine_c = { components.filename },
	},
	extensions = { 'nvim-tree', 'nvim-dap-ui', 'symbols-outline', 'quickfix' },
}

-- vim.api.nvim_del_augroup_by_name('lualine_wb_refresh')

-- local cmds = vim.api.nvim_get_autocmds { event = 'CursorMoved' }
-- for _, cmd in ipairs(cmds) do
-- 	vim.api.nvim_clear_autocmds({event=cmd.event, group=cmd.group_name})
-- 	-- P(cmd)
-- end

function string.starts(String, Start)
	return string.sub(String, 1, string.len(Start)) == Start
end

-- local groups = Exec('augroup')
-- local split = vim.fn.split(groups, '  ')
-- for _, s in ipairs(split) do
-- 	if string.starts(s, 'LspsagaSymbol') then vim.api.nvim_del_augroup_by_name(s) end
-- end
