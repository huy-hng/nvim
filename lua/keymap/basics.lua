Map.n('QQ', '<cmd>qa<cr>', 'Quick exit vim')
-- Map.v('QQ', '<cmd>qa<cr>', 'Quick exit vim')

Map.n('<F1>', '')

Map.n('<S-SPACE>', '')
Map.n('<C-SPACE>', '')

Map.nv(Keys.cmdline_window, 'q:')
Map.nv(Keys.search_window, 'q/')

Map('-', '^')
Map('+', '$')

Map('Q', '')
Map(Keys.alt.q, 'q')

local remap = true
-- if not nrequire('which-key') then
-- 	Map('`', "'", 'Jump to mark in line')
-- 	remap = false
-- end
Map("'", '`', 'Jump to mark in column', { remap = remap })

-- Map('0', '^')
-- Map('^', '0')
-- Map('g0', 'g^')
-- Map('g^', 'g0')

Map(Keys.v, 'v', 'Visual')
Map.nv(Keys.ctrl.v, '<C-v>')
Map.n(Keys.vv, 'V', 'V-line')
Map.n(Keys.V, 'vg_')
Map.v(Keys.V, 'V')

-- break undo sequence before pasting from register
Map.i(',', ',<c-g>u')
Map.i('.', '.<c-g>u')
Map.i(';', ';<c-g>u')
Map.i('<C-r>', '<C-g>u<C-r>')

-- Map.t('<C-d>', [[<C-\><C-N>"pi]], 'paste')
-- :tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

Map.c('<C-d>', '<C-r>+', 'Paste from clipboard', { silent = false })

local function direction(next)
	return function()
		local forward = vim.v.searchforward == 1
		local dir = forward and next or next == 'n' and 'N' or 'n'
		-- keep cursor centered when searching
		return dir .. 'zzzv'
	end
end

Map(Keys.n, direction('n'), 'Next search result', { expr = true })
Map(Keys.N, direction('N'), 'Next search result', { expr = true })





local function keep_column(action, change_line, alt_method)
	return function()
		if alt_method then
			-- this entire thing can be simplified with just marks
			-- only change_line isnt implemented with this
			-- nvim.feedkeys('mz' .. action .. '`z')
			vim.api.nvim_feedkeys('mz' .. action .. '`z', 'n', false)

			return
		end
		local column = vim.fn.col('.')
		local line = vim.fn.line('.')

		-- nvim.normal(action)
		vim.api.nvim_exec2('normal! ' .. action, {})

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
		-- nvim.normal(mode_lookup[type])
		vim.api.nvim_exec2('normal! ' .. mode_lookup[type], {})
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

