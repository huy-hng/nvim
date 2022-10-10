local status, wk = pcall(require, 'which-key')
if not status then return end

wk.register({
	['<C-w>'] = {
		name = '+Window',
		-- creating windows
		n = 'New empty Window',
		['< s,v >'] = 'Split Horizontal/Vertical',
		['^'] = 'Split and edit alternate file',
		-- closing windows
		['< c,q >'] = 'Close/Quit',
		o = 'Close all, except current',
		-- Moving windows around
		['< r,R >'] = 'Rotate down/right',
		x = 'Swap with next',
		-- Change / move window layout
		['< H,J,K,L >'] = 'move window to the far sides',
		['< h,j,k,l >'] = 'move cursor to window',
		-- resizing
		['='] = 'make windows equal size',
		['< |,_ >'] = 'set width,height to N (full)',
		['<,>'] = 'de-/increase width',
		['< -,+ >'] = 'de-/increase height',
	}
})


wk.register({
    ['C-0'] = "which_key_ignore",
    -- ['C-1'] = "which_key_ignore",
    ['C-2'] = "which_key_ignore",
    ['C-3'] = "which_key_ignore",
    ['C-4'] = "which_key_ignore",
    ['C-5'] = "which_key_ignore",
    ['C-^'] = "which_key_ignore",
    ['C-7'] = "which_key_ignore",
    ['C-8'] = "which_key_ignore",
    ['C-9'] = "which_key_ignore",

    ['A-0'] = "which_key_ignore",
    -- ['A-1'] = "which_key_ignore",
    ['A-2'] = "which_key_ignore",
    ['A-3'] = "which_key_ignore",
    ['A-4'] = "which_key_ignore",
    ['A-5'] = "which_key_ignore",
    ['A-6'] = "which_key_ignore",
    ['A-7'] = "which_key_ignore",
    ['A-8'] = "which_key_ignore",
    ['A-9'] = "which_key_ignore",
})

-- wk.register({
-- 	['<C>'] = {
-- 		['0'] = 'which_key_ignore',
-- 		['1'] = 'which_key_ignore',
-- 		['2'] = 'which_key_ignore',
-- 		['3'] = 'which_key_ignore',
-- 		['4'] = 'which_key_ignore',
-- 		['5'] = 'which_key_ignore',
-- 		['^'] = 'which_key_ignore',
-- 		['7'] = 'which_key_ignore',
-- 		['8'] = 'which_key_ignore',
-- 		['9'] = 'which_key_ignore',
-- 	},
-- })
