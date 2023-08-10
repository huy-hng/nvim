local M = {}
M.state = {}

local popup = nil

local function create_popup()
	-- local Popup = require('nui.popup')
	popup = require('nui.popup') {
		position = {
			row = '50%',
			col = math.floor(vim.o.columns / 2) - 40,
		},
		size = {
			width = 100,
			height = '80%',
		},
		enter = true,
		focusable = true,
		zindex = 50,
		relative = 'editor',
		border = {
			padding = {
				top = 0,
				bottom = 0,
				left = 1,
				right = 1,
			},
			-- style = { '█', '▀', '█', '█', '█', '▄', '█', '█' }, -- thin border outside (with 1 cell padding)
			-- style = { '▄', '▄', '▄', '█', '▀', '▀', '▀', '█' }, -- thin border inside
			-- text = {
			-- 	top = 'Neorg',
			-- 	top_align = 'center',
			-- 	bottom = '',
			-- 	bottom_align = 'right',
			-- },
		},
		buf_options = {
			modifiable = true,
			filetype = 'norg',
			readonly = false,
		},
		win_options = {
			winblend = vim.o.winblend,
			concealcursor = 'nc',
			-- winhighlight = 'Normal:Normal,FloatBorder:FloatShadowThrough',
			-- winhighlight = 'Normal:Normal,FloatBorder:FloatShadowOpaque',
			winhighlight = 'Normal:Normal,FloatBorder:none',
			-- winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
		},
	}

	Augroup('NeorgPopup', {
		Autocmd('BufWinEnter', '*.norg', function(data)
			local bufnr = data.buf

			popup.bufnr = bufnr
			Map.n('q', function() --
				nvim.save()
				popup:hide()
			end, 'Close popup', { buffer = bufnr, nowait = true })
		end),
	})

	return popup
end

local function disable_gitsigns(disable)
	local gs = nrequire('gitsigns')
	if not gs then return end
	local config = nrequire('gitsigns.config').config
	if disable then
		M.state.signcolumn = config.signcolumn
		M.state.numhl = config.numhl
		M.state.linehl = config.linehl
		config.signcolumn = false
		config.numhl = false
		config.linehl = false
	else
		config.signcolumn = M.state.signcolumn
		config.numhl = M.state.numhl
		config.linehl = M.state.linehl
	end
	gs.refresh()
end

local function open_popup(...)
	local cmd = { ... }

	if not popup then
		popup = create_popup()
		if #cmd == 0 then cmd = { 'index' } end
		popup:mount()
	end

	DeleteAugroup('NeorgOpenPopup')
	popup:show()

	if #cmd > 0 then vim.cmd.Neorg(unpack(cmd)) end

	nvim.feedkeys('zz')
	disable_gitsigns(true)

	Augroup('NeorgOpenPopup', {
		Autocmd('WinLeave', '*', function(data)

			local leave_winid = vim.api.nvim_get_current_win()
			if leave_winid == popup.winid then
				disable_gitsigns(false)
				popup.bufnr = data.buf
				popup:hide()
			end
		end),

		Autocmd('BufWinLeave', '*', function(data)
			local matched = string.match(data.file, '.norg')

			local leave_winid = vim.api.nvim_get_current_win()
			if not matched and popup and leave_winid ~= popup.winid then
				popup:hide()
				return
			end
			popup.bufnr = data.buf
		end),
	})
end

function M.open_popup(...)
	local args = { ... }
	return function() open_popup(unpack(args)) end
end

return M
