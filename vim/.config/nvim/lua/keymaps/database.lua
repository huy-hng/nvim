local status, wk = pcall(require, 'which-key')
if not status then return end

wk.register({
	['<leader>D'] = {
		name = "Database",
		u = { "<cmd>DBUIToggle<Cr>", "Toggle UI" },
		f = { "<cmd>DBUIFindBuffer<Cr>", "Find buffer" },
		r = { "<cmd>DBUIRenameBuffer<Cr>", "Rename buffer" },
		q = { "<cmd>DBUILastQueryInfo<Cr>", "Last query info" },
	},
})
