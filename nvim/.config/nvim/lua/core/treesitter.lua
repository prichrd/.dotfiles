vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
	pattern = { "vim", "c", "markdown", "lua" },
	callback = function(ev)
		vim.treesitter.start(ev.buf)
	end,
})
