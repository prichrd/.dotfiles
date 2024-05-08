require("lazy").setup({
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "tpope/vim-vinegar",
  "tpope/vim-surround",
  "tpope/vim-commentary",
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<Leader>ha",
        function()
          local harpoon = require("harpoon")
          harpoon:list():add()
        end,
        desc = "Add a harpoon",
      },
      {
        "<Leader>hh",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Add a harpoon",
      },
      {
        "]h",
        function()
          local harpoon = require("harpoon")
          harpoon:list():next()
        end,
        desc = "Next harpoon",
      },
      {
        "[h",
        function()
          local harpoon = require("harpoon")
          harpoon:list():prev()
        end,
        desc = "Next harpoon",
      },
    },
  },

  require("pr.plugins.ai"),
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
