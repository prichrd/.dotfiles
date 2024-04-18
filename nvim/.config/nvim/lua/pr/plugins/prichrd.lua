return {
  {
    "prichrd/netrw.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      mappings = {
        ["p"] = function(payload)
          require("vwd").set_vwd(payload.dir, true)
          print("current vwd:", require("vwd").get_vwd())
        end,
      },
    },
  },
  {
    "prichrd/vwd.nvim",
    opts={},
  },
  {
    "prichrd/refgo.nvim",
  },
}
