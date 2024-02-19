Map.n(
	Keys.lleader.o,
	":w<cr> :call system('openscad ' . expand('%:p') . ' 2> /dev/null &')<cr>",
	'Open Openscad with current file',
	{ buffer = true }
)
