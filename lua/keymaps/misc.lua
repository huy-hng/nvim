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

nvim.command(
	'W',
	"execute 'w !sudo tee % > /dev/null' <bar> edit!",
	{ desc = ':W sudo saves the file' }
)

-- Unmap('n', '<localleader>t')
Map.n('<localleader>t', '<Plug>PlenaryTestFile', '', { remap = true })
