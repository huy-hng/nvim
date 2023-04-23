local M = {}

function M.nil_or_true(input) return input == nil and true or input end

---@param winid number?
---@return win_type
function M.win_type(winid)
	winid = winid or vim.api.nvim_get_current_win()
	return vim.fn.win_gettype(winid)
end

---@param winid number?
function M.is_cmdwin(winid)
	local type = M.win_type(winid)

	local mode = vim.fn.mode()
	return type == 'command' or mode == 'c'
end

---@param f function
---@param ... any
function M.wrap(f, ...)
	local args = { ... }
	return function() return f(unpack(args)) end
end

local output = ''
function M.write_out(str) output = output .. str .. '\n' end

function M.print_out()
	print(output)
	output = ''
end

-- function WriteOut(str) vim.api.nvim_out_write(str .. '\r') end
-- function PrintOut() vim.api.nvim_out_write('\n') end

function M.out(...)
	for _, arg in ipairs { ... } do
		if type(arg) == 'number' then arg = tostring(arg) end
		vim.api.nvim_out_write(arg)
		vim.api.nvim_out_write(' ')
	end
	vim.api.nvim_out_write('\n')
end

---@param rhs table
---@param traceback_level integer | nil if traceback_level is nil, dont try (faster)
function M.extract_fn_from_table(rhs, traceback_level)
	if type(rhs) ~= 'table' then return rhs end

	local fn = table.remove(rhs, 1)
	local args = rhs
	if type(traceback_level) == 'number' then --
		return TryWrap(traceback_level, fn, unpack(args))
	end

	return function() fn(unpack(args)) end
end

---@param tbl table
function M.table_to_function(tbl)
	if type(tbl) ~= 'table' then return tbl end
	local fn = select(1, unpack(tbl))
	local args = { select(2, unpack(tbl)) }
	return function() fn(unpack(args)) end
end
-----------------------------------------------Buffers----------------------------------------------

function M.open_buffers() return vim.fn.len(vim.fn.getbufinfo { buflisted = 1 }) end

function M.quit_last_buffer()
	if M.open_buffers() > 1 then
		vim.cmd.Bdelete()
		return
	end
	vim.cmd.quit()
end

function M.save_and_source()
	-- vim.cmd([[
	-- :silent! wa
	-- :silent! write
	-- if &filetype == 'vim'
	-- 	:source %
	-- elseif &filetype == 'lua'
	-- 	:luafile %
	-- endif
	-- ]])

	pcall(vim.cmd.wa)
	if vim.bo.filetype == 'vim' then
		vim.cmd.source('%')
	elseif vim.bo.filetype == 'lua' then
		vim.cmd.luafile('%')
	end
end

---@param silent boolean?
---@param values? {[1]:any, [2]:any}
function M.toggle(option, silent, values)
	if values then
		if vim.opt_local[option]:get() == values[1] then
			vim.opt_local[option] = values[2]
		else
			vim.opt_local[option] = values[1]
		end
		return vim.notify(
			'Set ' .. option .. ' to ' .. vim.opt_local[option]:get(),
			INFO,
			{ title = 'Option' }
		)
	end
	vim.opt_local[option] = not vim.opt_local[option]:get()
	if not silent then
		if vim.opt_local[option]:get() then
			vim.notify('Enabled ' .. option, INFO, { title = 'Option' })
		else
			vim.notify('Disabled ' .. option, WARN, { title = 'Option' })
		end
	end
end

-- FIXME: create a togglable termiminal
-- Opens a floating terminal (interactive by default)
---@param cmd? string[]|string
---@param opts? LazyCmdOptions|{interactive?:boolean}
function M.float_term(cmd, opts)
	opts = vim.tbl_deep_extend('force', {
		size = { width = 0.67, height = 0.8 },
	}, opts or {})
	require('lazy.util').float_term(cmd, opts)
end

return M
