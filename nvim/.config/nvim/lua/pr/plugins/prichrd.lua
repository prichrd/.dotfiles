return {
  {
    "prichrd/vwd.nvim",
    opts = {},
  },
  {
    "prichrd/refgo.nvim",
  },
  {
    "prichrd/netrw.nvim",
    init = function()
      -- vim.g.netrw_altfile = 1
    end,
    config = function()
      require("netrw").setup()
    end
  },
}
