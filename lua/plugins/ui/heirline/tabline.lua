local M = {}

local utils = require('heirline.utils')
local filename = require('plugins.ui.heirline.buffer_manager.filename')
local spacing = { provider = ' ' }

local file_icon = {
	-- init = function(self) end,
	update = { 'WinNew', 'WinClosed', 'BufEnter' },
	provider = function(self)
		local label = vim.t[self.tabpage].tablabel
		self.icon = label and label.icon

		return self.icon and self.icon
	end,
	hl = function(self)
		local label = vim.t[self.tabpage].tablabel
		if not label then return end

		return { fg = label.icon_hl }
	end,
}

local tabpage = {
	provider = function(self)
		local label = vim.t[self.tabpage].tablabel
		label = label and label.filename or self.tabpage
		return '%' .. self.tabnr .. 'T' .. label .. ' %T'
	end,
	hl = function(self)
		if not self.is_active then
			return 'TabLine'
		else
			return 'TabLineSel'
		end
	end,
}

local tabpage_close = {
	provider = '%999X  %X',
	hl = 'TabLine',
}

local tabpage_block = utils.surround({ '', '' }, function(self)
	if self.is_active then
		return utils.get_highlight('TabLineSel').bg
	else
		return utils.get_highlight('TabLine').bg
	end
end, { file_icon, tabpage })

return {
	-- only show this component if there's 2 or more tabpages
	condition = function() return #vim.api.nvim_list_tabpages() >= 2 end,
	{ provider = '%=' },
	utils.make_tablist(tabpage_block),
	-- tabpage_close,
}
