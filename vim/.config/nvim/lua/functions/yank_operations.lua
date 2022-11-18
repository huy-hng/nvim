local function keep_column(action)
	return function()
		local column = vim.fn.col('.')

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

nmap('y', YankOperator, '', { expr = true })
nmap('yy', 'yy')
