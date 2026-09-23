local function enable(lang)
	vim.api.nvim_create_autocmd("FileType", {
		group = vim.api.nvim_create_augroup("UserTreesitter_" .. lang, { clear = true }),
		pattern = lang,
		callback = function(ev)
			vim.treesitter.start(ev.buf)
			vim.wo[0][0].foldmethod = "expr"
			vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		end,
	})
end

enable("vim")
enable("c")
enable("markdown")
enable("go")
