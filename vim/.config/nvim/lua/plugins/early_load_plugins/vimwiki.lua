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
				Nmap('q', function() --
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
	Feedkeys('zz')

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

local vw = PrefixMap('n', '<leader>d', '[Vimwiki]')
local cmd = vim.cmd

vw('j', wrapper(), 'Open last view')

vw('w', wrapper(cmd.VimwikiIndex), 'Wiki Index')

vw('i', wrapper(cmd.VimwikiDiaryIndex), 'Daily Log Index')
vw('l', wrapper(cmd.VimwikiDiaryGenerateLinks), 'Update Daily Log Index')

vw('d', wrapper(cmd.VimwikiMakeDiaryNote), 'Daily Log Note')
vw('y', wrapper(cmd.VimwikiMakeYesterdayDiaryNote), 'Yesterday Log Note')
vw('m', wrapper(cmd.VimwikiMakeTomorrowDiaryNote), 'Tomorrow Log Note')

Nmap('<leader>ww', '<nop>')

-- vw('t', wrapper(vim.cmd.VimwikiTabMakeDiaryNote), 'Daily Log Tab')
-----------------------------------------------Setup------------------------------------------------

local g = vim.g

-- g.vimwiki_ext2syntax = {'.md': 'markdown'}
-- g.vimwiki_listsyms = ' ○◐●✓' " fancier todo checkmarks
-- g.vimwiki_listsyms = '✗○◐●✓' " fancier todo checkmarks
g.vimwiki_auto_header = 0
g.vimwiki_conceal_pre = 1
g.vimwiki_create_link = 0
g.vimwiki_diary_caption_level = 2
g.vimwiki_diary_header = 'Daily Log'
g.vimwiki_diary_index = 'daily_log'
g.vimwiki_diary_rel_path = 'daily_log/'
g.vimwiki_dir_link = 'main'
-- g.vimwiki_filetypes = {'markdown'}
-- g.vimwiki_folding = 'list:quick'
g.vimwiki_folding = 'custom'
g.vimwiki_hl_cb_checked = 1
g.vimwiki_hl_headers = 0
g.vimwiki_table_auto_fmt = 0
g.vimwiki_toc_header_level = 2

g.vimwiki_key_mappings = {
	all_maps = 1,
	global = 1,
	headers = 1,
	text_objs = 1,
	table_format = 1,
	table_mappings = 0,
	lists = 1,
	links = 1,
	html = 1,
	mouse = 1,
}

--  see https://github.com/vimwiki/vimwiki/pull/1221
-- g.vimwiki_tag_format = {
-- 	pre_mark = '[''"]\?#\( \|#\)\@!',
-- 	sep = '>><<',
-- 	post_mark = '[''" ]\?\|$'
-- \ }

--  individual wiki config
function Create_wiki(name)
	local wiki = {}
	wiki.auto_diary_index = 1
	wiki.auto_toc = 0
	wiki.ext = '.md'
	-- wiki.syntax = 'markdown'
	wiki.maxhi = 0 -- highlight empty pages
	wiki.name = name
	wiki.path = '$HOME/personal/vimwiki/' .. name
	wiki.nested_syntaxes = {
		python = 'python',
		bash = 'bash',
		tmux = 'tmux',
		vim = 'vim',
		lua = 'lua',
	}
	return wiki
end

local main = Create_wiki('Main')
local todo = Create_wiki('Todo')
local projects = Create_wiki('Projects')
local cheatsheets = Create_wiki('Cheatsheets')
local misc = Create_wiki('Misc')

g.vimwiki_list = { main, todo, projects, cheatsheets, misc }
