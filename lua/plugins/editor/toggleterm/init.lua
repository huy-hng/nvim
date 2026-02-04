local M = {
	'akinsho/toggleterm.nvim',
	event = 'VeryLazy',
}

function M.config()
	-- local build_cmd = '/home/huy/repositories/kyria/build.sh -s -b right'
	-- local build_cmd = '~/worktrees/kyria/refactor_rgb_underglow/build.sh right'
	local build_cmd_right = '$(pwd)/build.sh right'
	local build_cmd_left = '$(pwd)/build.sh left'

	local build_config = {
		cmd = nil,
		hidden = false,
		close_on_exit = false,
		count = 1,
		direction = 'tab',
		on_create = function(term)
			-- function to run when the terminal is first created
			-- term:__add()
			Map.t('<esc>', [[<C-\><C-n>]], '', { buffer = term.bufnr })
		end,
		on_exit = function(term, job, exit_code, name) -- function to run when terminal process exits
			local bufnr = term.bufnr
			print('on exit', term.bufnr)

			Augroup('ToggleTermm', {
				Autocmd({ 'BufDelete', 'BufHidden' }, nil, function(data) --
					if data.buf == bufnr then
						term.actually_exited = true
						-- vim.notify('actually exited')
						-- print('actually exited', vim.api.nvim_get_current_buf())
						return true
					end
				end),
			})

			if exit_code == 0 then
				vim.notify('Build completed successfully.', vim.log.levels.WARN)
			elseif exit_code == 1 then
				vim.notify('Build failed.', vim.log.levels.ERROR)
			elseif exit_code == 130 then
				vim.notify('Build aborted', vim.log.levels.DEBUG)
			elseif exit_code == 129 then
				vim.notify('Build restarted', vim.log.levels.WARN)
			else
				vim.notify('Process ended with code: ' .. tostring(exit_code))
			end
		end,
	}

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


	local Terminal = require('toggleterm.terminal').Terminal
	local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }

	
	Map.n('<leader>gG', function()
		lazygit:toggle()
	end, 'open lazygit')

	require('plugins.editor.toggleterm.kyria')

	-- Map.n(
	-- 	kyria_build_map,
	-- 	-- { vim.cmd.TermExec, string.format('cmd="%s" open=0 count=2', build_cmd) },
	-- 	{ vim.cmd, '2TermExec ' .. string.format('cmd="%s" open=0', build_cmd) },
	-- 	'build kyria'
	-- )
end

return M
