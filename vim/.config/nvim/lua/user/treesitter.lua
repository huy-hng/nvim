local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
	return
end

configs.setup({
	-- ensure_installed = {'python', 'lua', 'bash', 'vim', }, -- one of 'all' or a list of languages
	ensure_installed = all, -- one of 'all' or a list of languages
	ignore_install = {''}, -- List of parsers to ignore installing
	auto_install = true,
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},
	autopairs = {
		enable = true,
	},
	indent = {
		enable = true, disable = { 'css' }
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	}
})
