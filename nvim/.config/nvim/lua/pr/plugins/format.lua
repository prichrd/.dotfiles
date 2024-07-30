return {
	{
		"mhartington/formatter.nvim",
		ft = { "go", "gomod", "lua" },
		config = function()
			require("formatter").setup({
				filetype = {
					go = {
						require("formatter.filetypes.go").gofmt,
					},
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
				},
			})

			vim.api.nvim_create_augroup("__formatter__", { clear = true })
			vim.api.nvim_create_autocmd("BufWritePost", {
				group = "__formatter__",
				command = ":FormatWrite",
			})
		end,
	},
}
