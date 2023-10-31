local M = {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	event = 'VeryLazy',
	-- lazy = false,
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

	Augroup('UpdateLualine', {
		Autocmd('ModeChanged', '*:no', function()
			lualine.refresh {
				place = { 'statusline' },
			}
			vim.cmd.redrawstatus()
		end),
	})

	--        
	--        
	local slanted_out = {
		section = { left = '', right = '' },
		component = { left = '', right = '' },
		endpiece_left = '',
		endpiece_right = '',
	}
	local slanted_in = {
		section = { left = '', right = '' },
		component = { left = '', right = '' },
		endpiece_left = '',
		endpiece_right = '',
	}

	local separators = slanted_in

	lualine.setup {
		options = {
			icons_enabled = true,
			theme = cat,
			section_separators = separators.section,
			component_separators = separators.component,
			disabled_filetypes = {
				statusline = { 'alpha' },
				winbar = { 'alpha', 'noice' },
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = true,
		},
		sections = {
			lualine_a = { comp.endpiece_left(separators.endpiece_left), comp.mode },
			lualine_b = { 'branch', comp.session_name },
			lualine_c = {
				-- comp.separator,
				-- comp.spacing,
				comp.pwd,
			},
			lualine_x = {
				'%B',
				comp.indentation,
				comp.metamap,
				comp.filetype,
				comp.plugin_info,
			},
			lualine_y = {
				'progress',
				'location',
			},
			lualine_z = { comp.date, comp.clock, comp.endpiece_right(separators.endpiece_right) },
		},
		inactive_sections = {},
		winbar = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { 'diagnostics', comp.filepath },
			lualine_x = { comp.diff },
			lualine_y = { comp.searchcount },
			lualine_z = {},
		},
		inactive_winbar = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { 'diagnostics', comp.filename },
			lualine_x = { comp.diff },
			lualine_y = { comp.searchcount },
			lualine_z = {},
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
			'toggleterm',
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
