Augroup('ColorSchemeSet', {
	Autocmd('ColorScheme', SetColors),
})

-- local detect_indent = require('modules.detect_indentation.detect_indentation').detect
-- Augroup('DetectIndent', {
-- 	Autocmd('OptionSet', { 'expandtab', 'tabstop', 'shiftwidth' }, detect_indent),
-- 	-- Autocmd('BufReadPost', detect_indent),
-- 	Autocmd('BufReadPost', function(data)
-- 		if detect_indent(data) then return end

-- 		-- FIX: doesnt work with leader f save mapping for some reason
-- 		NestedAutocmd(data, 'BufWritePost', '*', function()
-- 			if detect_indent(data) then return true end
-- 		end)
-- 	end),

-- 	Autocmd('BufNew', function(data) --
-- 		NestedAutocmd(data, 'BufWritePost', '*', detect_indent, { once = true })
-- 	end),
-- })

Augroup('WindowManagement', {
	Autocmd('FileType', {
		'qf',
		'help',
		'man',
		'notify',
		'lspinfo',
		'spectre_panel',
		'startuptime',
		'tsplayground',
		'PlenaryTestPopup',
	}, function(data)
		vim.bo[data.buf].buflisted = false
		Map.n('q', vim.cmd.q, 'Close Window', { buffer = data.buf })
		-- vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = data.buf, silent = true })
	end),
})

Augroup('AfterYank', { -- highlight yanked text
	Autocmd('TextYankPost', {
		vim.highlight.on_yank,
		{ higroup = 'Visual', on_macro = true, on_visual = true, timeout = 150 },
	}),
})

Augroup('Neorg', {
	Autocmd('FileType', 'norg', 'set nobuflisted'),
	Autocmd('BufNewFile', '*/neorg/journal/[0-9]*.norg', function(data)
		local filtered = string.match(data.file, 'neorg/journal/(.*).norg')
		local format = [[ +'\%A, \%b \%d']]

		local command = '$(date -d ' .. filtered .. format .. ')'
		vim.cmd('0r !echo "_*' .. command .. [[*_"$'\n']])
		vim.schedule(function() vim.cmd('3') end)
	end),

	Autocmd(
		'BufNewFile',
		'*/daily_log/[0-9]*.wiki',
		[[0r !echo "= $(date -d '%:t:r' +'\%A, \%b \%d') =\n"]]
	),
})

Augroup('NoComment', {
	Autocmd('BufWinEnter', function() --
		vim.opt_local.formatoptions:remove { 'c', 'r', 'o' }
	end),
})

if not vim.g.started_by_firenvim then
	vim.o.updatetime = 200 -- used for CursorHold
	local line_numbers = require('modules.line_numbers')
	line_numbers.create_autocmds()
end

Augroup('Misc', {
	Autocmd('BufReadPost', function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then --
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end),

	-- flash cursor when nvim window gains focus
	-- Autocmd('FocusGained', { require('functions.flash_cursor'), 1, 600 }),

	-- Reload file when it has been changed from outside
	Autocmd({
		'InsertEnter',
		'FocusGained',
		'BufEnter',
		'BufWinEnter',
		'WinEnter',
		'CursorHold',
		'CursorHoldI',
	}, function()
		if not Util.is_cmdwin() then vim.cmd.checktime() end
	end),
})

---------------------------------------------Commandline--------------------------------------------

Augroup('CommandlineWindow', {
	Autocmd('CmdlineEnter', function()
		-- vim.cmd.NoiceDisable()
		if vim.g.has_neovide then vim.o.cmdheight = 1 end
		-- require('plugins.noice').pause(true)
	end),
	Autocmd('CmdlineLeave', function()
		if vim.g.has_neovide then vim.o.cmdheight = 0 end
		-- nvim.schedule(vim.cmd.NoiceEnable)
		-- require('plugins.noice').pause(false)
	end),

	Autocmd('CmdwinLeave', function()
		-- vim.cmd.TSContextEnable()

		if nrequire('lualine') then
			require('lualine').hide {
				place = { 'winbar' },
				unhide = true,
			}
		end
	end),

	-- Autocmd('CmdwinEnter', 'startinsert'),
	Autocmd('CmdwinEnter', function()
		vim.schedule(function()
			if nrequire('lualine') then
				require('lualine').hide {
					scope = 'window', -- scope of refresh all/tabpage/window
					place = { 'winbar' },
					unhide = false,
				}
			end
			vim.o.cmdheight = 0
			local scroll_length_before = vim.g.neovide_scroll_animation_length
			vim.g.neovide_scroll_animation_length = 0

			local opts = { buffer = true, silent = false }

			Map.n('q', vim.cmd.quit, '', opts)
			Map.n(Keys.cmdline_window, vim.cmd.quit, '', opts)
			Map.i(Keys.cmdline_window, function()
				nvim.feedkeys('<Esc>')
				vim.cmd.quit()
			end, '', opts)

			-- vim.cmd.TSContextDisable()
			vim.cmd.TSBufDisable('highlight')

			nvim.defer(200, function() --
				vim.g.neovide_scroll_animation_length = scroll_length_before
			end)
		end)
	end),
})
