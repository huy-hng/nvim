vim.pack.add({
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
})

-- Configure the parser installer.
require("nvim-treesitter").setup({})

-- Explicitly declare the parsers you want installed.
require("nvim-treesitter").install({
	"lua",
	"vim",
	"vimdoc",
	"c",
	"cpp",
	"python",
	"bash",
	"json",
	"yaml",
	"markdown",
	"markdown_inline",
})

-- Enable native Tree-sitter highlighting for filetypes
-- with an available parser.
vim.api.nvim_create_autocmd("FileType", {
	callback = function(event)
		pcall(vim.treesitter.start, event.buf)
	end,
})
