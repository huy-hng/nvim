local M = {}

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

local function yank_operator()
	local old_func = vim.go.operatorfunc
	local prev_pos = vim.fn.getcurpos()

	---@diagnostic disable-next-line: duplicate-set-field
	_G.op_func_yank = function(type)
		nvim.normal('`[v`]y')

		-- local yanked_pos = vim.fn.getpos("'[")
		-- if is_in_area(prev_pos, yanked_pos) then vim.fn.cursor { prev_pos[2], prev_pos[3] } end
		vim.fn.cursor { prev_pos[2], prev_pos[3] }

		vim.go.operatorfunc = old_func
		_G.op_func_yank = nil
	end

	vim.go.operatorfunc = 'v:lua.op_func_yank'
	-- vim.api.nvim_feedkeys('g@', 'n', false)
	return 'g@'
end

Map.n(Keys.p, keep_column('p==', true), 'paste, keep column and indent')
Map.n(Keys.P, keep_column('P==', true), 'paste, keep column and indent')

Map.n(Keys.Y, keep_column('y$', false))
Map.v(Keys.y, keep_column('y', false))
Map.v(Keys.Y, keep_column('Y', false))
Map.v('<C-c>', keep_column('"+y'), 'Yank to clipboard')

-- Map.v(Keys.p, '"_c<C-r>"<esc>', 'keep yank register when pasting over visual selection')
Map.v(Keys.p, '"_dP', 'keep yank register when pasting over visual selection')

Map.n(Keys.y, yank_operator, '', { expr = true })
-- Map(Keys.y, YankOperator, '', { expr = true })
Map.n(Keys.yy, 'yy')

-- Nmap('yh', keep_column('yh'))
-- Nmap('yj', keep_column('yj'))
-- Nmap('yk', keep_column('yk'))
-- Nmap('yl', 'yl')

Map.n(Keys.J, keep_column('J'), 'keep column when joining lines')

----------------------------------copy current line above / below-----------------------------------

Map.i(Keys.alt.K, keep_column('yyPi', true), '')
Map.i(Keys.alt.J, keep_column('yypi', true), '')

Map.n(Keys.alt.J, keep_column('yyp', true), '')
Map.n(Keys.alt.K, keep_column('yyP', true), '')

Map.v(Keys.alt.J, keep_column("Y'>p"), '')
Map.v(Keys.alt.K, keep_column("Y'<P"), '')

------------------------------------move line(s) above / below--------------------------------------

local a = require('plenary.async')
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
local function fn1(direction, should_indent)
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
		if locked then return end
		locked = true

		vim.schedule(function()
			local move
			if counter > 0 then
				move = '+' .. counter
			else
				move = tostring(math.min(-2, counter))
			end

			mover(move)
			if should_indent then indent() end

			locked = false
			over_the_counter = over_the_counter + 1
			counter = 0
		end)
	end
	-- return ScheduleWrap(wrapped)
	return wrapped
end
-- Defer(2000, Util.print_out)

-- Map.n('<A-j>', move_line('+'), '')
-- Map.n('<A-k>', move_line('-2'), '')

Map.n(Keys.alt.j, fn1(1, true), '')
Map.n(Keys.alt.k, fn1(-1, true), '')

Map.i(Keys.alt.j, fn1(1), '')
Map.i(Keys.alt.k, fn1(-1), '')
-- this is a comment

-- Nmap('<A-j>', counter(1))
-- Nmap('<A-k>', counter(-1))

-- nmap('<A-j>', '<cmd>m+<cr>==')
-- nmap('<A-k>', '<cmd>m-2<cr>==')

Map.v(Keys.alt.j, ":m'>+<cr>`<my`>mzgv`yo`z=gv", '')
Map.v(Keys.alt.k, ":m'<-2<cr>`>my`<mzgv`yo`z=gv", '')

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
