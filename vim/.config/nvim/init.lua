vim.cmd('source ~/.config/nvim/vimrc')

nvim_path = os.getenv('HOME') .. '/.config/nvim/'
function require_dir(name)
	for f in os.dir(vim_files_path .. name) do
		print(f)
	end
end

-- require_dir('key_bindings')

-- vim.lsp.start({
-- 	name = 'my-server-name',
-- 	cmd = {'name-of-language-server-executable'},
-- 	root_dir = vim.fs.dirname(vim.fs.find({'setup.py', 'pyproject.toml'}, { upward = true })[1]),
-- })

