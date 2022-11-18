-- vim.api.nvim_create_augroup("filetypes", { clear = true })
-- vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
-- 	pattern = {
-- 		'*.env',
-- 		'*.profile',
-- 		'*.rc',
-- 		'*.login',
-- 		'*.logout',
-- 		-- '*.',
-- 	},
-- 	callback = vim.opt_local.filetype(), -- Or myvimfun
-- })

-- vim.api.nvim_create_autocmd('CmdwinEnter', {
-- 	group = vim.api.nvim_create_augroup('CMDwin', { clear = true }),
-- 	callback = function()
-- 		nmap('<esc>', CMD('q'))
-- 		vim.api.nvim_command('TSContextDisable')
-- 	end,
-- })

-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('AfterYank', { clear = true }),
	callback = function()
		vim.highlight.on_yank {
			higroup = 'Visual',
			-- on_visual = false
			-- timeout = 50,
		}
	end,
})

-- augroup highlight_yank
--     autocmd!
--     autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
-- augroup END

vim.api.nvim_create_autocmd('User', {
	pattern = 'StartifyReady',
	group = vim.api.nvim_create_augroup('startify', { clear = true }),
	callback = function()
		vim.wo.statusline = ' '
		vim.wo.winbar = ' '
	end,
})
