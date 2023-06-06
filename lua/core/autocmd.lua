local detect_indent = require('modules.detect_indentation.detect_indentation').detect

Augroup('DetectIndent', {
	Autocmd('OptionSet', { 'expandtab', 'tabstop', 'shiftwidth' }, detect_indent),
	-- Autocmd('BufReadPost', detect_indent),
	Autocmd('BufReadPost', function(data)
		if detect_indent(data) then return end

		-- FIX: doesnt work with leader f save mapping for some reason
		NestedAutocmd(data, 'BufWritePost', '*', function()
			if detect_indent(data) then return true end
		end)
	end),

	Autocmd('BufNew', function(data) --
		NestedAutocmd(data, 'BufWritePost', '*', detect_indent, { once = true })
	end),
})


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
	Augroup('renu', {
		Autocmd('CursorHold', line_numbers.renu_autocmd(true)),
		Autocmd('CursorMoved', line_numbers.renu_autocmd(false)),
		Autocmd('InsertEnter', line_numbers.renu_autocmd(false)),
		Autocmd('InsertLeave', line_numbers.renu_autocmd(true)),
		Autocmd('WinLeave', line_numbers.renu_autocmd(false)),
	})
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
		if Util.is_cmdwin() then return end
		vim.cmd.checktime()
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
		vim.cmd.TSContextEnable()
		-- RestoreAugroup('NoCmdWinHere')
		-- RestoreAugroup('ColumnLine')
	end),

	Autocmd('CmdwinEnter', 'startinsert'),
	Autocmd('CmdwinEnter', function()
		-- DeleteAugroup('NoCmdWinHere')
		-- DeleteAugroup('ColumnLine')

		nvim.schedule(function()
			-- P(data)
			vim.o.cmdheight = 0
			local scroll_length_before = vim.g.neovide_scroll_animation_length
			vim.g.neovide_scroll_animation_length = 0

			local opts = { buffer = true, silent = false }
			Map.n(';', ':', '', opts)

			Map.n('<C-k>', vim.cmd.quit, '', opts)
			Map.n('q', vim.cmd.quit, '', opts)
			Map.n('<C-;>', vim.cmd.quit, '', opts)
			Map.n('<leader>;', vim.cmd.quit, '', opts)
			Map.i('<C-;>', function()
				nvim.feedkeys('<Esc>')
				vim.cmd.quit()
			end, '', opts)

			vim.cmd.TSContextDisable()
			vim.cmd.TSBufDisable('highlight')

			nvim.defer(200, function() --
				vim.g.neovide_scroll_animation_length = scroll_length_before
			end)
		end)
	end),
})

local function printer(data)
	WriteToSplit(data.event)
	WriteToSplit(data.match)
	WriteToSplit(data.buf)
	WriteToSplit('')
end

Augroup('AutocmdTester', {
	Autocmd({
		'BufWinLeave',
		'BufWinEnter',

		'BufAdd',
		'BufDelete',
		'BufEnter',
		'BufLeave',
		'BufHidden',
		'BufNew',
		'BufRead',

		'WinNew',
		'WinEnter',
		'WinLeave',
		'WinClosed',
	}, printer),
	-- Autocmd('BufWinLeave', '*', printer),
	-- Autocmd('BufWinEnter', '*', printer),

	-- Autocmd('BufAdd', '*', printer),
	-- Autocmd('BufDelete', '*', printer),
	-- Autocmd('BufEnter', '*', printer),
	-- Autocmd('BufLeave', '*', printer),
	-- Autocmd('BufHidden', '*', printer),
	-- Autocmd('BufNew', '*', printer),
	-- Autocmd('BufRead', '*', printer),

	-- Autocmd('WinNew', '*', printer),
	-- Autocmd('WinEnter', '*', printer),
	-- Autocmd('WinLeave', '*', printer),
	-- Autocmd('WinClosed', '*', printer),
}, true, false)

Augroup('AutoSource', {
	-- Autocmd('BufWritePost', '*.lua', 'so %'),
	-- Autocmd('BufWritePost', '*.lua', 'so $HOME/.config/nvim/init.lua'),
}, true, false)

local start = vim.loop.now()
local res = { { vim.loop.now() - start, 'imports done' } }
Augroup('Testing', {
	Autocmd('BufAdd', { print, 'add' }),
	Autocmd('BufReadPre', { print, 'readpre' }),
	Autocmd('BufRead', { print, 'read' }),
	Autocmd('BufReadPost', { print, 'readpost' }),
	Autocmd('BufWinEnter', { print, 'winenter' }),
	Autocmd('BufEnter', { print, 'enter' }),
	Autocmd({ 'WinEnter', 'WinNew' }, function()
		-- P(data)
		-- local wins = vim.api.nvim_list_wins()
		-- P(wins)
	end),
	Autocmd({ 'UiEnter', 'VimEnter' }, function(data) --
		table.insert(res, { vim.loop.now() - start, data.event })
	end),
	Autocmd('User', 'VeryLazy', function(data) --
		table.insert(res, { vim.loop.now() - start, data.match })
	end),
}, true, false)
