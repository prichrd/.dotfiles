require("lazy").setup({
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",

  require("pr.plugins.colorscheme"),
  require("pr.plugins.mini"),
  require("pr.plugins.treesitter"),
  require("pr.plugins.lsp"),
  require("pr.plugins.luasnip"),
  require("pr.plugins.git"),
  require("pr.plugins.prichrd"),
  require("pr.plugins.telescope"),

  { "fatih/vim-go", ft = "go" },
  "tpope/vim-vinegar",
}, {
  checker = {
    enabled = true,
  },
  dev = {
    path = "~/Workspace/github.com/prichrd/",
  },
})
