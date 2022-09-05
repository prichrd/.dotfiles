local packer = require 'packer'

local use = packer.use

return packer.startup(function()
  use('wbthomason/packer.nvim')

  -- Editing
  use('tpope/vim-commentary')
  use('tpope/vim-surround')
  use('tpope/vim-vinegar')

  -- Telescope
  use('nvim-telescope/telescope-fzy-native.nvim')
  use('nvim-telescope/telescope.nvim')

  -- LSP
  use('neovim/nvim-lspconfig')
  use('onsails/lspkind.nvim')
  use('folke/lua-dev.nvim')
  use('ray-x/lsp_signature.nvim')

  -- Debug
  use('mfussenegger/nvim-dap')
  use('thehamsta/nvim-dap-virtual-text')
  use('rcarriga/nvim-dap-ui')

  -- Snippets
  use('l3mon4d3/luasnip')
  use('prichrd/snippets')

  -- Git
  use('lewis6991/gitsigns.nvim')
  use('tpope/vim-fugitive')

  -- Completion
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-nvim-lsp-document-symbol')
  use('hrsh7th/cmp-nvim-lua')
  use('hrsh7th/cmp-path')
  use('hrsh7th/nvim-cmp')
  use('kyazdani42/nvim-web-devicons')
  use('saadparwaiz1/cmp_luasnip')
  use('tamago324/cmp-zsh')

  -- Syntax & Colors
  use('morhetz/gruvbox')
  use('nvim-treesitter/nvim-treesitter')
  use('nvim-lualine/lualine.nvim')

  -- Libs
  use('nvim-lua/plenary.nvim')
end)
