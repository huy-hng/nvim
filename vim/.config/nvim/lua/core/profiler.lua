---@diagnostic disable: param-type-mismatch

PROFILE_LOAD = false

if PROFILE_LOAD then
	local profile = require('plenary.profile')
	profile.start(NVIM_CONFIG_PATH .. 'profile.log', { flame = false })
	vim.api.nvim_create_autocmd('VimLeave', { callback = profile.stop })
end
