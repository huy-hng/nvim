local g = vim.g

vim.api.nvim_create_autocmd('FileType', {
	group = vim.api.nvim_create_augroup('VimwikiGroup', { clear = true }),
	pattern = 'vimwiki',
	callback = function()
		vim.bo.foldexpr = 'nvim_treesitter#foldexpr()'
		Exec('TSBufDisable highlight')

	end,
})

vim.o.concealcursor = 'nc'



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
g.vimwiki_filetypes = {}
--  g.vimwiki_filetypes = ['markdown']
--  g.vimwiki_folding = 'list:quick'
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
