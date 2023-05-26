local M = {}

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
			filetype = 'DressingSelect',
			readonly = false,
		},
		win_options = {
			winblend = 50,
			-- winhighlight = 'Normal:Normal,FloatBorder:FloatShadowThrough',
			-- winhighlight = 'Normal:Normal,FloatBorder:FloatShadowOpaque',
			winhighlight = 'Normal:Normal,FloatBorder:none',
			-- winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
		},
		-- bufnr = vim.api.nvim_get_current_buf(),
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

local function open_popup(...)
	local cmd = { ... }
	-- local default_command = function() vim.cmd.Neorg('journal', 'today') end
	-- local default_command = { 'journal', 'today' }
	local default_command = { 'index' }

	if not popup then
		popup = create_popup()
		cmd = cmd or default_command
		popup:mount()
	end

	popup:show()

	if #cmd > 0 then vim.cmd.Neorg(unpack(cmd)) end

	nvim.feedkeys('zz')

	local gitsigns = nrequire('gitsigns')
	if gitsigns then gitsigns.detach(popup.bufnr) end

	Augroup('NeorgOpenPopup', {
		Autocmd({ 'WinLeave' }, '*', function(data)
			local leave_winid = vim.api.nvim_get_current_win()
			if leave_winid == popup.winid then
				popup.bufnr = data.buf
				popup:hide()
			end
			return true
		end),

		Autocmd({ 'BufDelete' }, '*.norg', function(data)
			popup.bufnr = data.buf
			popup:hide()
			return true
		end),
	})
end

function M.open_popup(...)
	local args = { ... }
	return function() open_popup(unpack(args)) end
end

return M
