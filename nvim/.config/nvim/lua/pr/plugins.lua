require("lazy").setup({
  require("pr.plugins.colorscheme"),
  require("pr.plugins.git"),
  require("pr.plugins.lsp"),
  require("pr.plugins.luasnip"),
  require("pr.plugins.mason"),
  require("pr.plugins.mini"),
  require("pr.plugins.prichrd"),
  require("pr.plugins.telescope"),
  require("pr.plugins.treesitter"),
  require("pr.plugins.ai"),
  require("pr.plugins.nav"),
  -- require("pr.plugins.dap"),

  { "fatih/vim-go", ft = "go" },
  "tpope/vim-surround",
  "lewis6991/whatthejump.nvim",
  "tpope/vim-commentary",
  "nvim-lua/plenary.nvim",
}, {
  checker = {
    enabled = true,
  },
  dev = {
    path = "~/Workspace/github.com/prichrd/",
  },
})
