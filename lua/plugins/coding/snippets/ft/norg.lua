---@diagnostic disable: undefined-global
local utils = require('plugins.coding.snippets.utils')

return {
	snippet('code', fmt('@code {}{}{}@end', { i(1, ''), utils.newline(), i(0) })),
}
