require("lazy").setup({
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "tpope/vim-vinegar",
  "tpope/vim-surround",
  "tpope/vim-commentary",
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  require("pr.plugins.colorscheme"),
  require("pr.plugins.git"),
  require("pr.plugins.go"),
  require("pr.plugins.lsp"),
  require("pr.plugins.luasnip"),
  require("pr.plugins.mini"),
  require("pr.plugins.prichrd"),
  require("pr.plugins.telescope"),
  require("pr.plugins.treesitter"),
}, {
  dev = {
    path = "~/Workspace/github.com/prichrd/",
  },
})
