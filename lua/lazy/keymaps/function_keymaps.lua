Nmap('%', MatchCharacter, 'Jump to matching quote or whatever')
Nmap('<leader>m', '<cmd>50message<cr>', 'Show Messages')

MapSpaceCapital('n', 'M', '<cmd>message<cr>', 'Show Messages')
Nmap('<leader><leader>M', { vim.cmd.messages, 'clear' }, 'Clear Messages')

-- Nmap('\\9', ReloadAll)

Nmap('<leader>z', vim.cmd.ZenMode, 'Zen Mode')
Nmap('<leader>Z', vim.cmd.Twilight, 'Twilight')
Nmap('<F5>', vim.cmd.UndotreeToggle, 'Undo Tree')
Nmap('<A-e>', vim.cmd.RnvimrToggle, 'Open Ranger')

Nmap('<leader><CR>', { require('functions.flash_cursor'), 3 }, 'Flash Cursor')

local has_notify, notify = pcall(require, 'notify')
if has_notify then Nmap('\\1', notify.dismiss, 'Dismiss all notifications') end

local cleanup = require('modules.cleanup')

Nmap('\\2', cleanup.close_all_floating_windows, 'Close all floating windows')
Nmap('\\3', cleanup.delete_all_scratch_buffers, 'Delete all scratch buffers')
Nmap('\\4', cleanup.delete_all_unloaded_buffers, 'Delete all unloaded buffers')


local surrounder = require('functions.surrounder')
Vmap("'", surrounder("'"))
-- Vmap('"', surrounder('"'))
Vmap("<A-'>", surrounder('"'))
Vmap('<A-*>', surrounder('*'))
Vmap('<A-8>', surrounder('*'))
Vmap('`', surrounder('`'))
-- vmap('=', surrounder('='))

Vmap('(', surrounder('(', ')'))
Vmap(')', surrounder('( ', ' )'))

Vmap('<', surrounder('<', '>'))
Vmap('>', surrounder('< ', ' >'))

Vmap('[', surrounder('[', ']'))
Vmap(']', surrounder('[ ', ' ]'))

Vmap('{', surrounder('{', '}'))
Vmap('}', surrounder('{ ', ' }'))
