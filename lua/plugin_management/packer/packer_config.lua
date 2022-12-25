Augroup('Packer', {
	Autocmd('BufWritePost', 'packer.lua', function()
		vim.notify('Compiling Packer', 'info', { title = 'Packer', render = 'minimal' })
		R('plugins.packer')
		require('packer').compile()
	end),
})

return {
	compile_path = vim.fn.stdpath('config') .. '/lua/plugin_management/packer_compiled.lua',
	display = {
		open_fn = function() return require('packer.util').float { border = 'rounded' } end,
	},
	profile = {
		enable = false,
		threshold = 1, -- the amount in ms that a plugin's load time must be over for it to be included in the profile
	},
}
