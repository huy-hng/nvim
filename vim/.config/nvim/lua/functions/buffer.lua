function CloseHiddenBuffers()
	local buffers = vim.fn.getbufinfo({ bufloaded = 1, buflisted = 1, })

	for _, buffer in ipairs(buffers) do
		if buffer.hidden == 1 then
			vim.cmd.bdelete(buffer.name)
		end
	end
end
