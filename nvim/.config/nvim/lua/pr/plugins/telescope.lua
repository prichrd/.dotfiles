return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"prichrd/manatee.nvim",
		},
		config = function()
			require("telescope").setup(require("manatee").telescope)
		end,
		opts = {
			defaults = {
				file_ignore_patterns = { ".git/" },
				mappings = {
					i = {
						["<C-j>"] = function(bufnr)
							return require("telescope.actions").move_selection_next(bufnr)
						end,
						["<C-k>"] = function(bufnr)
							return require("telescope.actions").move_selection_previous(bufnr)
						end,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				live_grep = {
					hidden = true,
				},
			},
		},
		keys = {
			{
				"<Leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Buffers",
			},
			{
				"<Leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Help tags",
			},
			{
				"<Leader>ff",
				function()
					return require("telescope").extensions.manatee.find_files()
					-- require("telescope.builtin").find_files()
				end,
				desc = "Files",
			},
			{
				"<Leader>fg",
				function()
					return require("telescope").extensions.manatee.live_grep()
					-- require("telescope.builtin").live_grep()
				end,
				desc = "Grep",
			},
			{
				"<Leader>fq",
				function()
					require("telescope.builtin").quickfix()
				end,
				desc = "Quickfixes",
			},
			{
				"<Leader>fk",
				function()
					require("telescope.builtin").keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<Leader>gs",
				function()
					require("telescope.builtin").git_status()
				end,
				desc = "Git Status",
			},
		},
	},
}
