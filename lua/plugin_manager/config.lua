return {
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
		-- try to load one of these colorschemes when starting an installation during startup
		colorscheme = { 'catppuccin' },
	},
	ui = {
		-- a number <1 is a percentage., >1 is a fixed size
		size = { width = 0.67, height = 0.8 },
	},
	custom_keys = {
		-- open lazygit log
		['<localleader>l'] = function(plugin)
			require('lazy.util').float_term({ 'lazygit', 'log' }, {
				cwd = plugin.dir,
			})
		end,

		-- open a terminal for the plugin dir
		['<localleader>t'] = function(plugin)
			require('lazy.util').float_term(nil, {
				cwd = plugin.dir,
			})
		end,
	},
	diff = {
		-- diff command <d> can be one of:
		-- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
		--   so you can have a different command for diff <d>
		-- * git: will run git diff and open a buffer with filetype git
		-- * terminal_git: will open a pseudo terminal with git diff
		-- * diffview.nvim: will open Diffview to show the diff
		cmd = 'git',
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
		notify = false, -- get a notification when changes are found
	},
	performance = {
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
