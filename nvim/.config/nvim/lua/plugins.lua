local packer = require 'packer'

local use = packer.use

return packer.startup(function()
  use('wbthomason/packer.nvim')

  use('echasnovski/mini.nvim')
  use('fatih/vim-go')
  use('folke/neodev.nvim')
  use('folke/tokyonight.nvim')
  use('kyazdani42/nvim-web-devicons')
  use('l3mon4d3/luasnip')
  use('lewis6991/gitsigns.nvim')
  use('lewis6991/impatient.nvim')
  use('mfussenegger/nvim-dap')
  use('neovim/nvim-lspconfig')
  use('nvim-lua/plenary.nvim')
  use('nvim-telescope/telescope-file-browser.nvim')
  use('nvim-telescope/telescope-fzy-native.nvim')
  use('nvim-telescope/telescope.nvim')
  use('nvim-treesitter/nvim-treesitter')
  use('nvim-treesitter/playground')
  use('prichrd/flagmode.nvim')
  use('prichrd/ftconf.nvim')
  use('prichrd/manatee.nvim')
  use('prichrd/refgo.nvim')
  use('rcarriga/nvim-dap-ui')
  use('thehamsta/nvim-dap-virtual-text')
  use('tpope/vim-fugitive')
end)

