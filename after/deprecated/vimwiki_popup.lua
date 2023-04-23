-----------------------------------------------Popup------------------------------------------------
local log = function(...)
	-- local msg = Formatter(...)
	-- print(msg)
	-- vim.notify(msg, 'debug')
end

local Popup = require('nui.popup')
local popup = nil

local function create_popup()
	popup = Popup {
		position = '50%',
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
			-- 	top = 'Vimwiki',
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

	Augroup('VimwikiPopup', {
		-- Autocmd('OptionSet', 'winblend', function(data) --
		-- 	if popup._.win_options.winblend then popup._.win_options.winblend = vim.o.winblend end
		-- end),

		Autocmd('BufWinEnter', '*.md', function(data)
			local bufnr = data.buf
			log('Changing buffer', bufnr)

			local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')
			if ft == 'vimwiki' then --
				popup.bufnr = bufnr
				Map.n('q', function() --
					popup:hide()
				end, 'Close popup', { buffer = bufnr, nowait = true })
			end
		end),
	})

	return popup
end

local function open_popup(wikicmd)
	-- local default_command = 'VimwikiIndex'
	local default_command = vim.cmd.VimwikiIndex

	if not popup then
		popup = create_popup()
		wikicmd = wikicmd or default_command
		popup:mount()
	end

	popup:show()

	if wikicmd then wikicmd() end

	log('new window:', popup.winid)
	nvim.feedkeys('zz')

	Augroup('VimwikiOpenPopup', {
		Autocmd({ 'WinLeave' }, '*', function(data)
			local leave_winid = vim.api.nvim_get_current_win()
			if leave_winid == popup.winid then
				log('leaving window', leave_winid)
				popup.bufnr = data.buf
				popup:hide()
			end
			return true
		end),

		Autocmd({ 'BufDelete' }, '*.md', function(data)
			log('BufDelete', data.buf)
			local ft = vim.bo[data.buf].filetype
			if ft == 'vimwiki' then
				popup.bufnr = data.buf
				popup:hide()
			end
			return true
		end),
	})
end

local function wrapper(cmd)
	return function() open_popup(cmd) end
end

local vw = Map.create('n', '<leader>d', '[Vimwiki]')
local cmd = vim.cmd

vw('j', wrapper(), 'Open last view')

vw('w', wrapper(cmd.VimwikiIndex), 'Wiki Index')

vw('i', wrapper(cmd.VimwikiDiaryIndex), 'Daily Log Index')
vw('l', wrapper(cmd.VimwikiDiaryGenerateLinks), 'Update Daily Log Index')

vw('d', wrapper(cmd.VimwikiMakeDiaryNote), 'Daily Log Note')
vw('y', wrapper(cmd.VimwikiMakeYesterdayDiaryNote), 'Yesterday Log Note')
vw('m', wrapper(cmd.VimwikiMakeTomorrowDiaryNote), 'Tomorrow Log Note')

Map.n('<leader>ww', '<nop>')

-- vw('t', wrapper(vim.cmd.VimwikiTabMakeDiaryNote), 'Daily Log Tab')
