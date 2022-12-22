function NilTrue(input) return input == nil and true or input end

function Wrap(f, ...)
	local args = { ... }
	return function() return f(unpack(args)) end
end

local output = ''
function WriteOut(str) output = output .. str .. '\n' end
function PrintOut()
	print(output)
	output = ''
end
-- function WriteOut(str) vim.api.nvim_out_write(str .. '\r') end
-- function PrintOut() vim.api.nvim_out_write('\n') end

function Out(...)
	for _, arg in ipairs { ... } do
		if type(arg) == 'number' then arg = tostring(arg) end
		vim.api.nvim_out_write(arg)
		vim.api.nvim_out_write(' ')
	end
	vim.api.nvim_out_write('\n')
end

---@param rhs table
---@param traceback_level integer | nil if traceback_level is nil, dont try (faster)
function ExtractFnFromTable(rhs, traceback_level)
	if type(rhs) ~= 'table' then return rhs end

	local fn = table.remove(rhs, 1)
	local args = rhs
	if traceback_level then --
		return TryWrap(traceback_level, fn, unpack(args))
	end

	return function() fn(unpack(args)) end
end

---@param x number number to clamp
---@param lower number lower bound
---@param upper number upper bound
---@return number
function math.clamp(x, lower, upper) --
	return math.min(upper, math.max(x, lower))
end

--- round to nearest integer
---@param x number
function math.round(x) --
	return math.floor(x + 0.5)
end

-----------------------------------------------Buffers----------------------------------------------

function BuffersOpened() return vim.fn.len(vim.fn.getbufinfo { buflisted = 1 }) end

function QuitLastBuffer()
	if BuffersOpened() > 1 then
		vim.cmd.Bdelete()
		return
	end
	vim.cmd.quit()
end

function SaveAndSource()
	-- vim.cmd([[
	-- :silent! wa
	-- :silent! write
	-- if &filetype == 'vim'
	-- 	:source %
	-- elseif &filetype == 'lua'
	-- 	:luafile %
	-- endif
	-- ]])

	vim.cmd.wa()
	if vim.bo.filetype == 'vim' then
		vim.cmd.source('%')
	elseif vim.bo.filetype == 'lua' then
		vim.cmd.luafile('%')
	end
end
