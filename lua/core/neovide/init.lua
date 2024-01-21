if not vim.g.has_neovide then return end

require('core.neovide.options')
require('core.neovide.mappings')

local os_fn = require('core.neovide.os_functions')
local functions = require('core.neovide.functions')

local g = vim.g
g.neovide_profiler = false

local function tower_pc()
	g.neovide_refresh_rate = 120

	g.neovide_refresh_rate_idle = 60
	g.neovide_default_transparency = 0.30
	g.gui_font_default_size = 11

	nvim.schedule(os_fn.toggle_blur_on_kde, true)
end

local function arch_chromebook()
	g.neovide_refresh_rate = 60
	g.neovide_default_transparency = 0.30
	g.gui_font_default_size = 10.5

	nvim.schedule(os_fn.toggle_blur_on_kde, true)
end

local function chromebook()
	g.neovide_refresh_rate = 60
	g.neovide_default_transparency = 0.85
	g.gui_font_default_size = 11
end

local function override_list_ui_function()
	local list_uis = vim.api.nvim_list_uis
	---@diagnostic disable-next-line: duplicate-set-field
	vim.api.nvim_list_uis = function()
		local uis = list_uis()
		for _, ui in ipairs(uis) do
			ui.ext_multigrid = false
		end
		return uis
	end
end

local function set_machine_setup()
	local lookup = {
		ASRock = tower_pc,
		Google = arch_chromebook,
	}

	-- local hostname = vim.fn.trim(vim.fn.system('hostname'))
	local hostname = vim.json.decode(vim.fn.system('hostnamectl --json=pretty'))
	if not hostname then return end

	lookup[hostname.HardwareVendor]()
end

local function post_init()
	set_machine_setup()

	-- print(jit.os) -- prints Linux
	-- if hostname == 'huystower' then
	-- 	tower_pc()
	-- elseif hostname == 'arch' then
	-- 	arch_chromebook()
	-- else
	-- 	chromebook()
	-- end

	g.neovide_transparency = g.neovide_default_transparency
	functions.reset_gui_font()
	functions.change_window_opacity(g.neovide_transparency, 0, true)
end

post_init()
override_list_ui_function()

-- turn off when multigrid is enabled since it causes lag for some reason
-- Exec('TSContextDisable')


-- hostnamectl --json=pretty output
-- {
--   Chassis = "desktop",
--   DefaultHostname = "archlinux",
--   Deployment = vim.NIL,
--   FirmwareDate = 1.5758496e+15,
--   FirmwareVendor = "American Megatrends Inc.",
--   FirmwareVersion = "P3.90",
--   HardwareModel = "B450M Pro4",
--   HardwareSerial = vim.NIL,
--   HardwareVendor = "ASRock",
--   Hostname = "arch",
--   HostnameSource = "static",
--   IconName = "computer-desktop",
--   KernelName = "Linux",
--   KernelRelease = "6.6.3-arch1-1",
--   KernelVersion = "#1 SMP PREEMPT_DYNAMIC Wed, 29 Nov 2023 00:37:40 +0000",
--   Location = vim.NIL,
--   OperatingSystemCPEName = vim.NIL,
--   OperatingSystemHomeURL = "https://archlinux.org/",
--   OperatingSystemPrettyName = "Arch Linux",
--   PrettyHostname = vim.NIL,
--   ProductUUID = vim.NIL,
--   StaticHostname = "arch"
-- }
