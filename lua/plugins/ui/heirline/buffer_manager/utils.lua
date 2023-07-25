local Path = require('plenary.path')
local lualine_comp = require('plugins.ui.lualine.components')

local M = {}

function M.remove_duplicates(list)
	local hash = {}
	local res = {}

	for _, mark in ipairs(list) do
		if not hash[mark] then
			res[#res + 1] = mark
			hash[mark] = true
		else
			print('removing duplicate', mark.filename)
		end
	end
	return res
end

function M.normalize_path(item)
	if string.find(item, '.*:///.*') ~= nil then return Path:new(item) end
	return Path:new(Path:new(item):absolute()):make_relative(vim.loop.cwd())
end

function M.get_relative_file_name(file)
	file = M.normalize_path(file)
	file = tostring(file)

	local path = vim.fn.fnamemodify(file, ':h')
	local split = path:split('/')

	-- local folder = #split > 0 and split[#split] .. '  ' or ''
	local folder = #split > 0 and split[#split] .. '|' or ''

	return folder .. M.get_file_name(file)
end

function M.get_icon(filename)
	local f_icon = ''
	local f_hl
	local devicons = nrequire('nvim-web-devicons')

	if devicons then
		local extension = vim.fn.fnamemodify(filename, ':e')
		f_icon, f_hl = devicons.get_icon(filename, extension, { default = true })
		f_icon = f_icon .. ' '
	end
	return f_icon, f_hl
end

function M.get_path_folders(filename, folder_amount, normalize)
	folder_amount = folder_amount or 1

	if Util.nil_or_true(normalize) then --
		filename = M.normalize_path(filename)
	end

	local path = vim.fn.fnamemodify(filename, ':h')
	local split = path:split('/')

	local folders = {}
	if folder_amount > 0 and #split > 0 then
		for i = #split - (folder_amount - 1), #split do
			table.insert(folders, split[i])
		end
	end

	local truncated = (#split - folder_amount)

	return folders, truncated
end

function M.get_file_name(file) return file:match('[^/\\]*$') end

function M.get_filename(filename, extension)
	local mods = ':t'
	if extension then mods = mods .. ':r' end
	return filename == '' and '[No Name]' or vim.fn.fnamemodify(filename, mods)
end

function M.truncate_path(filename, folder_amount, add_icon)
	local folders, truncated = M.get_path_folders(filename, folder_amount)
	local sep = '  '
	local path = string.join(folders, sep)
	-- local truncation = truncated > 0 and '(' .. truncated .. ')' .. sep or ''
	local truncation = truncated > 0 and '..' .. sep or ''

	local icon = ''
	if add_icon then
		icon, _ = M.get_icon(filename)
	end

	filename = M.get_filename(filename)
	return icon .. truncation .. path .. filename
end

function M.shorten_path2(file)
	-- Get normalized file path
	file = M.normalize_path(file)
	-- File to string
	file = tostring(file)
	-- Count the number of slashes in the relative file path
	local slash_count = 0
	for _ in string.gmatch(file, '/') do
		slash_count = slash_count + 1
	end
	if slash_count == 0 then
		return M.get_file_name(file)
	else
		-- Return the file name preceded by the number of slashes
		return slash_count .. '|' .. M.get_file_name(file)
	end
end

function M.get_short_file_name(file) return M.truncate_path(file, 1, true) end

function M.get_short_term_name(term_name) return term_name:gsub('://.*//', ':') end

function M.absolute_path(item) return Path:new(item):absolute() end

function M.is_white_space(str) return str:gsub('%s', '') == '' end

function M.buffer_is_valid(buf_id, buf_name) --
	return 1 == vim.fn.buflisted(buf_id) and buf_name ~= ''
end

-- tbl_deep_extend does not work the way you would think
local function merge_table_impl(t1, t2)
	for k, v in pairs(t2) do
		if type(v) == 'table' then
			if type(t1[k]) == 'table' then
				merge_table_impl(t1[k], v)
			else
				t1[k] = v
			end
		else
			t1[k] = v
		end
	end
end

function M.merge_tables(...)
	local out = {}
	for i = 1, select('#', ...) do
		merge_table_impl(out, select(i, ...))
	end
	return out
end

function M.deep_copy(obj, seen)
	-- Handle non-tables and previously-seen tables.
	if type(obj) ~= 'table' then return obj end
	if seen and seen[obj] then return seen[obj] end

	-- New table; mark it as seen and copy recursively.
	local s = seen or {}
	local res = {}
	s[obj] = res
	for k, v in pairs(obj) do
		res[M.deep_copy(k, s)] = M.deep_copy(v, s)
	end
	return setmetatable(res, getmetatable(obj))
end

return M
