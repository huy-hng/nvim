local M = {
	'akinsho/toggleterm.nvim',
	event = 'VeryLazy',
}

function M.config()
	-- local build_cmd = '/home/huy/repositories/kyria/build.sh -s -b right'
	local build_cmd = '/home/huy/repositories/kyria/build.sh right'
	local build_config = {
		cmd = build_cmd,
		hidden = false,
		close_on_exit = false,
		count = 1,
		direction = 'tab',
		on_create = function(term)
			-- function to run when the terminal is first created
			-- term:__add()
			Map.t('<esc>', [[<C-\><C-n>]], '', { buffer = term.bufnr })
			vim.notify('Building Kyria in background')
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
			Normal = {
				guibg = 'bg',
			},
			NormalFloat = {
				link = 'Normal',
			},
			FloatBorder = {
				guifg = 'fg',
				guibg = 'bg',
			},
		},
	}

	require('toggleterm').setup(term_config)

	local function wrap_spawn(terminal)
		return vim.schedule_wrap(function() terminal:spawn() end)
	end

	local function wrap_open_term(term)
		local num = ''
		return function()
			if term then
				term:__add()
				num = term.id
			end
			-- print(num)
			vim.cmd(num .. 'ToggleTerm')
		end
	end

	local Terminal = require('toggleterm.terminal').Terminal
	local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }
	local kyria_build_map = '<leader>bk'
	local kyria_build = Terminal:new(build_config)

	-- Map.n('<c-d>', wrap_open_term())
	Map.n('<c-.>', function()
		-- P(kyria_build)
		-- if kyria_build:is_open() then vim.notify('is open') end
		if kyria_build.bufnr then
			kyria_build:__add()
			wrap_open_term(kyria_build)()
			-- nvim.schedule(function() print('cur buf', vim.api.nvim_get_current_buf()) end)
			return
		end
		-- nvim.schedule(function() print('cur buf', vim.api.nvim_get_current_buf()) end)
		wrap_open_term()()
	end)

	Map.n(kyria_build_map, function()
		kyria_build:shutdown()

		kyria_build = Terminal:new(build_config)
		-- kyria_build:toggle()
		local ok = pcall(wrap_spawn(kyria_build))
		-- if ok then return end
		-- kyria_build:open()
	end, 'build kyria')

	Map.n('<leader>gG', function() --
		lazygit:toggle()
	end, 'open lazygit')

	-- Map.n(
	-- 	kyria_build_map,
	-- 	-- { vim.cmd.TermExec, string.format('cmd="%s" open=0 count=2', build_cmd) },
	-- 	{ vim.cmd, '2TermExec ' .. string.format('cmd="%s" open=0', build_cmd) },
	-- 	'build kyria'
	-- )
end

return M
