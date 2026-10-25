return {
	root = vim.fn.stdpath('data') .. '/lazy', -- directory where plugins will be installed
	defaults = {
		lazy = true,                       -- should plugins be lazy-loaded?
		version = nil,
		-- default `cond` you can use to globally disable a lot of plugins
		-- when running inside vscode for example
		cond = nil, ---@type boolean|fun(self:LazyPlugin):boolean|nil
		-- version = "", -- enable this to try installing the latest stable versions of plugins
	},
	lockfile = vim.fn.stdpath('config') .. '/lazy-lock.json', -- lockfile generated after running update.
	dev = { path = vim.fn.stdpath('config') .. '/plugins/' }, -- path to local plugin directories },
	install = { missing = true },
	ui = { size = { width = 120, height = 0.8 } },         -- a number <1 is a percentage., >1 is a fixed size },
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
