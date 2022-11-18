---@diagnostic disable: lowercase-global

local function bind(op, outer_opts)
	outer_opts = outer_opts or {
		noremap = true,
		silent = true,
	}

	return function(lhs, rhs, description, opts)
		opts = vim.tbl_extend('force', outer_opts, { desc = description or '' }, opts or {})
		local status, _ = pcall(vim.keymap.set, op, lhs, rhs, opts)
		if not status then
			print('Keymap Error: ', op, lhs, rhs)
		end
	end
end

-- map
-- nmap
-- vmap
-- smap
-- xmap
-- omap
-- map!
-- imap
-- lmap
-- cmap
-- tmap


unmap = vim.keymap.del
map = function(op, lhs, rhs, description, opts)
	opts = opts or {}
	opts.desc = description or ''
	vim.keymap.set(op, lhs, rhs, opts)
end

nremap = bind('n', { noremap = false })

nmap = bind 'n' -- actually nnoremap, everything below as well
vmap = bind 'v' -- visual and select
smap = bind 's' -- select mode
xmap = bind 'x' -- only visual mode

omap = bind 'o' -- operator pending mode

imap = bind 'i'
icmap = bind '!' -- insert and commandline
cmap = bind 'c' -- commandline

tmap = bind 't' -- terminal

local M = {}
-- M.map = bind('')

-- M.nmap = bind('n', { noremap = false })
-- M.nmap = bind('n')

-- M.vmap = bind('v')
-- M.xmap = bind('x')

-- M.imap = bind('i')

-- M.cmdins = bind('!')

-- M.cmap = bind('c')
-- M.tmap = bind('t')

-- M.nmap = bind('n', { noremap = false })

return M
