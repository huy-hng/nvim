local utils = require('plugins.ui.alpha.utils')
local components = require('plugins.ui.alpha.components')
local headers = require('plugins.ui.alpha.customization.headers')

local fortune = require('alpha.fortune')
local ascii_art = require('plugins.ui.alpha.customization.ascii_art')
local quotes = require('plugins.ui.alpha.customization.quotes')
local sessions = require('plugins.ui.alpha.possession')
local num_plugins = require('lazy').stats().count

local terminal = {
	type = 'terminal',
	command = 'kitty',
	width = 69,
	height = 8,
	opts = {
		redraw = true,
		window_config = {},
	},
}

local header = {
	type = 'text',
	val = utils.get_random_element(headers),
	opts = {
		position = 'center',
		hl = 'Type',
		-- wrap = "overflow";
	},
}

local footer_text = utils.get_random_element(ascii_art)
for _, v in ipairs(fortune()) do
	table.insert(footer_text, v)
end

local footer = {
	type = 'text',
	val = footer_text,
	opts = {
		position = 'center',
		hl = 'Comment',
	},
}


local buttons = {
	type = 'group',
	val = {
		components.button('e', '  New file', '<cmd>enew<cr>'),
		components.button('q', '  Quit NVIM', Util.quit_last_buffer),

		-- button('SPC f f', '  Find file'),
		-- button('SPC f h', '  Recently opened files'),
		-- button('SPC f r', '  Frecency/MRU'),
		-- button('SPC f g', '  Find word'),
		-- button('SPC f m', '  Jump to bookmarks'),
		-- button('SPC s l', '  Open last session'),
	},
	opts = {
		spacing = 1,
	},
}

return {
	layout = {
		-- terminal,
		{ type = 'padding', val = 2 },
		header,
		{ type = 'padding', val = 2 },
		sessions,
		{ type = 'padding', val = 1 },
		components.text('Actions', 'Type'),
		{ type = 'padding', val = 1 },
		buttons,
		{ type = 'padding', val = 1 },
		components.text('Plugins installed: ' .. num_plugins, 'Comment'),
		{ type = 'padding', val = 2 },
		footer,
	},
	opts = {
		margin = 5,
	},
}
