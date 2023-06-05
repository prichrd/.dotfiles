local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    init = function()
      require 'tokyonight'.setup { style = "night" }
      vim.cmd.colorscheme('tokyonight')
    end,
  },

  -- Mason
  "jay-babu/mason-null-ls.nvim",
  "jay-babu/mason-nvim-dap.nvim",
  "williamboman/mason-lspconfig.nvim",
  "williamboman/mason.nvim",

  -- LSP
  "jose-elias-alvarez/null-ls.nvim",
  "neovim/nvim-lspconfig",

  "fatih/vim-go",
  "folke/neodev.nvim",
  "l3mon4d3/luasnip",
  "leoluz/nvim-dap-go",
  "lewis6991/gitsigns.nvim",
  "mfussenegger/nvim-dap",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-tree/nvim-web-devicons",
  "nvim-treesitter/nvim-treesitter",
  "prichrd/manatee.nvim",
  "prichrd/netrw.nvim",
  "prichrd/refgo.nvim",
  "rcarriga/nvim-dap-ui",
  "sotte/presenting.vim",
  "tpope/vim-commentary",
  "tpope/vim-dadbod",
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "tpope/vim-vinegar",
  "github/copilot.vim",
  'echasnovski/mini.nvim',
}, {
  checker = {
    enabled = true,
  },
  dev = {
    path = "~/Workspace/github.com/prichrd/",
  },
})
