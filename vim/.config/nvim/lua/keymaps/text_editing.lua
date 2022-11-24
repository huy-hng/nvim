local function keep_column(action)
	return function()
		local column = vim.fn.col('.')

		print(action)
		vim.api.nvim_command('normal! ' .. action)

		local line = vim.fn.line('.')
		vim.fn.cursor { line, column }
	end
end

local is_in_area = function()
	local yanked_pos = vim.fn.getpos("'[")
	local behind_line = PrevPos[2] < yanked_pos[2]
	local behind_column = PrevPos[3] < yanked_pos[3]

	if behind_line then
		return false
	end
	return true
end

function YankOperator(type)
	if not type then
		PrevPos = vim.fn.getcurpos()
		vim.go.operatorfunc = 'v:lua.YankOperator'
		return 'g@'
	end

	vim.api.nvim_command('normal! `[v`]y')

	if is_in_area() then
		vim.fn.cursor { PrevPos[2], PrevPos[3] }
	end

	PrevPos = nil
	vim.go.operatorfunc = ''
end

nmap('p', keep_column('p'))
nmap('P', keep_column('P'))
vmap('y', keep_column('y'))
vmap('Y', keep_column('Y'))
vmap('<C-c>', keep_column('"+y'))

nmap('y', YankOperator, '', { expr = true })
nmap('yy', 'yy')

nmap('<leader>p', '"+p')
nmap('<leader>P', '"+P')

-- break undo sequence before pasting from register
-- imap('<C-v', CMD('<C-r>+'))
-- icmap('<C-r', '<C-G>u<C-r>')

-- copy current line above / below
nmap('<A-J>', keep_column('yyp'))
nmap('<A-K>', keep_column('yyP'))
vmap('<A-J>', keep_column("Y'>p"))
vmap('<A-K>', keep_column("Y'<P"))

-- move line(s) above / below
nmap('<A-j>', 'mz<cmd>m+<cr>`z')
nmap('<A-k>', 'mz<cmd>m-2<cr>`z')
vmap('<A-j>', ":m'>+<cr>`<my`>mzgv`yo`z")
vmap('<A-k>', ":m'<-2<cr>`>my`<mzgv`yo`z")


--==============================================================================
--                            |=> Indentation <=|
--==============================================================================
imap('<C-Tab>', '<C-t>')
imap('<S-Tab>', '<C-d>')
imap('<C-S-Tab>', '<C-d>')

nmap('<C-Tab>', '>>')
nmap('<S-Tab>', '<<')
nmap('<C-S-Tab>', '<<')

vmap('<Tab>', '>gv')
vmap('<S-Tab>', '<gv')
