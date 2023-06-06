local M = {}
----------------------------------------
--        -> Abbreviations <-
----------------------------------------
local cnoreabbrev = vim.cmd.cnoreabbrev

local cmd_abbrevs = {
	telp = 'tab help',
	qq = 'qa',
	hvw = 'tab help vimwiki',
	sovim = 'so $HOME/.config/nvim/init.vim',
	solua = 'so $HOME/.config/nvim/init.lua',

	-- h = 'vertical h',
	vwtoc = 'VimwikiTOC',
	packi = 'PackerInstall',
	kirbs = [[\(.*\)]],

	vimdict = [[s/'\(.*\)':/\1 =/g]],
	substitutesubmatch = [[s/\(, \|{\)\zs'\(.\{-}\)': \ze/\2 = /g]],
	localfun2module = [[%s/local function \(.*\)(/M.\1 = function(]],
	-- \(, \|{\) capturing group that matches either ", " or "{"
	-- \zs start of match
	-- '\(.\{-}\)': matches as few "." as possible
	-- \ze end of match
	-- /\2 = /g use second capture
}

for abbrev, long_form in pairs(cmd_abbrevs) do
	cnoreabbrev(abbrev, long_form)
end

-- nvim.command('ListAbbrevs', { P, cmd_abbrevs })
nvim.command('HighlightFile', 'so $VIMRUNTIME/syntax/hitest.vim')
nvim.command('H', function(data) --
	nvim.exec('enew | set buftype=help | h ' .. data.args)
end, { nargs = 1, complete = 'help' })
-- vim.cmd [[command! -nargs=1 -complete=help Help :enew | :set buftype=help | :h <args>]]

function M.info(msg)
	vim.cmd('echohl Directory')
	M._echo_multiline(msg)
	vim.cmd('echohl None')
end

function M.warn(msg)
	vim.cmd('echohl WarningMsg')
	M._echo_multiline(msg)
	vim.cmd('echohl None')
end

function M.err(msg)
	vim.cmd('echohl ErrorMsg')
	M._echo_multiline(msg)
	vim.cmd('echohl None')
end

local sudo_exec = function(cmd, print_output)
	vim.fn.inputsave()
	local password = vim.fn.inputsecret('Password: ')
	vim.fn.inputrestore()
	if not password or #password == 0 then
		M.warn('Invalid password, sudo aborted')
		return false
	end
	local out = vim.fn.system(string.format("sudo -p '' -S %s", cmd), password)
	if vim.v.shell_error ~= 0 then
		print('\r\n')
		M.err(out)
		return false
	end
	if print_output then print('\r\n', out) end
	return true
end

-- local sudo_write = function(tmpfile, filepath)
local sudo_write = function()
	if not tmpfile then tmpfile = vim.fn.tempname() end
	if not filepath then filepath = vim.fn.expand('%') end
	if not filepath or #filepath == 0 then
		M.err('E32: No file name')
		return
	end
	-- `bs=1048576` is equivalent to `bs=1M` for GNU dd or `bs=1m` for BSD dd
	-- Both `bs=1M` and `bs=1m` are non-POSIX
	local cmd = string.format(
		'dd if=%s of=%s bs=1048576',
		vim.fn.shellescape(tmpfile),
		vim.fn.shellescape(filepath)
	)
	-- no need to check error as this fails the entire function
	vim.api.nvim_exec(string.format('write! %s', tmpfile), true)
	if sudo_exec(cmd) then
		-- M.info(string.format([[\r\n"%s" written]], filepath))
		vim.cmd('e!')
	end
	vim.fn.delete(tmpfile)
end

nvim.command(
	'W',
	sudo_write,
	-- "execute 'w !sudo tee % > /dev/null' <bar> edit!",
	{ desc = ':W sudo saves the file' }
)

-- nvim.command(
-- 	'W',
-- 	"exe 'w !sudo tee >/dev/null %:p:S' | setl nomod",
-- 	-- "execute 'w !sudo tee % > /dev/null' <bar> edit!",
-- 	{ desc = ':W sudo saves the file' }
-- )

-- Unmap('n', '<localleader>t')
-- Map.n('<localleader>t', '<Plug>PlenaryTestFile', '', { remap = true })

return M
