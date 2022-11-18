local function move_selection(len)
end

function Surrounder(...)
	local args = { ... }
	return function()
		local char1 = args[1]
		local char2 = args[1]
		if #args > 1 then
			char2 = args[2]
		end

		Feedkeys('<esc>`>a' .. char2 .. '<esc>`<i' .. char1 .. '<esc>')
		-- move_selection(vim.fn.strlen(char1))
		local len = vim.fn.strlen(char1)
		Feedkeys('gv' .. len .. 'lo' .. len .. 'l')
	end
end


vmap("'", Surrounder("'"))
vmap('"', Surrounder('"'))
vmap('<A-*>', Surrounder('*'))
vmap('`', Surrounder('`'))
-- vmap('=', Surrounder('='))

vmap('(', Surrounder('(', ')'))
vmap(')', Surrounder('( ', ' )'))

vmap('<', Surrounder('<', '>'))
vmap('>', Surrounder('< ', ' >'))

vmap('[', Surrounder('[', ']'))
vmap(']', Surrounder('[ ', ' ]'))

vmap('{', Surrounder('{', '}'))
vmap('}', Surrounder('{ ', ' }'))
