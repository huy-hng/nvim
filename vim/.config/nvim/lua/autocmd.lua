vim.api.nvim_create_augroup("filetypes", { clear = true })
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

vim.api.nvim_create_augroup("startify", { clear = true })
vim.api.nvim_create_autocmd("User", {
	pattern = "StartifyReady",
	callback = function()
		vim.wo.statusline = " "
		vim.wo.winbar = " "
	end,
	group = "startify",
})
