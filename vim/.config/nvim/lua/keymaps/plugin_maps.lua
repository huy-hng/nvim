-- require('zen-mode').toggle {
-- 	window = {
-- 		width = 0.85, -- width will be 85% of the editor width
-- 	},
-- }
nmap('<leader>z', require('zen-mode').toggle, 'Zen Mode')
nmap('<leader>Z', CMD('Twilight'), 'Twilight')

nmap('<F5>', CMD('UndotreeToggle'), 'Undo Tree')
