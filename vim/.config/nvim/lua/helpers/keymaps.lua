local function bind(op, outer_opts)
	outer_opts = outer_opts or {
		noremap = true,
		silent = true,
	}

	return function(lhs, rhs, description, opts)
		opts = vim.tbl_extend('force',
			outer_opts,
			-- { desc = description },
			{ desc = description or '' },
			opts or {}
		)
		vim.keymap.set(op, lhs, rhs, opts)
	end
end


local M = {}

M.map = bind('')

M.nmap = bind('n', { noremap = false })
M.nor = bind('n')

M.vis = bind('v')
M.vix = bind('x')

M.ins = bind('i')

M.cmdins = bind('!')

M.cmd = bind('c')
M.ter = bind('t')

return M


-- local map = maps.map

-- local nmap = maps.nmap
-- local nor = maps.nor

-- local vis = maps.vis
-- local vix = maps.vix

-- local ins = maps.ins

-- local cmd = maps.cmd
-- local ter = maps.ter
