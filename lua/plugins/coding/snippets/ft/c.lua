---@diagnostic disable: undefined-global

local utils = require('plugins.coding.snippets.utils')

return {
	snippet(
		'ignore',
		{ t('// clang-format off'), i(0, ''), utils.newline('// clang-format on') }
	),
}
