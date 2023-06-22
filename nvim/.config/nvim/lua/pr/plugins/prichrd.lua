return {
	{
		"prichrd/refgo.nvim",
		cmd = { "RefCopy", "RefGo" },
	},
	{
		"prichrd/netrw.nvim",
		ft = "netrw",
		dependencies = { "nvim-tree/nvim-web-devicons", "prichrd/manatee.nvim" },
		opts = {
			mappings = {
				["p"] = function(payload)
					require("manatee").set_vwd(payload.dir, true)
				end,
			},
		},
	},
}
