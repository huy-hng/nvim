local M = {
	'goolord/alpha-nvim',
	lazy = false,
}

function M.config()
	local alpha = require('alpha')

	local dashboard = require('plugins.ui.alpha.dashboard')
	local startify = require('alpha.themes.startify')
	local theta = require('alpha.themes.theta')
	local fortune = require('alpha.fortune')
	local multi_column = require('plugins.ui.alpha.multi_column')

	alpha.keymaps_element.button = function(el, conf, state)
		if el.opts and el.opts.keymap then
			local map = el.opts.keymap
			map[4].buffer = state.buffer
			vim.keymap.set(map[1], map[2], map[3], map[4])
		end
	end

	Nmap('<leader>S', { alpha.start, false }, 'Open Start Screen')

	-- alpha.setup(multi_column)

	local seed = math.floor(os.time() + os.clock() * 10 ^ 6)
	math.randomseed(seed)

	math.random()
	math.random()
	math.random()

	local function get_random_value(values) return values[math.random(#values)] end

	local headers = require('plugins.ui.alpha.headers')
	local ascii_art = require('plugins.ui.alpha.ascii_art')
	local header = get_random_value(headers)

	local quotes = require('plugins.ui.alpha.quotes')
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
		-- dashboard.button('e', '  New file', ':enew <BAR> startinsert <CR>'),
		dashboard.button('e', '  New file', '<cmd>enew<cr>'),
		dashboard.button('q', '  Quit NVIM', Util.quit_last_buffer),
	}

	dashboard.section.sessions = require('plugins.ui.alpha.possession')
	dashboard.section.footer.val = footer
	dashboard.section.footer.opts.hl = 'Comment'

	local function get_padded_name(name, width)
		width = width or 50
		local needed_spaces = width - string.len(name)
		local padded_name = name .. vim.fn['repeat'](' ', needed_spaces)
		return padded_name
	end

	local function create_text(text, highlight, width)
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
		{ type = 'padding', val = 1 },
		create_text('Plugins installed: ' .. require('lazy').stats().count, 'Comment'),
		{ type = 'padding', val = 2 },
		dashboard.section.footer,
	}

	dashboard.config.layout = layout
	-- dashboard.config.opts.noautocmd = true

	alpha.setup(dashboard.config)
end

function M.dont_show()
	if #vim.v.argv > 1 then return true end

	-- taken from mini.starter
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
	if #lines > 1 or (#lines == 1 and lines[1]:len() > 0) then return true end

	-- - Several buffers are listed (like session with placeholder buffers). That
	--   means unlisted buffers (like from `nvim-tree`) don't affect decision.
	local listed_buffers = vim.tbl_filter(
		function(buf_id) return vim.fn.buflisted(buf_id) == 1 end,
		vim.api.nvim_list_bufs()
	)
	if #listed_buffers > 1 then return true end

	-- - There are files in arguments (like `nvim foo.txt` with new file).
	if vim.fn.argc() > 0 then return true end

	return false
end

return M
