local packer = require 'packer'

return packer.startup(function()
  use 'wbthomason/packer.nvim'

  use 'dracula/vim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-dadbod'
  use 'tpope/vim-dotenv'
  use 'tpope/vim-surround'
  use 'tpope/vim-dispatch'
  use 'habamax/vim-asciidoctor'
  use 'kristijanhusak/vim-dadbod-ui'

  use 'noahfrederick/vim-noctu'
  use 'jsit/disco.vim'
  use 'morhetz/gruvbox'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-telescope/telescope-project.nvim',
    },
    config = [[require('config.telescope')]],
  }

  use {
    'fatih/vim-go',
    config = [[require('config.go')]],
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = 'call mkdp#util#install()',
    config = [[require('config.markdown_preview')]],
  }

  use {
    'prichrd/vim-matlab',
    config = [[require('config.matlab')]],
  }

  use {
    'ray-x/lsp_signature.nvim',
    config = [[require('config.lsp_signature')]],
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = [[require('config.gitsigns')]],
  }

  use { 
    'neovim/nvim-lspconfig', 
    config = [[require('config.lspconfig')]],
  }

  use {
    'l3mon4d3/luasnip',
    config = [[require('config.luasnip')]],
  }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = [[require('config.cmp')]],
  }

  use {
    'nvim-treesitter/nvim-treesitter', 
    config = [[require('config.treesitter')]],
    run = ':TSUpdate',
  } 

  use {
    'prichrd/pogo.nvim',
    config = [[require('config.pogo')]],
  }
end)
