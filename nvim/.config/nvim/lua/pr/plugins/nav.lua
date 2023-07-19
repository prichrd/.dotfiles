return {
	{
		"ThePrimeagen/harpoon",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {
			tabline = true,
		},
		config = function()
			vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
			vim.cmd("highlight! HarpoonActive guibg=NONE guifg=white")
			vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
			vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")
			vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")
		end,
		keys = {
			{
				"<Leader>ma",
				function()
					require("harpoon.mark").add_file()
				end,
				desc = "Add harpoon mark",
			},
			{
				"<leader>mc",
				function()
					require("harpoon.mark").clear_all()
				end,
				desc = "Harpoon clear all",
			},
			{
				"<leader>mm",
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
				desc = "Harpoon toogle quick menu",
			},
			{
				"<leader>md",
				function()
					local index = require("harpoon.mark").get_index_of(vim.fn.bufname())
					require("harpoon.mark").rm_file(index)
				end,
				desc = "Harpoon delete current mark",
			},
			{
				"[m",
				function()
					require("harpoon.ui").nav_prev()
				end,
				desc = "Prev mark",
			},
			{
				"]m",
				function()
					require("harpoon.ui").nav_next()
				end,
				desc = "Prev mark",
			},
		},
	},
}
