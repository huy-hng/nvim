vim.pack.add({
	{ src = 'https://github.com/folke/lazy.nvim', version = 'stable' },
}, { confirm = false })

-- require('plugins.lazy')

-- require('plugins.lsp')
-- require('plugins.oil')
-- require('plugins.comment').config()
-- require('plugins.treesitter')

-- vim.pack.add({
-- 	{ src = 'https://github.com/moll/vim-bbye' }, -- stops closing windows when deleting buffers
-- })



local spec = {
	{ import = 'plugins.catppuccin' },
	{ import = 'plugins.oil' },
	{ import = 'plugins.comment' },
	{ import = 'plugins.lsp' },
	{ import = 'plugins.telescope.init' },
	-- { import = 'plugins.treesitter' },

	-- { import = 'plugins.editing' },
	-- { import = 'plugins.editor' },
	-- { import = 'plugins.git' },

	-- { import = 'plugins.lsp' },
	-- { import = 'plugins.treesitter' },
}

local config = {
	root = vim.fn.stdpath('data') .. '/lazy', -- directory where plugins will be installed
	defaults = {
		lazy = true, -- should plugins be lazy-loaded?
		version = nil,
		-- default `cond` you can use to globally disable a lot of plugins
		-- when running inside vscode for example
		cond = nil, ---@type boolean|fun(self:LazyPlugin):boolean|nil
		-- version = "", -- enable this to try installing the latest stable versions of plugins
	},
	lockfile = vim.fn.stdpath('config') .. '/lazy-lock.json', -- lockfile generated after running update.
	dev = {
		-- directory where you store your local plugin projects
		-- path = '~/.dotfiles/nvim/.config/nvim/my_plugins/',
		path = vim.fn.stdpath('config') .. '/plugins/',
		---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
		patterns = {}, -- For example {"folke"}
		fallback = true,
	},
	install = {
		-- install missing plugins on startup. This doesn't increase startup time.
		missing = true,
	},
	ui = {
		-- a number <1 is a percentage., >1 is a fixed size
		size = { width = 120, height = 0.8 },
	},
	checker = {
		-- automatically check for plugin updates
		enabled = false,
		concurrency = nil, ---@type number? set to 1 to check for updates very slowly
		notify = true, -- get a notification when new updates are found
		frequency = 3600, -- check for updates every hour
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = true, -- get a notification when changes are found
	},
	performance = {
		reset_packpath = false, -- true breaks vim.pack when loading plugins after lazy has loaded.
		rtp = {
			---@type string[] list any plugins you want to disable here
			disabled_plugins = {
				'gzip',
				'matchit',
				-- 'matchparen',
				'netrwPlugin',
				'tarPlugin',
				'tohtml',
				'tutor',
				'zipPlugin',
			},
		},
	},
	-- lazy can generate helptags from the headings in markdown readme files,
	-- so :help works even for plugins that don't have vim docs.
	-- when the readme opens with :help it will be correctly displayed as markdown
	readme = {
		root = vim.fn.stdpath('state') .. '/lazy/readme',
		files = { 'README.md', 'lua/**/README.md' },

		-- only generate markdown helptags for plugins that dont have docs
		skip_if_doc_exists = true,
	},
}

require('lazy').setup(spec, config)

local M = {}

local function path_to_require(path)
	path = path or vim.fn.expand('%')
	if not path then return end

	local relative = string.match(path, 'lua/(.*).lua$')
	return string.gsub(relative, '/', '.')
end

local function reload_config()
	local path = npcall(path_to_require)
	if not path then return end

	local module = R(path)
	if not module or type(module) ~= 'table' or not module.config then return end

	module.config()
end

function M.start()
	-- reload plugin config on save
	Augroup('LazyReload', {
		Autocmd('User', 'VeryLazy', function(data)
			NestedAutocmd(data, 'User', 'LazyReload', reload_config)
			return true
		end),
	})
end

function M.stop() DeleteAugroup('LazyReload') end

M.start()

Map.n(Keys.plugin_manager, require('lazy').home)


return M
