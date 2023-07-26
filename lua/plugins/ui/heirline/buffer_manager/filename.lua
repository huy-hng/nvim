local Path = require('plenary.path')

local M = {}

function M.normalize_path(item)
	if string.find(item, '.*:///.*') ~= nil then return Path:new(item) end
	return Path:new(Path:new(item):absolute()):make_relative(vim.loop.cwd())
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
	local truncation = truncated > 0 and '..' .. truncated .. sep or ''

	local icon = ''
	if add_icon then
		icon, _ = M.get_icon(filename)
	end

	filename = M.get_filename(filename)
	return icon .. truncation .. path .. filename
end

function M.get_short_file_name(file) return M.truncate_path(file, 1, true) end

function M.get_short_term_name(term_name) return term_name:gsub('://.*//', ':') end

return M
