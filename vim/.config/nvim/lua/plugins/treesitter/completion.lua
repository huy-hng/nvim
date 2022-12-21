local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then return end

configs.setup {
	autopairs = {
		enable = true,
	},

	indent = {
		enable = true,
		disable = { '' },
	},
}
