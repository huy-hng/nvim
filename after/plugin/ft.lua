Augroup('FileTypes', {
	-- backslash is required since it doesnt understand the space between
	Autocmd('FileType', 'kdl', 'set commentstring=//\\ %s'),
	Autocmd('FileType', 'openscad', 'set commentstring=//\\ %s'),
	Autocmd('FileType', 'gcode', 'set commentstring=;\\ %s'),

	-- zsh files
	Autocmd(
		{ 'BufNewFile', 'BufRead' },
		{ '*.env', '*.profile', '*.rc', '*.login', '*.logout' },
		function(data) vim.bo[data.buf].filetype = 'bash' end
	),

	Autocmd({ 'BufNewFile', 'BufRead' }, '*.djm', 'setlocal filetype=xml'),
	Autocmd({ 'BufNewFile', 'BufRead' }, '*.conf', 'setlocal filetype=config'),
	Autocmd({ 'BufNewFile', 'BufRead' }, '*.tmux', 'setlocal filetype=tmux'),
	Autocmd({ 'BufNewFile', 'BufRead' }, '*.vim', 'setlocal filetype=vim'),
	Autocmd({ 'BufNewFile', 'BufRead' }, '*.ron', 'setlocal filetype=rust'),
	Autocmd(
		{ 'BufNewFile', 'BufRead' },
		{ '*.overlay', '*.keymap', '*.dts', '*.dtsi', '*.combo' },
		function(data)
			vim.bo[data.buf].filetype = 'dts'
			vim.bo[data.buf].commentstring = '// %s'
			-- vim.keymap.set('n', '<leader>ff', 'QMKFormat', { buffer = data.buf })
			-- vim.keymap.set('n', '<leader>ff', vim.cmd.QMKFormat, { buffer = true })

			Map.n('<leader>ll', require('qmk').format, { buffer = true })
		end
	),

	-- Autocmd('BufEnter', '*', function(data)
	-- 	if vim.bo[data.buf].filetype == 'help' then
	-- 		vim.cmd.wincmd('H')
	-- 		-- vim.
	-- 	end
	-- end),
	-- Autocmd('BufEnter','*', if &ft ==# 'help' | wincmd H | endif
})
