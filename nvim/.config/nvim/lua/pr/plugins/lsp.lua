return {
  {
    "folke/neodev.nvim",
    ft = "lua",
  },
  {
    "neovim/nvim-lspconfig",
    ft = { "go", "gomod", "rust", "lua" },
    dependencies = {
      "folke/neodev.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig["gopls"].setup({
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            formatting = {
              gofumpt = true,
            },
          },
        },
      })
      lspconfig["rust_analyzer"].setup({})

      require("neodev").setup();
      lspconfig["lua_ls"].setup({
        settings = {
          Lua = {
            hint = {
              enable = true,
            },
          },
        },
      })
    end,
  },
}
