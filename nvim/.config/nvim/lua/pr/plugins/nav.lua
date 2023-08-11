return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      close_if_last_window = true,
      source_selector = {
        winbar = true,
      },
      filesystem = {
        follow_current_file = { enabled = true },
      },
      window = {
        position = "left"
      }
    },
    keys = {
      {
        "-", function() vim.cmd [[Neotree]] end,
      },
    }
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {},
    keys = {
      {
        "<Leader>ma",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Add harpoon mark",
      },
      {
        "<leader>mc",
        function()
          require("harpoon.mark").clear_all()
        end,
        desc = "Harpoon clear all",
      },
      {
        "<leader>mm",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Harpoon toogle quick menu",
      },
      {
        "<leader>md",
        function()
          local index = require("harpoon.mark").get_index_of(vim.fn.bufname())
          require("harpoon.mark").rm_file(index)
        end,
        desc = "Harpoon delete current mark",
      },
      {
        "[m",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Prev mark",
      },
      {
        "]m",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "Prev mark",
      },
    },
  },
}
