---@diagnostic disable: undefined-global
local utils = require('plugins.snippets.utils')

return {
	snippet('code', fmt('@code {}{}{}@end', { i(1, ''), utils.newline(), i(0) })),
}
