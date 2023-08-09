local Path = require('plenary.path')

local M = {}

---@param path string[]
---@return table
function M.get_extmark_path(path, remove_last_separator)
	local virt_line = {}

	for _, dir in ipairs(path) do
		table.insert(virt_line, { dir })
		table.insert(virt_line, { '  ', 'Operator' })
	end
	if Util.nil_or_true(remove_last_separator) then table.remove(virt_line, #virt_line) end

	return virt_line
end

function M.get_extmark_name(filename)
	local display_name = {}
	-- if add_icon then table.insert(display_name, M.get_icon(filename)) end

	local extension = '.' .. vim.fn.fnamemodify(filename, ':e')
	local fname = filename == '' and '[No Name]' or vim.fn.fnamemodify(filename, ':t:r')

	table.insert(display_name, { fname, 'Tag' })
	table.insert(display_name, { extension, 'NonText' })
	table.insert(display_name, { vim.fn['repeat'](' ', #filename) })
	return display_name
end

function M.normalize_path(item)
	if string.find(item, '.*:///.*') ~= nil then return item end
	return Path:new(item):normalize()
	-- return Path:new(Path:new(item):absolute()):make_relative(vim.loop.cwd())
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
	return { f_icon, f_hl }
end

function M.get_path_folders(filename, folder_amount, normalize)
	folder_amount = folder_amount or 0

	if Util.nil_or_true(normalize) then --
		-- filename = M.normalize_path(filename)
		local normalized = M.normalize_path(filename)
		if type(normalized) ~= 'table' then
			filename = normalized
		end
	end

	local path = vim.fn.fnamemodify(filename, ':h')
	local split = path:split('/')

	if folder_amount == 0 then return split, 0 end

	local folders = {}
	if folder_amount > 0 and #split > 0 then
		for i = #split - (folder_amount - 1), #split do
			table.insert(folders, split[i])
		end
	end

	local truncated = (#split - folder_amount)

	return folders, truncated
end

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
	local truncation = truncated > 0 and '..' .. truncated .. sep or ''

	local icon = add_icon and M.get_icon(filename)[1] or ''

	filename = M.get_filename(filename)
	return icon .. truncation .. path .. filename
	-- return truncation .. path .. filename
end

function M.truncate_path_hl(filename, folder_amount)
	local path = {}
	if folder_amount > 0 then
		local folders, _ = M.get_path_folders(filename, folder_amount)
		path = M.get_extmark_path(folders, false)
	end
	local icon = M.get_icon(filename)

	filename = M.get_extmark_name(filename)
	return table.add({ icon }, path, filename)
end

function M.get_short_file_name(file) return M.truncate_path(file, 1, true) end

function M.get_short_term_name(term_name) return term_name:gsub('://.*//', ':') end

return M
