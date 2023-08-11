local utils = require('plugins.ui.alpha.utils')
local headers = require('plugins.ui.alpha.customization.headers')
local fortune = require('alpha.fortune')
local ascii_art = require('plugins.ui.alpha.customization.ascii_art')

function M.header()
	local header = utils.get_random_element(headers)

	local hl = {}
	for _ = 1, #header do
		table.insert(hl, { { 'Type', 0, -1 } })
	end

	return M.text(header, hl)
	-- return M.text(header, 'Type')
end

function M.footer()
	local footer_text = utils.get_random_element(ascii_art)

	for _, v in ipairs(fortune()) do
		table.insert(footer_text, v)
	end
	return M.text(footer_text, 'Comment')
end
