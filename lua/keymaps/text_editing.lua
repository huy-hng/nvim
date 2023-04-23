local M = {}
local native = require('config.native_keymaps')

local function keep_column(action, change_line, alt_method)
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
	if is_in_area(prev_pos, yanked_pos) then vim.fn.cursor { unpack(prev_pos, 2) } end

	prev_pos = nil
	vim.go.operatorfunc = ''
end

Map.n(native.p, keep_column('p==', true), 'paste, keep column and indent')
Map.n(native.P, keep_column('P==', true), 'paste, keep column and indent')
Map.v(native.y, keep_column('y', false, true))
Map.v(native.Y, keep_column('Y'))
Map.v('<C-c>', keep_column('"+y'), 'Yank to clipboard')

Map.v(native.p, '"_c<C-r>"<esc>', 'keep yank register when pasting over visual selection')

-- Nmap('y', yank_operator, '', { expr = true })
-- Nmap('y', YankOperator, '', { expr = true })
-- Nmap('yy', 'yy')

-- Nmap('yh', keep_column('yh'))
-- Nmap('yj', keep_column('yj'))
-- Nmap('yk', keep_column('yk'))
-- Nmap('yl', 'yl')

Map.n(native.J, keep_column('J'), 'keep column when joining lines')

----------------------------------copy current line above / below-----------------------------------

Map.i('<A-K>', keep_column('yyPi', true), '', { langmap = false })
Map.i('<A-J>', keep_column('yypi', true), '', { langmap = false })

Map.n('<A-J>', keep_column('yyp', true), '', { langmap = false })
Map.n('<A-K>', keep_column('yyP', true), '', { langmap = false })

Map.v('<A-J>', keep_column("Y'>p"), '', { langmap = false })
Map.v('<A-K>', keep_column("Y'<P"), '', { langmap = false })

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

local locked = false

local function ScheduleWrapAsync(fn, ...)
	local args = { ... }
	local async_fn = a.void(function() fn(unpack(args)) end)
	return nvim.schedule_wrap(a.run, async_fn, nil)
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

Map.n('<A-j>', move_line('+'), '', { langmap = false })
Map.n('<A-k>', move_line('-2'), '', { langmap = false })

Map.n('<A-j>', fn1(1), '', { langmap = false })
Map.n('<A-k>', fn1(-1), '', { langmap = false })
-- this is a comment

-- Nmap('<A-j>', counter(1))
-- Nmap('<A-k>', counter(-1))

-- nmap('<A-j>', '<cmd>m+<cr>==')
-- nmap('<A-k>', '<cmd>m-2<cr>==')

Map.v('<A-j>', ":m'>+<cr>`<my`>mzgv`yo`z=gv", '', { langmap = false })
Map.v('<A-k>', ":m'<-2<cr>`>my`<mzgv`yo`z=gv", '', { langmap = false })

-- nmap('<A-j>', 'mz<cmd>m+<cr>`z')
-- nmap('<A-k>', 'mz<cmd>m-2<cr>`z')
-- vmap('<A-j>', ":m'>+<cr>`<my`>mzgv`yo`z")
-- vmap('<A-k>', ":m'<-2<cr>`>my`<mzgv`yo`z")

---------------------------------------------Substitution-------------------------------------------

Map.n(
	'<leader>ss',
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	'Substitute word under cursor'
)
--------------------------------------------Indentation---------------------------------------------

Map.i('<C-Tab>', '<C-t>')
Map.i('<S-Tab>', '<C-d>')
Map.i('<C-S-Tab>', '<C-d>')

Map.n('<C-Tab>', '>>')
Map.n('<S-Tab>', '<<')
Map.n('<C-S-Tab>', '<<')

Map.v('<Tab>', '>gv')
Map.v('<S-Tab>', '<gv')

------------------------------------------Blackhole Register----------------------------------------
-- Nmap('x', '"_x')
-- Nmap <leader>d "_d
-- Nmap <leader>c "_c

M.keep_column = keep_column

return M
