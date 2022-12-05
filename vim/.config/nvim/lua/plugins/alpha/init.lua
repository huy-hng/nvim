local has_alpha, alpha = pcall(require, 'alpha')
if not has_alpha then return end

local dashboard = require('plugins.alpha.dashboard')
-- local dashboard = require('alpha.themes.dashboard')
local startify = require('alpha.themes.startify')
local theta = require('alpha.themes.theta')
local fortune = require('alpha.fortune')
local multi_column = require('plugins.alpha.multi_column')

alpha.keymaps_element.button = function(el, conf, state)
	if el.opts and el.opts.keymap then
		local map = el.opts.keymap
		map[4].buffer = state.buffer
		vim.keymap.set(map[1], map[2], map[3], map[4])
	end
end

nmap('<leader>S', { alpha.start, false }, 'Open Start Screen')

-- alpha.setup(multi_column)

local seed = math.floor(os.time() + os.clock() * 10 ^ 6)
math.randomseed(seed)

math.random()
math.random()
math.random()

local function get_random_value(values)
	return values[math.random(#values)]
end

local headers = require('plugins.alpha.headers')
local ascii_art = require('plugins.alpha.ascii_art')
local header = get_random_value(headers)

local quotes = require('plugins.alpha.quotes')
local footer = {}
local ascii = get_random_value(ascii_art)

footer = ascii
for _, v in ipairs(fortune()) do
	table.insert(footer, v)
end

local function colorizer(text_arr)
	for i, value in ipairs(text_arr) do
		local handle = io.popen('echo ' .. value .. ' | lolcat -f')
		if handle ~= nil then
			local line = handle:read('*l')
			header[i] = line
			handle:close()
		end
	end
end

dashboard.section.header.val = header

dashboard.section.buttons.val = {
	dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
	dashboard.button('q', '  Quit NVIM', QuitLastBuffer),
}

dashboard.section.sessions = require('plugins.alpha.possession')
dashboard.section.footer.val = footer
dashboard.section.footer.opts.hl = 'Comment'

local function get_padded_name(name, width)
	local needed_spaces = width - string.len(name)
	local padded_name = name .. vim.fn['repeat'](' ', needed_spaces)
	return padded_name
end

local function create_text(text, highlight, width)
	width = width or 50
	return {
		type = 'text',
		val = get_padded_name(text, width),
		opts = {
			position = 'center',
			hl = highlight,
		},
	}
end

local layout = {
	{ type = 'padding', val = 2 },
	dashboard.section.header,
	{ type = 'padding', val = 2 },
	dashboard.section.sessions,
	{ type = 'padding', val = 1 },
	create_text('Actions', 'Type'),
	{ type = 'padding', val = 1 },
	dashboard.section.buttons,
	{ type = 'padding', val = 2 },
	dashboard.section.footer,
}
dashboard.config.layout = layout
-- dashboard.config.opts.noautocmd = true

alpha.setup(dashboard.config)

-- local function example_startify()
-- 	startify.section.header.val = header
-- 	startify.section.top_buttons.val = {
-- 		startify.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
-- 	}
-- 	-- disable MRU
-- 	startify.section.mru.val = { { type = 'padding', val = 0 } }
-- 	-- disable MRU cwd
-- 	startify.section.mru_cwd.val = { { type = 'padding', val = 0 } }
-- 	-- disable nvim_web_devicons
-- 	startify.nvim_web_devicons.enabled = false
-- 	-- startify.nvim_web_devicons.highlight = false
-- 	-- startify.nvim_web_devicons.highlight = 'Keyword'
-- 	--
-- 	startify.section.bottom_buttons.val = {
-- 		startify.button('q', '  Quit NVIM', ':qa<CR>'),
-- 	}
-- 	startify.section.footer = {
-- 		{ type = 'text', val = 'footer' },
-- 	}
-- 	-- ignore filetypes in MRU

-- 	startify.mru_opts.ignore = function(path, ext)
-- 		return (string.find(path, 'COMMIT_EDITMSG')) or (vim.tbl_contains(default_mru_ignore, ext))
-- 	end
-- 	alpha.setup(startify.config)
-- end
