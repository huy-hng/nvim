-- local maps = vim.api.nvim_buf_get_keymap(0, 'n')
-- for _, map in ipairs(maps) do
-- 	print(map.lhs, map.desc)
-- end
-- print(#maps)

Nmap('<localleader>t', '<Plug>PlenaryTestFile', '', { remap = true })

local find_map = function(lhs)
	local maps = vim.api.nvim_get_keymap('n')

	for _, map in ipairs(maps) do
		if map.lhs == lhs then return map end
	end
end

if true then return end

describe('metamap', function()
	-- before_each(function()
	-- 	require('metamap.class')._clear()

	-- 	-- Please don't have this mapping when we start.
	-- 	pcall(vim.keymap.del, 'n', 'asdfasdf')
	-- end)

	-- it('can be required', function() require('metamap.class') end)

	it('can push a single mapping', function()
		local MetaMap = require('metamap.class')
		local map = MetaMap.new('test')
		map:nmap('asdfasdf', { print, 'hello' }, 'some desc', {})
		map:enter('n', '<leader>r')
		Feedkeys(' r', true)

		local found = find_map('asdfasdf')
		P(found)
		assert(found)
		-- assert.are.same(rhs, found.rhs)
	end)

	-- it('can push multiple mappings', function()
	-- 	local rhs = "echo 'This is a test'"
	-- 	require('metamap.class').push('test1', 'n', {
	-- 		['asdf_1'] = rhs .. '1',
	-- 		['asdf_2'] = rhs .. '2',
	-- 	})

	-- 	local found_1 = find_map('asdf_1')
	-- 	assert.are.same(rhs .. '1', found_1.rhs)

	-- 	local found_2 = find_map('asdf_2')
	-- 	assert.are.same(rhs .. '2', found_2.rhs)
	-- end)

	-- it('can delete mappings after pop: no existing', function()
	-- 	local rhs = "echo 'This is a test'"
	-- 	require('metamap.class').push('test1', 'n', {
	-- 		asdfasdf = rhs,
	-- 	})

	-- 	local found = find_map('asdfasdf')
	-- 	assert.are.same(rhs, found.rhs)

	-- 	require('metamap.class').pop('test1', 'n')
	-- 	local after_pop = find_map('asdfasdf')
	-- 	assert.are.same(nil, after_pop)
	-- end)

	-- it('can delete mappings after pop: yes existing', function()
	-- 	vim.keymap.set('n', 'asdfasdf', "echo 'OG MAPPING'")

	-- 	local rhs = "echo 'This is a test'"
	-- 	require('metamap.class').push('test1', 'n', {
	-- 		asdfasdf = rhs,
	-- 	})

	-- 	local found = find_map('asdfasdf')
	-- 	assert.are.same(rhs, found.rhs)

	-- 	require('metamap.class').pop('test1', 'n')
	-- 	local after_pop = find_map('asdfasdf')
	-- 	assert.are.same("echo 'OG MAPPING'", after_pop.rhs)
	-- end)
end)
