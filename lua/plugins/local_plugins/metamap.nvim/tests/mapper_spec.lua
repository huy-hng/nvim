Augroup('Reloadtestffile', {
	Autocmd('BufWritePost', vim.fn.expand('%'), { nvim.feedkeys, '<Plug>PlenaryTestFile', true }),
})

---@return saved_buffer_keymap
local find_map = function(lhs, mode)
	local maps = vim.api.nvim_get_keymap(mode or 'n')
	for _, map in ipairs(maps) do
		if map.lhs == lhs then return map end
	end
end

describe('mapper', function()
	local map = require('metamap.mapper')

	local lhs_string = 'asdf'
	local lhs_table = { 'sdfg', 'dfgh' }

	local rhs_string = 'echom "hello"'
	local rhs_function = function() print('hello function') end
	local rhs_function2 = function() print('hello function2') end
	local rhs_table = { print, 'hello table' }

	before_each(function()
		pcall(vim.keymap.del, 'n', lhs_string)
		for _, lhs in ipairs(lhs_table) do
			pcall(vim.keymap.del, 'n', lhs)
		end

		local found = find_map(lhs_string)
		assert.is_nil(found)
	end)

	it('lhs: string, rhs: string', function()
		map.n(lhs_string, rhs_string)

		local found = find_map(lhs_string)
		assert(found)
		assert.are.same(rhs_string, found.rhs)
	end)

	it('lhs: string, rhs: function', function()
		map.n(lhs_string, rhs_function)

		local found = find_map(lhs_string)
		assert(found)
		assert.is_nil(found.rhs)
		assert.is_function(found.callback)
		assert.are.same(rhs_function, found.callback)
		assert.are_not_same(rhs_function2, found.callback)
	end)

	it('lhs: string, rhs: table', function()
		map.n(lhs_string, rhs_table)

		local found = find_map(lhs_string)
		assert(found)
		assert.is_nil(found.rhs)
		assert.is_function(found.callback)
	end)

	it('lhs: table, rhs: string', function()
		map.n(lhs_table, rhs_string)

		for _, l in ipairs(lhs_table) do
			local found = find_map(l)
			assert(found)
			assert.are.same(rhs_string, found.rhs)
		end
	end)

	it('map(mode, ...)', function()
		map('v', lhs_string, rhs_string)
		local found = find_map(lhs_string, 'v')

		assert(found)
		assert(found.mode == 'v')

		assert.are.same(rhs_string, found.rhs)
	end)

	it('map(multiple modes, ...)', function()
		map({'v', 'i'}, lhs_string, rhs_string)
		local found_i = find_map(lhs_string, 'i')
		local found_v = find_map(lhs_string, 'v')

		assert(found_v.mode == 'v')
		assert(found_i.mode == 'i')

		assert.are.same(found_v.rhs, found_i.rhs)
		assert.are.same(found_v.lhs, found_i.lhs)
	end)
end)
