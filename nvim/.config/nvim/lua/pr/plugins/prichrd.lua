return {
  {
    "prichrd/netrw.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      mappings = {
        ["p"] = function(payload)
          require 'vwd'.set_vwd(payload.dir, true)
        end,
      },
    },
  },
  {
    "prichrd/vwd.nvim",
    opts = {},
  },
}
