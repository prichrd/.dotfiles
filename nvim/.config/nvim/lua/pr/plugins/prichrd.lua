return {
	{
		"prichrd/refgo.nvim",
		cmd = { "RefCopy", "RefGo" },
	},
	{
		"prichrd/netrw.nvim",
		dev = false,
		ft = "netrw",
		dependencies = { "nvim-tree/nvim-web-devicons", "prichrd/manatee.nvim" },
		opts = {
			mappings = {
				["m"] = function(payload)
					require("harpoon.mark").add_file(payload.dir .. "/" .. payload.node)
				end,
				["r"] = function(payload)
					local index = require("harpoon.mark").get_index_of(payload.dir .. "/" .. payload.node)
					require("harpoon.mark").rm_file(index)
				end,
			},
		},
	},
}
