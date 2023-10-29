local M = {
	'chrisbra/csv.vim',
	ft = { 'csv' },
}

function M.config() 
	vim.g.csv_no_conceal = 0
end

return M
