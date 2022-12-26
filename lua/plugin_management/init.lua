require('plugin_management.ensure_lazy')

local config = require('plugin_management.config')
require('lazy').setup('plugins', config)
