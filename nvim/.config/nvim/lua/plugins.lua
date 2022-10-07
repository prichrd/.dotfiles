local packer = require 'packer'

local use = packer.use

vim.api.nvim_set_keymap(
  "n",
  "-",
  '<cmd>lua require("netrw").open()<CR>',
  { noremap = true }
)

return packer.startup(function()
  use('wbthomason/packer.nvim')

  -- Editing
  use {
    'numToStr/Comment.nvim',
    config = function() require'Comment'.setup() end
  }
  use {
    'kylechui/nvim-surround',
    config = function() require'nvim-surround'.setup() end
  }

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
  use('saadparwaiz1/cmp_luasnip')
  use('tamago324/cmp-zsh')

  -- Go
  use('fatih/vim-go')

  -- Syntax & Colors
  use('morhetz/gruvbox')
  use('folke/tokyonight.nvim')
  use('kyazdani42/nvim-web-devicons')
  use('nvim-treesitter/nvim-treesitter')
  use('nvim-lualine/lualine.nvim')

  -- Libs
  use('nvim-lua/plenary.nvim')

  use('~/Workspace/github.com/prichrd/netrw.nvim')
end)

