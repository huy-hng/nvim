local M = {}
local require_dir = require('core.require_dir')

-----------------------------------------------Minimal----------------------------------------------

function M.minimal_init()
	require('core.profiler') -- start profiler at the beginning
	require('ensure_packer') -- install packer if necessary
	require('core.globals')

	require_dir('lua/development')
	require_dir('lua/core')

	-- Prequire('options')
	Prequire('autocmd')
	Prequire('colorscheme') -- catpuccin needs to be installed

	require_dir('lua/functions') -- should come before keymaps
	-- require_dir('lua/keymaps') -- is located in after folder
	if vim.g.neovide then Prequire('neovide') end
end

-----------------------------------------------Plugins----------------------------------------------

-- TODO put early load plugins in here
function M.extra_features()
	if vim.g.minimal then return end

	require('plugins.packer')

	require('plugins.ufo')
	require('plugins.indent_blankline.new')
	require('plugins.snippets.init')

	require('plugins.cmp')
	require('plugins.alpha')
	require('plugins.packer_compiled')

	require_dir('lua/plugins/early_load_plugins')
	require('plugins.lualine')

	-- Prequire('plugins.noice')
end

---------------------------------------------Lazy Loading-------------------------------------------
local function nmap_execute(lhs, package)
	local fn = function()
		pcall(require, package)
		Schedule(Feedkeys, lhs, true)
	end

	if type(lhs) == 'string' then
		Nmap(lhs, fn)
		return
	end

	for _, l in ipairs(lhs) do
		Nmap(l, fn)
	end
end

local function OnceAutocmd(events, pattern, command, opts)
	opts = opts or {}
	opts.once = true
	return Autocmd(events, pattern, command, opts)
end

function M.lazyload()
	if vim.g.minimal then return end

	local function buf_read_pre()
		require_dir('lua/plugins/treesitter')
		require_dir('lua/plugins/lspsaga')
		require_dir('lua/plugins/whichkey')
		require_dir('lua/plugins/git')

		require('plugins.comment')
		require('plugins.database')
		require('plugins.harpoon')
		require('plugins.leap')
		require('plugins.ranger')
		require('plugins.neorg')
		require('plugins.undotree')
		-- require('plugins.snippets.init')
	end

	Augroup('LazyloadPlugins', {
		OnceAutocmd('FileType', { 'python', 'lua', 'c', 'json' }, { require, 'plugins.lsp' }),
		OnceAutocmd('FileType', 'python', { require_dir, 'lua/plugins/dap' }),
		OnceAutocmd('BufReadPre', buf_read_pre),
		OnceAutocmd(
			{ 'InsertEnter', 'CmdlineEnter', 'CmdwinEnter' },
			{ require, 'plugins.autopairs' }
		),
	})

	nmap_execute('<C-p>', 'plugins.telescope')
	nmap_execute('<C-e>', 'plugins.tree')
	-- nmap_execute('<C-g>', 'plugins.git.neogit') -- gets called in BufReadPre
end

return M
