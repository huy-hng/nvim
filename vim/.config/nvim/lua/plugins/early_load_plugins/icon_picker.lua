local has_picker, picker = pcall(require, 'icon-picker')
if not has_picker then return end

picker.setup {
	disable_legacy_commands = true,
}
-- local sources = ' nerd_font emoji symbols'
local sources = ' nerd_font'
Nmap('<leader>fi', Util.wrap(vim.cmd.IconPickerNormal, sources), 'Icon Picker')
-- nmap('<leader><leader>y', CMD('IconPickerYank' .. sources))
-- imap('C-i>', CMD('IconPickerInsert' .. sources))
