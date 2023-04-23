local M = {}

local devicons = nrequire('nvim-web-devicons')

local utils = require('heirline.utils')
local C = require('catppuccin.palettes').get_palette()

local update = {
	'BufEnter',
	'BufHidden',
	'BufLeave',
	'BufModifiedSet',
	'OptionSet',
	pattern = 'buflisted',
	callback = function() print('callback') end,
}

local FileIcon = {
	init = function(self)
		local filename = self.filename
		local extension = vim.fn.fnamemodify(filename, ':e')

		if devicons then
			self.icon, self.icon_color =
				devicons.get_icon_color(filename, extension, { default = true })
		end
	end,
	provider = function(self) return self.icon and (self.icon .. ' ') end,
	hl = function(self)
		if self.is_active then return { fg = self.icon_color } end
		return 'Comment'
	end,
}

local BufferBufnr = {
	provider = function(self) return tostring(vim.inspect(self.id[2])) .. '. ' end,
	hl = 'Comment',
}

-- we redefine the filename component, as we probably only want the tail and not the relative path
local BufferFileName = {
	provider = function(self)
		-- self.filename will be defined later, just keep looking at the example!
		local filename = self.filename

		local path = vim.fn.fnamemodify(filename, ':h')
		local split = path:split('/')
		local folder = #split > 0 and split[#split] .. '/' or ''

		filename = filename == '' and '[No Name]' or vim.fn.fnamemodify(filename, ':t:r')
		return folder .. filename
	end,
	hl = function(self) return { bold = self.is_active or self.is_visible, italic = true } end,
}

-- this looks exactly like the FileFlags component that we saw in
-- #crash-course-part-ii-filename-and-friends, but we are indexing the bufnr explicitly
-- also, we are adding a nice icon for terminal buffers.
local BufferFileFlags = {
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

-- Here the filename block finally comes together
local BufferFileNameBlock = {
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
	BufferBufnr,
	FileIcon, -- turns out the version defined in #crash-course-part-ii-filename-and-friends can be reutilized as is here!
	BufferFileName,
	BufferFileFlags,
}

-- a nice "x" button to close the buffer
local BufferCloseButton = {
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

local BufferBlock = utils.surround({ '', '' }, function(self)
	if self.is_active then
		return utils.get_highlight('TabLineSel').bg
	else
		return utils.get_highlight('TabLine').bg
	end
end, {
	BufferFileNameBlock,
	BufferCloseButton,
})

-- and here we go
M.BufferLine = utils.make_buflist(
	BufferBlock,
	-- truncation indicator
	{ provider = ' ', hl = { fg = 'gray' } },
	{ provider = ' ', hl = { fg = 'gray' } },
	function()
		local list_manager = require('plugins.ui.heirline.buffer_manager.list_manager')
		local bufs = list_manager.get_ordered_bufids()
		return bufs
	end,
	false
)

local Tabpage = {
	provider = function(self) return '%' .. self.tabnr .. 'T ' .. self.tabpage .. ' %T' end,
	hl = function(self)
		if not self.is_active then
			return 'TabLine'
		else
			return 'TabLineSel'
		end
	end,
}

local TabpageClose = {
	provider = '%999X  %X',
	hl = 'TabLine',
}

M.TabPages = {
	-- only show this component if there's 2 or more tabpages
	condition = function() return #vim.api.nvim_list_tabpages() >= 2 end,
	{ provider = '%=' },
	utils.make_tablist(Tabpage),
	TabpageClose,
}

return M
