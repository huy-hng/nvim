-----------------------------------------------Popup------------------------------------------------

local function is_scratch_buffer(bufnr)
	local is_loaded = vim.api.nvim_buf_is_loaded(bufnr)
	local name = vim.api.nvim_buf_get_name(bufnr)
	local hidden = vim.bo[bufnr].bufhidden
	local type = vim.bo[bufnr].buftype
	-- P(bufnr, type, hidden, is_loaded, name)
	if hidden == 'hide' and type == 'nofile' and name == '' then --
		return true
	end
end

local function delete_all_scratch_buffers()
	local bufs = vim.api.nvim_list_bufs()
	-- print(' ')
	for _, bufnr in ipairs(bufs) do
		if is_scratch_buffer(bufnr) then --
			Schedule(vim.api.nvim_buf_delete, bufnr, {})
		end
	end
end

nmap('\\3', delete_all_scratch_buffers, 'Delete all scratch buffers')

local log = function(...)
	local msg = Formatter(...)
	-- print(msg)
	-- vim.notify(msg, 'debug')
end

local function open_vimwiki_in_background(wikicmd)
	if not wikicmd then return end

	local bufnr
	CreateAutocmd('BufWinEnter', '*.md', function(data)
		if vim.bo[data.buf].filetype == 'vimwiki' then
			bufnr = data.buf
			return true
		end
	end)

	-- local winid = vim.api.nvim_open_win(0, false, {
	-- 	width = 1,
	-- 	height = 1,
	-- 	relative = 'editor',
	-- 	row = 0,
	-- 	col = 0,
	-- })
	-- vim.api.nvim_win_call(winid, CMD(wikicmd))
	-- vim.fn.win_execute(winid, wikicmd, true)
	-- Schedule(vim.api.nvim_win_close, winid, true)

	local scratch = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_call(scratch, CMD(wikicmd))
	-- Schedule(vim.api.nvim_buf_delete, scratch, {})
	Defer(2000, vim.api.nvim_buf_delete, scratch, {})

	return bufnr
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
				nmap(
					'q',
					function() popup:hide() end,
					'Close popup',
					{ buffer = bufnr, nowait = true }
				)
			end
		end),
	})

	return popup
end

local function open_popup(wikicmd)
	local default_command = 'VimwikiIndex'

	-- local bufnr = open_vimwiki_in_background(wikicmd)

	if not popup then
		-- log('mounting', wikicmd or default_command)
		popup = create_popup()
		wikicmd = wikicmd or default_command
		-- popup.bufnr = bufnr or open_vimwiki_in_background(default_command)
		popup:mount()
	-- elseif bufnr then
	-- 	popup.bufnr = bufnr
	-- 	log('opening different buffer', bufnr)
	end

	popup:show()

	-- vim.fn.win_execute(popup.winid, wikicmd, true)
	if wikicmd then Exec(wikicmd) end

	log('new window:', popup.winid)

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

local vw = PrefixMap('n', '<leader>w', '[Vimwiki]')
vw('j', open_popup, 'Open last view')
vw('w', { open_popup, 'VimwikiIndex' }, 'Index')
vw('<leader>w', { open_popup, 'VimwikiMakeDiaryNote' }, 'Daily Log')

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
