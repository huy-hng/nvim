local M = {
	'akinsho/toggleterm.nvim',
	event = 'VeryLazy',
}

function M.config()

	require('plugins.editor.toggleterm.kyria')
	require('plugins.editor.toggleterm.led_strip')

	local term_config = {
		start_in_insert = false,
		size = function(term)
			if term.direction == 'vertical' then
				return 80
				-- return vim.o.columns * 0.4
			elseif term.direction == 'horizontal' then
				return 20
			end
		end,
		direction = 'vertical',
		-- open_mapping = '<c-d>',
		close_on_exit = true,
		float_opts = {
			border = 'none', -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
			-- like `size`, width and height can be a number or function which is passed the current terminal
			-- width = 120,
			-- height = 50,
			winblend = 50,
		},
		winbar = {
			enabled = true,
			name_formatter = function(term) --  term: Terminal
				-- return term.name
				return 'Terminal'
			end,
		},
		shade_terminals = false,
		highlights = {
			-- highlights which map to a highlight group name and a table of it's values
			-- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split

			-- Normal = {
			-- 	guibg = 'bg',
			-- },
			-- NormalFloat = {
			-- 	link = 'Normal',
			-- },
			-- FloatBorder = {
			-- 	guifg = 'fg',
			-- 	guibg = 'bg',
			-- },
		},
	}

	require('toggleterm').setup(term_config)
end

return M
