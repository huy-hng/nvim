local Path = require('plenary.path')

local M = {}

function M.get_extmark_name(filename)
	local display_name = { M.get_icon(filename) }

	-- local project_root = vim.loop.cwd()
	-- local path = vim.fn.fnamemodify(filename, ':h')
	-- local folders = path:split('/')

	-- local folders, truncated = M.get_path_folders(filename, 0)
	-- if truncated > 0 then
	-- 	table.insert(display_name, { '..' .. truncated .. '  ', 'NonText' })
	-- end

	-- for _, folder in ipairs(folders) do
	-- 	table.insert(display_name, { folder })
	-- 	table.insert(display_name, { '  ', 'Operator' })
	-- end

	local fname, extension = M.get_filename_hl(filename)
	table.insert(display_name, fname)
	table.insert(display_name, extension)
	table.insert(display_name, { vim.fn['repeat'](' ', #filename) })
	return display_name
end

function M.normalize_path(item)
	if string.find(item, '.*:///.*') ~= nil then return Path:new(item) end
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
	folder_amount = folder_amount or 1

	if Util.nil_or_true(normalize) then --
		filename = M.normalize_path(filename)
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

function M.get_filename_hl(filename)
	local extension_hl = 'NonText'
	local extension = '.' .. vim.fn.fnamemodify(filename, ':e')
	filename = filename == '' and '[No Name]' or vim.fn.fnamemodify(filename, ':t:r')
	local filename_hl = 'Tag'

	return { filename, filename_hl }, { extension, extension_hl }
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

function M.get_short_file_name(file) return M.truncate_path(file, 1, true) end

function M.get_short_term_name(term_name) return term_name:gsub('://.*//', ':') end

return M
