return {
  {
    "prichrd/netrw.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
    opts = {
      mappings = {
        ["p"] = function(payload)
          require 'manatee'.set_vwd(payload.dir, true)
        end,
      },
    },
  },
  {
    "prichrd/refgo.nvim",
    cmd = { "RefCopy", "RefGo" },
  },
}
