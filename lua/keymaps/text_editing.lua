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

local function yank_operator()
	local old_func = vim.go.operatorfunc
	local prev_pos = vim.api.nvim_win_get_cursor(0)
	local mode_lookup = {
		char = '`[v`]y',
		line = "'[V']y",
		block = '`[<C-V>`]',
	}

	---@diagnostic disable-next-line: duplicate-set-field
	_G.yank_operator = function(type)
		nvim.normal(mode_lookup[type])

		vim.api.nvim_win_set_cursor(0, prev_pos)
		vim.go.operatorfunc = old_func
		_G.yank_operator = nil
	end

	vim.go.operatorfunc = 'v:lua.yank_operator'
	return 'g@'
end

Map.n(Keys.y, yank_operator, 'yank op', { expr = true })
Map.o(Keys.y, 'g@')

Map.n(Keys.Y, keep_column('y$', false))
Map.v(Keys.y, keep_column('y', false))
Map.v(Keys.Y, keep_column('Y', false))
Map.v('<C-c>', keep_column('"+y'), 'Yank to clipboard')

Map.n(Keys.p, keep_column('p==', true), 'paste, keep column and indent')
Map.n(Keys.P, keep_column('P==', true), 'paste, keep column and indent')

local function paste_without_yank()
	local mode_behavior = {
		v = '"_c<C-r>"<esc>',
		V = '"_dP',
		[''] = '"_dP',
	}
	return mode_behavior[vim.fn.visualmode()]
end

Map.v(Keys.p, paste_without_yank, 'keep yank when pasting over visual', { expr = true })

Map.n(Keys.ctrl.join_lines, keep_column('J'), 'keep column when joining lines')

----------------------------------copy current line above / below-----------------------------------

------------------------------------move line(s) above / below--------------------------------------

---------------------------------------------Substitution-------------------------------------------

Map.n(
	'<leader>r',
	function() return [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]] end,
	'Substitute word under cursor',
	{ silent = false, expr = true }
)

--------------------------------------------Indentation---------------------------------------------

Map.i('<C-Tab>', '<C-t>')
Map.i('<S-Tab>', '<C-d>')
Map.i('<C-S-Tab>', '<C-d>')

Map.n('<C-Tab>', '>>')
Map.n('<S-Tab>', '<<')
Map.n('<C-S-Tab>', '<<')

Map.v('<Tab>', '>gv')
Map.v('<C-Tab>', '>gv')
Map.v('<S-Tab>', '<gv')
Map.v('<C-S-Tab>', '<gv')
