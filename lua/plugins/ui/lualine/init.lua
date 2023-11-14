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
	local function refresh_statusline() lualine.refresh { place = { 'statusline' } } end
	local function force_refresh_statusline()
		refresh_statusline()
		vim.cmd.redrawstatus()
	end

	Augroup('UpdateLualine', {
		-- Autocmd('ModeChanged', '*:no', force_refresh_statusline), -- apparently not needed anymore?
		Autocmd('RecordingEnter', '', refresh_statusline),
		Autocmd('RecordingLeave', '', nvim.schedule_wrap(refresh_statusline)),
	})

	lualine.setup {
		options = {
			icons_enabled = true,
			theme = cat,
			section_separators = comp.separators.section,
			component_separators = comp.separators.component,
			disabled_filetypes = {
				statusline = { 'alpha' },
				winbar = { 'alpha', 'noice' },
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = true,
		},
		sections = {
			lualine_a = { comp.endpiece_left(comp.separators.endpiece_left), comp.mode },
			lualine_b = { 'branch', comp.session_name },
			lualine_c = {
				-- comp.divider,
				-- comp.spacing,
				comp.show_macro_recording,
				comp.cwd,
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
			lualine_z = {
				comp.date,
				comp.clock,
				comp.endpiece_right(comp.separators.endpiece_right),
			},
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
