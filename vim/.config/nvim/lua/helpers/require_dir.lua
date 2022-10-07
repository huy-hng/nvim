print_requires = false
requires_file_name = 'requires'

function write_to_file(dir, text)
	-- Opens a file in read
	local dir_path = vim.api.nvim_get_runtime_file(dir, true)
	local file_path = dir_path .. '/' .. requires_file_name .. '.lua'
	local file = io.open(file_path, 'w')
	-- sets the default output file as test.lua
	io.output(file)

	for i, path in ipairs(text) do
		io.write(text)
	end
	io.close(file)

	-- return file_path
end

function test()
	local dir = 'lua/plugins'
end
-- test()

function correct_format(relative_path)
	return string.gsub(relative_path, '/', '.')
end

function update_requires_file(dir)
	local file_paths = vim.api.nvim_get_runtime_file(dir..'/*.lua', true)

	formatted = {}
	local requires_file
	for i, path in ipairs(file_paths) do
		-- find first 'lua' and capture everything until '.lua
		local relative = string.match(path, 'lua/(.*).lua$')
		relative = correct_format(relative)

		-- skip the requires.lua file thats being created by this script
		local is_requires_file = string.find(relative, requires_file_name)
		if is_requires_file then
			requires_file = relative
			goto continue
		end

		local require_text = "require '"..relative.."'\n"
		table.insert(formatted, require_text)

		::continue::
	end

	write_to_file(dir, formatted)
	-- local require_dir = correct_format(dir)
	-- local requires_file = require_dir .. '.' .. requires_file_name .. '.lua'

	return requires_file
end

return function(dir)
	local requires_file = update_requires_file(dir)
	require(requires_file)

	-- for i, path in ipairs(file_paths) do
	-- 	require(correct_format)
	-- end
	
	-- if print_requires then print(' ') end
end
