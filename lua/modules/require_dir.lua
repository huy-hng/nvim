REQUIRES_FILE_NAME = 'requires'

local function correct_format(relative_path) return string.gsub(relative_path, '/', '.') end

local function get_all_requires(dir)
	local file_paths = vim.api.nvim_get_runtime_file(dir .. '/**/*.lua', true)

	local formatted = {}
	for _, path in ipairs(file_paths) do
		-- find first 'lua' and capture everything until '.lua
		local relative = string.match(path, 'nvim/lua/(.*).lua$')

		-- skip the requires.lua file thats being created by this script
		local is_requires_file = string.find(relative, REQUIRES_FILE_NAME)
		if is_requires_file then
			goto continue
		end

		local format = correct_format(relative)

		local is_init_file = string.match(path, dir .. '/init.lua')
		if is_init_file then
			table.insert(formatted, 1, format)
		else
			table.insert(formatted, format)
		end

		::continue::
	end
	return formatted
end

local function write_to_file(dir, text)
	-- Opens a file in read
	local dir_path = vim.api.nvim_get_runtime_file(dir, true)[1]
	local file_path = dir_path .. '/' .. REQUIRES_FILE_NAME .. '.lua'
	local file = io.open(file_path, 'w')
	-- sets the default output file as test.lua
	io.output(file)

	for _, path in ipairs(text) do
		local require_text = "require '" .. correct_format(path) .. "'\n"
		io.write(require_text)
	end
	io.close(file)

	-- return file_path
end

function UpdateAllRequireFiles()
	for _, dir in ipairs(REQUIRE_DIRS) do
		local requires = get_all_requires(dir)
		write_to_file(dir, requires)
	end
end

vim.cmd('command! UpdateAllRequireFiles lua UpdateAllRequireFiles()')

return function(dir)
	for _, require_file in ipairs(get_all_requires(dir)) do
		require(require_file)
		-- local stack_trace = debug.traceback('require_dir: Error importing: ' .. require_file, 2)
		--local status, errors = pcall(require, require_file)
		-- if not status then print(stack_trace, errors) end
	end
end
