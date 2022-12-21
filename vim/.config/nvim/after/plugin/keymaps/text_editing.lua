local function keep_column(action, change_line)
	return function()
		if false then
			-- this entire thing can be simplified with just marks
			-- only change_line isnt implemented with this
			Feedkeys('mz' .. action .. '`z')
			return
		end
		local column = vim.fn.col('.')
		local line = vim.fn.line('.')

		Normal(action)

		if change_line then line = vim.fn.line('.') end
		vim.fn.cursor { line, column }
	end
end

local function is_in_area()
	local yanked_pos = vim.fn.getpos("'[")
	local behind_line = PrevPos[2] < yanked_pos[2]
	local behind_column = PrevPos[3] < yanked_pos[3]

	if behind_line then return false end
	return true
end

function YankOperator(type)
	if not type then
		PrevPos = vim.fn.getcurpos()
		vim.go.operatorfunc = 'v:lua.YankOperator'
		return 'g@'
	end

	vim.api.nvim_command('normal! `[v`]y')
	if is_in_area() then vim.fn.cursor { PrevPos[2], PrevPos[3] } end

	PrevPos = nil
	vim.go.operatorfunc = ''
end

Nmap('p', keep_column('p==', true), 'paste, keep column and indent')
Nmap('P', keep_column('P==', true), 'paste, keep column and indent')
Vmap('y', keep_column('y'))
Vmap('Y', keep_column('Y'))
Vmap('<C-c>', keep_column('"+y'))

Vmap('p', '"_c<C-r>"<esc>', 'keep yank register when pasting over visual selection')

Nmap('y', YankOperator, '', { expr = true })
Nmap('yy', 'yy')

Nmap('yh', keep_column('yh'))
Nmap('yj', keep_column('yj'))
Nmap('yk', keep_column('yk'))
Nmap('yl', 'yl')

Nmap('J', keep_column('J'), 'keep column when joining lines')

----------------------------------copy current line above / below-----------------------------------

Imap('<A-K>', keep_column('yyPi', true))
Imap('<A-J>', keep_column('yypi', true))

Nmap('<A-J>', keep_column('yyp', true))
Nmap('<A-K>', keep_column('yyP', true))

Vmap('<A-J>', keep_column("Y'>p"))
Vmap('<A-K>', keep_column("Y'<P"))

------------------------------------move line(s) above / below--------------------------------------

-- nmap('<A-j>', 'mz<cmd>m+<cr>`z')
-- nmap('<A-k>', 'mz<cmd>m-2<cr>`z')
-- vmap('<A-j>', ":m'>+<cr>`<my`>mzgv`yo`z")
-- vmap('<A-k>', ":m'<-2<cr>`>my`<mzgv`yo`z")

local function move_line(direction)
	return function()
		vim.cmd.move(direction)
		vim.api.nvim_feedkeys('==', 'n', false)
	end
end

local function move_visual_line(direction)
	return function()
		vim.cmd.move(direction)
		-- vim.api.nvim_feedkeys('==', 'n', false)
	end
end

Nmap('<A-j>', move_line('+'))
Nmap('<A-k>', move_line('-2'))
-- nmap('<A-j>', '<cmd>m+<cr>==')
-- nmap('<A-k>', '<cmd>m-2<cr>==')

-- vmap('<A-j>', move_visual_line("'>+"))
-- vmap('<A-k>', move_visual_line("<-2"))
Vmap('<A-j>', ":m'>+<cr>`<my`>mzgv`yo`z=gv")
Vmap('<A-k>', ":m'<-2<cr>`>my`<mzgv`yo`z=gv")

---------------------------------------------Substitution-------------------------------------------

Nmap(
	'<leader>ss',
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	'Substitute word under cursor'
)
--------------------------------------------Indentation---------------------------------------------

Imap('<C-Tab>', '<C-t>')
Imap('<S-Tab>', '<C-d>')
Imap('<C-S-Tab>', '<C-d>')

Nmap('<C-Tab>', '>>')
Nmap('<S-Tab>', '<<')
Nmap('<C-S-Tab>', '<<')

Vmap('<Tab>', '>gv')
Vmap('<S-Tab>', '<gv')
