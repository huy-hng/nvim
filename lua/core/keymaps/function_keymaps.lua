Map.n('%', require('modules.functions.match_character'), 'Jump to matching quote or whatever')

-- Map.n('<leader>/', '<cmd>50message<cr>', 'Show Messages')
-- Map.n('<leader>/', '<cmd>message<cr>', 'Show Messages') -- defined in noice
Map.n('<leader><leader>/', { vim.cmd.messages, 'clear' }, 'Clear Messages')

-- Map.n('<leader>z', vim.cmd.ZenMode, 'Zen Mode')
-- Map.n('<leader>Z', vim.cmd.Twilight, 'Twilight')

Map.n('<leader><CR>', { require('modules.functions.flash_cursor'), 3 }, 'Flash Cursor')

local has_notify, notify = pcall(require, 'notify')
if has_notify then Map.n('<localleader>1', notify.dismiss, 'Dismiss all notifications') end

local cleanup = require('modules.cleanup')

Map.n('<localleader>2', cleanup.close_all_floating_windows, 'Close all floating windows')
Map.n('<localleader>3', cleanup.delete_all_scratch_buffers, 'Delete all scratch buffers')
Map.n('<localleader>4', cleanup.delete_all_unloaded_buffers, 'Delete all unloaded buffers')

local surrounder = require('modules.functions.surrounder')
Map.v("<A-'>", surrounder("'"))
Map.v('<A-">', surrounder('"'))
Map.v('<A-`>', surrounder('`'))
Map.v('<A-*>', surrounder('*'))
-- vmap('=', surrounder('='))

Map.v('(', surrounder('(', ')'))
Map.v(')', surrounder('( ', ' )'))

Map.v('<', surrounder('<', '>'))
Map.v('>', surrounder('< ', ' >'))

Map.v('[', surrounder('[', ']'))
Map.v(']', surrounder('[ ', ' ]'))

Map.v('{', surrounder('{', '}'))
Map.v('}', surrounder('{ ', ' }'))
