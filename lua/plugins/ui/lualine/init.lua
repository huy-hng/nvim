local M = {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	-- lazy = false,
	event = 'VeryLazy',
	-- ft = 'alpha',
}

-- TODO: truncate date when window is small
-- the stuff below can be used, or find a method in lualine,
-- that allows me to check the length of the statusline

-- local sl = vim.api.nvim_eval_statusline(vim.o.statusline, {})
-- print(sl.str)
-- print(sl.width)

function M.config()
	if vim.g.started_by_firenvim == true then return end

	local lualine = require('lualine')
	local cat = require('lualine.themes.catppuccin')
	local comp = require('plugins.ui.lualine.components')

	cat.normal.c.bg = 'bg'
	cat.inactive.a.bg = 'bg'
	cat.inactive.b.bg = 'bg'
	cat.inactive.c.bg = 'bg'

	local count = 0

	Augroup('UpdateLualine', {
		Autocmd('ModeChanged', '*:no', function()
			lualine.refresh {
				place = { 'statusline' },
			}
			vim.cmd.redrawstatus()
		end),
	})

	lualine.setup {
		options = {
			icons_enabled = true,
			theme = cat,
			-- section_separators = { left = '', right = '' },
			-- component_separators = { left = '', right = '' },
			section_separators = { left = '', right = '' },
			-- section_separators = { left = '', right = '' },
			component_separators = { left = '', right = '' },
			disabled_filetypes = { 'alpha' },
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = true,
		},
		sections = {
			-- lualine_a = { 'mode', function() return count end },
			lualine_a = { comp.mode },
			lualine_b = { comp.branch },
			lualine_c = {
				comp.session_name,
				-- comp.filepath,
				'%{%v:lua.dropbar.get_dropbar_str()%}',
			},
			lualine_x = {
				'%B',
				'searchcount',
				comp.metamap,
				comp.indentation,
				comp.filetype,
				comp.plugin_info,
			},
			lualine_y = {
				'progress',
				'location',
			},
			lualine_z = { comp.date, comp.clock },
		},
		inactive_sections = {},
		-- tabline = {
		-- 	lualine_a = {},
		-- 	lualine_b = {},
		-- 	lualine_c = { comp.bufferline },
		-- 	-- lualine_c = {},
		-- 	lualine_x = {},
		-- 	lualine_y = {},
		-- 	lualine_z = { comp.tabs },
		-- },
		winbar = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { comp.diff, 'diagnostics', comp.filename },
			-- lualine_c = { '%{%v:lua.dropbar.get_dropbar_str()%}' },
			-- lualine_x = { comp.symbols },
			lualine_z = {},
		},
		inactive_winbar = {
			lualine_b = {},
			-- lualine_c = { '%{%v:lua.dropbar.get_dropbar_str()%}' },
			lualine_c = { comp.diff, 'diagnostics', comp.filename },
			lualine_x = {},
		},
		extensions = {
			comp.ranger,
			-- 'aerial',
			-- 'chadtree',
			-- 'fern',
			-- 'fugitive',
			-- 'fzf',
			-- 'man',
			-- 'mundo',
			-- 'neo-tree',
			-- 'nerdtree',
			'nvim-dap-ui',
			-- 'nvim-tree',
			'quickfix',
			-- 'symbols-outline',
			-- 'toggleterm',
		},
	}

	-- vim.api.nvim_del_augroup_by_name()

	-- local cmds = vim.api.nvim_get_autocmds { event = 'CursorMoved' }
	-- for _, cmd in ipairs(cmds) do
	-- 	vim.api.nvim_clear_autocmds({event=cmd.event, group=cmd.group_name})
	-- 	-- P(cmd)
	-- end

	-- local groups = Exec('augroup')
	-- local split = vim.fn.split(groups, '  ')
	-- for _, s in ipairs(split) do
	-- 	if string.starts(s, 'LspsagaSymbol') then vim.api.nvim_del_augroup_by_name(s) end
	-- end
end

return M
