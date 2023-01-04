local M = {}

function M.nil_and_true(input) return input == nil and true or input end

---@param winid number?
---@return win_type
function M.win_type(winid) return vim.fn.win_gettype(winid) end

---@param winid number?
function M.is_cmdwin(winid)
	winid = winid or vim.api.nvim_get_current_win()
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
	if traceback_level then --
		return TryWrap(traceback_level, fn, unpack(args))
	end

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

return M
