local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'--single-branch',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=main',
		lazypath,
	}
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

local spec = {
	-- { import = 'plugins.basics' },
	{ import = 'plugins.ui' },
}

-- require('lazy').setup(spec, require('plugin_manager.config'))
require('lazy').setup(spec)
