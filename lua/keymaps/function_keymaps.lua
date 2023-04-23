-- Nmap('%', MatchCharacter, 'Jump to matching quote or whatever')
-- Nmap('<leader>m', '<cmd>50message<cr>', 'Show Messages')

MapSpaceCapital('n', 'M', '<cmd>message<cr>', 'Show Messages')
-- Nmap('<leader><leader>M', { vim.cmd.messages, 'clear' }, 'Clear Messages')

-- Nmap('\\9', ReloadAll)

Map.n('<leader>z', vim.cmd.ZenMode, 'Zen Mode')
Map.n('<leader>Z', vim.cmd.Twilight, 'Twilight')
Map.n('<F5>', vim.cmd.UndotreeToggle, 'Undo Tree')
Map.n('<A-e>', vim.cmd.RnvimrToggle, 'Open Ranger')

Map.n('<leader><CR>', { require('functions.flash_cursor'), 3 }, 'Flash Cursor')

local has_notify, notify = pcall(require, 'notify')
if has_notify then Map.n('\\1', notify.dismiss, 'Dismiss all notifications') end

local cleanup = require('modules.cleanup')

Map.n('\\2', cleanup.close_all_floating_windows, 'Close all floating windows')
Map.n('\\3', cleanup.delete_all_scratch_buffers, 'Delete all scratch buffers')
Map.n('\\4', cleanup.delete_all_unloaded_buffers, 'Delete all unloaded buffers')


local surrounder = require('functions.surrounder')
Map.v("'", surrounder("'"))
-- Vmap('"', surrounder('"'))
Map.v("<A-'>", surrounder('"'))
Map.v('<A-*>', surrounder('*'))
Map.v('<A-8>', surrounder('*'))
Map.v('`', surrounder('`'))
-- vmap('=', surrounder('='))

Map.v('(', surrounder('(', ')'))
Map.v(')', surrounder('( ', ' )'))

Map.v('<', surrounder('<', '>'))
Map.v('>', surrounder('< ', ' >'))

Map.v('[', surrounder('[', ']'))
Map.v(']', surrounder('[ ', ' ]'))

Map.v('{', surrounder('{', '}'))
Map.v('}', surrounder('{ ', ' }'))
