local M = {
	'nvim-telescope/telescope.nvim',
	keys = { '<C-t>', '<leader>tl' },
	event = 'VeryLazy',

	dependencies = 'rcarriga/nvim-notify',
}

function M.config()
	local telescope = require('telescope')

	local mappings = require('plugins.editor.telescope.keymaps')
	telescope.load_extension('notify')

	local config = {
		defaults = {
			-- winblend = function() return vim.go.winblend end,
			winblend = vim.o.winblend,
			prompt_prefix = ' ',
			cycle_layout_list = {},
			selection_caret = ' ',
			path_display = { 'truncate' },
			border = true,
			initial_mode = 'insert', -- normal
			layout_strategy = 'vertical',
			scroll_strategy = 'limit',
			mappings = mappings,
			layout_config = {
				width = { 0.6, max = 180 },

				bottom_pane = {
					-- height = 25,
					-- preview_cutoff = 120,
					-- prompt_position = "top"
				},
				center = {
					-- height = 0.4,
					-- preview_cutoff = 40,
					-- prompt_position = "top",
					-- width = 0.5
				},
				cursor = {},
				horizontal = {
					-- height = 0.9,
					-- preview_cutoff = 120,
					-- prompt_position = "bottom",
					-- width = 0.8
				},
				vertical = {
					-- height = 0.9,
					-- preview_cutoff = 40,
					-- prompt_position = "bottom",
					-- width = 0.8
				},
			},
		},
		pickers = {
			-- Default configuration for builtin pickers goes here:
			-- picker_name = {
			--   picker_config_key = value,
			--   ...
			-- }
			-- Now the picker_config_key will be applied every time you call this
			-- builtin picker
		},
		extensions = {
			-- Your extension configuration goes here:
			-- extension_name = {
			--   extension_config_key = value,
			-- }
			-- please take a look at the readme of the extension you want to configure
		},
	}

	telescope.setup(config)

	-- Augroup('TelescopeRefresh', {
	-- 	Autocmd('OptionSet', 'winblend', function()
	-- 		config.defaults.winblend = vim.o.winblend
	-- 		telescope.setup(config)
	-- 	end),
	-- })
end

return M
