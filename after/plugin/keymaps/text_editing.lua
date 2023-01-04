local function keep_column(action, change_line, alt_method)
	count = 0
	return function()
		if alt_method then
			-- this entire thing can be simplified with just marks
			-- only change_line isnt implemented with this
			nvim.feedkeys('mz' .. action .. '`z')
			return
		end
		local column = vim.fn.col('.')
		local line = vim.fn.line('.')

		nvim.normal(action)

		if change_line then line = vim.fn.line('.') end
		vim.fn.cursor { line, column }
	end
end

local function is_in_area(prev_pos, yank_pos)
	local behind_line = prev_pos[2] < yank_pos[2]
	local behind_column = prev_pos[3] < yank_pos[3]

	-- if behind_line then return false end
	-- return true
	return behind_line
end

local prev_pos
local function yank_operator()
	local old_func = vim.go.operatorfunc
	prev_pos = vim.fn.getcurpos()
	_G.op_func_yank = function(type)
		P(type)
		P(prev_pos)

		-- vim.api.nvim_command('normal! `[v`]y')
		nvim.normal('`[v`]y')

		-- vim.highlight.on_yank { higroup = 'Visual', on_macro = true, on_visual = true, timeout = 150 }

		-- nvim.schedule(
		-- 	vim.highlight.on_yank,
		-- 	{ higroup = 'Visual', on_macro = true, on_visual = false, timeout = 150 }
		-- )

		local start = vim.api.nvim_buf_get_mark(0, '[')
		local finish = vim.api.nvim_buf_get_mark(0, ']')
		P(start, finish)

		local yanked_pos = vim.fn.getpos("'[")
		if is_in_area(prev_pos, yanked_pos) then vim.fn.cursor { prev_pos[2], prev_pos[3] } end

		vim.go.operatorfunc = old_func
		prev_pos = nil
		_G.op_func_yank = nil
		-- return 'g@'
	end

	vim.go.operatorfunc = 'v:lua.op_func_yank'
	-- return 'g@'
	vim.api.nvim_feedkeys('g@', 'n', false)
end

function YankOperator(type)
	if not type then
		prev_pos = vim.fn.getcurpos()
		vim.go.operatorfunc = 'v:lua.YankOperator'
		return 'g@'
	end

	vim.api.nvim_command('normal! `[v`]y')
	local yanked_pos = vim.fn.getpos("'[")
	-- if is_in_area(prev_pos, yanked_pos) then vim.fn.cursor { prev_pos[2], prev_pos[3] } end
	if is_in_area(prev_pos, yanked_pos) then vim.fn.cursor({unpack(prev_pos, 2)})  end

	prev_pos = nil
	vim.go.operatorfunc = ''
end

Nmap('p', keep_column('p==', true), 'paste, keep column and indent')
Nmap('P', keep_column('P==', true), 'paste, keep column and indent')
Vmap('y', keep_column('y', false, true))
Vmap('Y', keep_column('Y'))
Vmap('<C-c>', keep_column('"+y'), 'Yank to clipboard')

Vmap('p', '"_c<C-r>"<esc>', 'keep yank register when pasting over visual selection')

-- Nmap('y', yank_operator, '', { expr = true })
-- Nmap('y', YankOperator, '', { expr = true })
-- Nmap('yy', 'yy')

-- Nmap('yh', keep_column('yh'))
-- Nmap('yj', keep_column('yj'))
-- Nmap('yk', keep_column('yk'))
-- Nmap('yl', 'yl')

Nmap('J', keep_column('J'), 'keep column when joining lines')

----------------------------------copy current line above / below-----------------------------------

Imap('<A-K>', keep_column('yyPi', true))
Imap('<A-J>', keep_column('yypi', true))

Nmap('<A-J>', keep_column('yyp', true))
Nmap('<A-K>', keep_column('yyP', true))

Vmap('<A-J>', keep_column("Y'>p"))
Vmap('<A-K>', keep_column("Y'<P"))

------------------------------------move line(s) above / below--------------------------------------

local a = require('plenary.async')
local function move_line(direction)
	local move = a.void(function() pcall(vim.cmd.move, direction) end)
	local indent = a.void(function() vim.api.nvim_feedkeys('==', 'n', false) end)
	-- local last_time = os.clock()

	return function()
		-- local cur_time = os.clock()
		-- local time_between_moves = 0.001 -- probably milliseconds
		-- if cur_time - last_time < time_between_moves then
		-- 	print('returning')
		-- 	return
		-- end
		vim.schedule(function()
			a.run(move, indent)

			-- pcall(vim.cmd.move, direction)
			-- vim.schedule(function()
			-- 	vim.api.nvim_feedkeys('==', 'n', false)
			-- 	-- Schedule(vim.api.nvim_feedkeys, '==', 'n', false)
			-- end)
		end)
		-- last_time = cur_time
	end
end

local function move_visual_line(direction)
	return function()
		vim.cmd.move(direction)
		vim.api.nvim_feedkeys('==', 'n', false)
	end
end

local count = 0
local locked = false

local function ScheduleWrapAsync(fn, ...)
	local args = { ... }
	local async_fn = a.void(function() fn(unpack(args)) end)
	return ScheduleWrap(a.run, async_fn, nil)
end

local function ScheduleAsync(fn, ...)
	local args = { ... }
	local async_fn = a.void(function() fn(unpack(args)) end)
	nvim.schedule(a.run, async_fn, nil)
end

local over_the_counter = 0
local function fn1(direction)
	-- 	vim.cmd.move(move)
	-- 	vim.api.nvim_feedkeys('==', 'n', false)
	-- end)
	local indent = ScheduleWrapAsync(vim.api.nvim_feedkeys, '==', 'n', false)

	local mover = function(move)
		ScheduleAsync(function() pcall(vim.cmd.move, move) end)
	end

	local counter = 0
	local wrapped = function()
		counter = counter + direction
		if locked then
			-- WriteOut(over_the_counter .. ' locked')
			return
		end

		-- WriteOut(over_the_counter .. ' scheduling')
		locked = true

		vim.schedule(function()
			-- WriteOut(over_the_counter .. ' running schedule')

			local move
			if counter > 0 then
				move = '+' .. counter
			else
				move = tostring(math.min(-2, counter))
			end

			-- WriteOut(over_the_counter .. ' moving ' .. move)
			mover(move)

			-- WriteOut(over_the_counter .. ' indenting')
			indent()

			-- WriteOut(over_the_counter .. ' done')
			locked = false
			over_the_counter = over_the_counter + 1
			counter = 0
		end)
	end
	-- return ScheduleWrap(wrapped)
	return wrapped
end
-- Defer(2000, Util.print_out)

Nmap('<A-j>', move_line('+'))
Nmap('<A-k>', move_line('-2'))

Nmap('<A-j>', fn1(1))
Nmap('<A-k>', fn1(-1))
-- this is a comment

-- Nmap('<A-j>', counter(1))
-- Nmap('<A-k>', counter(-1))

-- nmap('<A-j>', '<cmd>m+<cr>==')
-- nmap('<A-k>', '<cmd>m-2<cr>==')

Vmap('<A-j>', ":m'>+<cr>`<my`>mzgv`yo`z=gv")
Vmap('<A-k>', ":m'<-2<cr>`>my`<mzgv`yo`z=gv")

-- nmap('<A-j>', 'mz<cmd>m+<cr>`z')
-- nmap('<A-k>', 'mz<cmd>m-2<cr>`z')
-- vmap('<A-j>', ":m'>+<cr>`<my`>mzgv`yo`z")
-- vmap('<A-k>', ":m'<-2<cr>`>my`<mzgv`yo`z")

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

------------------------------------------Blackhole Register----------------------------------------
-- Nmap('x', '"_x')
-- Nmap <leader>d "_d
-- Nmap <leader>c "_c
