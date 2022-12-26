local symbolwinbar = require('lspsaga.symbolwinbar')

local lualine = require('lualine')

local function get_file_name(include_path)
	local file_name = symbolwinbar.get_file_name()
	if vim.fn.bufname('%') == '' then return '' end
	if include_path == false then return file_name end
	-- Else if include path: ./lsp/saga.lua -> lsp > saga.lua
	local sep = vim.loop.os_uname().sysname == 'Windows' and '\\' or '/'
	local path_list = vim.split(string.gsub(vim.fn.expand('%:~:.:h'), '%%', ''), sep)
	local file_path = ''
	for _, cur in ipairs(path_list) do
		file_path = (cur == '.' or cur == '~') and ''
			or file_path .. cur .. ' ' .. '%#LspSagaWinbarSep#>%*' .. ' %*'
	end
	return file_path .. file_name
end

local function get_symbol()
	local sym = symbolwinbar.get_symbol_node() or ''
	return sym
end

local function config_winbar_or_statusline()
	local exclude = {
		['terminal'] = true,
		-- ['vimwiki'] = true,
		['toggleterm'] = true,
		['prompt'] = true,
		['NvimTree'] = true,
		['help'] = true,
	} -- Ignore float windows and exclude filetype
	if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
		-- vim.wo.winbar = ''
	else
		local win_val = get_file_name(true) -- set to true to include path
		win_val = win_val .. get_symbol()

		-- vim.wo.winbar = win_val
		-- lualine.setup {
		-- 	winbar = {
		-- 		lualine_a = {
		-- 			win_val
		-- 		}
		-- 	}
		-- }
		lualine.refresh()
		-- if work in statusline
		-- vim.wo.stl = win_val
	end
end

local events = { 'BufEnter', 'BufWinEnter', 'CursorMoved' }
-- local events = { 'BufEnter', 'BufWinEnter' }

-- vim.api.nvim_create_autocmd(events, {
-- 	pattern = '*',
-- 	callback = function()
-- 		config_winbar_or_statusline()
-- 	end,
-- })

-- vim.api.nvim_create_autocmd('User', {
-- 	pattern = 'LspsagaUpdateSymbol',
-- 	callback = function()
-- 		config_winbar_or_statusline()
-- 	end,
-- })
