local status, wk = pcall(require, 'which-key')
if not status then
	return
end

wk.register {
	['g0'] = 'which_key_ignore',
	['g^'] = 'which_key_ignore',
	['<C-0>'] = 'which_key_ignore',
	-- ['<C-1>'] = 'which_key_ignore',
	['<C-2>'] = 'which_key_ignore',
	['<C-3>'] = 'which_key_ignore',
	['<C-4>'] = 'which_key_ignore',
	['<C-5>'] = 'which_key_ignore',
	['<C-^>'] = 'which_key_ignore',
	['<C-7>'] = 'which_key_ignore',
	['<C-8>'] = 'which_key_ignore',
	['<C-9>'] = 'which_key_ignore',

	['<A-0>'] = 'which_key_ignore',
	-- ['<A-1>'] = 'which_key_ignore',
	['<A-2>'] = 'which_key_ignore',
	['<A-3>'] = 'which_key_ignore',
	['<A-4>'] = 'which_key_ignore',
	['<A-5>'] = 'which_key_ignore',
	['<A-6>'] = 'which_key_ignore',
	['<A-7>'] = 'which_key_ignore',
	['<A-8>'] = 'which_key_ignore',
	['<A-9>'] = 'which_key_ignore',

	['<leader>2'] = 'which_key_ignore',
	['<leader>3'] = 'which_key_ignore',
	['<leader>4'] = 'which_key_ignore',
	['<leader>5'] = 'which_key_ignore',
	['<leader>6'] = 'which_key_ignore',
	['<leader>7'] = 'which_key_ignore',
	['<leader>8'] = 'which_key_ignore',
	['<leader>9'] = 'which_key_ignore',
}
