---@diagnostic disable: param-type-mismatch

local function download_packer()
	if vim.fn.input('Download Packer? (y for yes)') ~= 'y' then return end

	local directory = string.format('%s/site/pack/packer/start/', vim.fn.stdpath('data'))

	vim.fn.mkdir(directory, 'p')

	local out = vim.fn.system(
		string.format(
			'git clone %s %s',
			'https://github.com/wbthomason/packer.nvim',
			directory .. 'packer.nvim'
		)
	)

	print(out)
	print('Downloading packer.nvim...')
	print("( You'll need to restart now )")

	if vim.fn.input('Restart now? (y for yes)') == 'y' then vim.cmd.quitall() end
end

if not pcall(require, 'packer') then download_packer() end

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/'
	fn.mkdir(install_path, 'p')

	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system {
			'git',
			'clone',
			'--depth',
			'1',
			'https://github.com/wbthomason/packer.nvim',
			install_path .. 'packer.nvim',
		}
		vim.cmd([[packadd packer.nvim]])
		if vim.fn.input('Restart now? (y for yes)') == 'y' then vim.cmd.quitall() end
	end
end

ensure_packer()
