require("lazy").setup({
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "tpope/vim-surround",
  "tpope/vim-commentary",

  require("pr.plugins.ai"),
  require("pr.plugins.colorscheme"),
  require("pr.plugins.git"),
  require("pr.plugins.go"),
  require("pr.plugins.lsp"),
  require("pr.plugins.luasnip"),
  require("pr.plugins.mini"),
  require("pr.plugins.nav"),
  require("pr.plugins.prichrd"),
  require("pr.plugins.telescope"),
  require("pr.plugins.treesitter"),
  require("pr.plugins.visual"),
}, {
  dev = {
    path = "~/Workspace/github.com/prichrd/",
  },
})
