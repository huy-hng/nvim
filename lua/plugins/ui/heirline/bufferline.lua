local devicons = nrequire('nvim-web-devicons')

local utils = require('heirline.utils')
local list_manager = require('plugins.ui.heirline.buffer_manager.list_manager')
local filename = require('plugins.ui.heirline.buffer_manager.filename')
local C = require('catppuccin.palettes').get_palette()

local file_icon = {
	init = function(self)
		local icon = filename.get_icon(self.filename, { hexcode = true })
		if icon then
			self.icon, self.icon_color = unpack(icon)
		end
	end,
	provider = function(self) return self.icon and self.icon end,
	hl = function(self)
		return { fg = self.icon_color }
		-- if self.is_active then return { fg = self.icon_color } end
		-- return 'Comment'
	end,
}

local buffer_bufnr = {
	provider = function(self) return tostring(vim.inspect(self.id[2])) .. '. ' end,
	hl = 'Comment',
}

local buffer_file_name = {
	provider = function(self)
		local folders, _ = filename.get_path_folders(self.filename, 1)
		local path = string.join(folders, '/')

		return path .. '/' .. filename.get_filename(self.filename)
	end,
	hl = function(self) return { bold = self.is_active or self.is_visible, italic = true } end,
}

local buffer_file_flags = {
	{
		condition = function(self) return vim.api.nvim_buf_get_option(self.bufnr, 'modified') end,
		provider = ' ●',
		hl = { fg = C.green },
	},
	{
		condition = function(self)
			return not vim.api.nvim_buf_get_option(self.bufnr, 'modifiable')
				or vim.api.nvim_buf_get_option(self.bufnr, 'readonly')
		end,
		provider = function(self)
			if vim.api.nvim_buf_get_option(self.bufnr, 'buftype') == 'terminal' then
				return '  '
			else
				return ''
			end
		end,
		hl = { fg = 'orange' },
	},
}

local buffer_file_tab = {
	init = function(self) self.filename = vim.api.nvim_buf_get_name(self.bufnr) end,
	hl = function(self)
		if self.is_active then
			return 'TabLineSel'
			-- why not?
			-- elseif not vim.api.nvim_buf_is_loaded(self.bufnr) then
			-- 	return { fg = 'gray' }
		else
			return 'TabLine'
		end
	end,
	on_click = {
		callback = function(_, minwid, _, button)
			if button == 'm' then -- close on mouse middle click
				vim.schedule(function() vim.cmd.Bdelete(minwid) end)
				vim.schedule(vim.cmd.redrawtabline)
			else
				vim.api.nvim_win_set_buf(0, minwid)
			end
		end,
		minwid = function(self) return self.bufnr end,
		name = 'heirline_tabline_buffer_callback',
	},
	buffer_bufnr,
	file_icon, -- turns out the version defined in #crash-course-part-ii-filename-and-friends can be reutilized as is here!
	buffer_file_name,
	buffer_file_flags,
}

local buffer_close_button = {
	condition = function(self) return not vim.api.nvim_buf_get_option(self.bufnr, 'modified') end,
	{ provider = ' ' },
	{
		provider = '',
		hl = { fg = 'gray' },
		on_click = {
			callback = function(_, minwid)
				vim.schedule(function() vim.cmd.Bdelete(minwid) end)
				vim.schedule(vim.cmd.redrawtabline)
			end,
			minwid = function(self) return self.bufnr end,
			name = 'heirline_tabline_close_buffer_callback',
		},
	},
}

local buffer_block = utils.surround({ '', '' }, function(self)
	if self.is_active then
		return utils.get_highlight('TabLineSel').bg
	else
		return utils.get_highlight('TabLine').bg
	end
end, {
	buffer_file_tab,
	buffer_close_button,
})

return utils.make_buflist(
	buffer_block,
	-- truncation indicator
	{ provider = ' ', hl = { fg = 'gray' } },
	{ provider = ' ', hl = { fg = 'gray' } },
	list_manager.get_ordered_bufids,
	false
)
