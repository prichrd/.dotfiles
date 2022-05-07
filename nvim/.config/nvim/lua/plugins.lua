
local packer = require 'packer'

return packer.startup(function()

  -- Allows the loading of local packages first if they are available. The function 
  -- will start by looking in the ~/Workspace/github.com/ directory and then fallback
  -- to regular `use`.
  local use_local = function(repo, package, opts)
    opts = opts or {}
    local plug_path = repo .. '/' .. package
    local workspace = "~/Workspace/github.com/"
    if vim.fn.isdirectory(vim.fn.expand(workspace .. plug_path)) == 1 then
      opts[1] = workspace .. plug_path
    else
      opts[1] = string.format("%s/%s", repo, package)
    end
    use(opts)
  end

  use_local('wbthomason', 'packer.nvim')

  use_local('cappyzawa', 'starlark.vim')
  use_local('fatih', 'vim-go')
  use_local('folke', 'lua-dev.nvim')
  use_local('hrsh7th', 'cmp-buffer')
  use_local('hrsh7th', 'cmp-nvim-lsp')
  use_local('hrsh7th', 'cmp-nvim-lsp-document-symbol')
  use_local('hrsh7th', 'cmp-nvim-lua')
  use_local('hrsh7th', 'cmp-path')
  use_local('hrsh7th', 'nvim-cmp')
  use_local('kyazdani42', 'nvim-web-devicons')
  use_local('l3mon4d3', 'luasnip')
  use_local('lewis6991', 'gitsigns.nvim')
  use_local('morhetz', 'gruvbox')
  use_local('neovim', 'nvim-lspconfig' )
  use_local('nvim-lua', 'plenary.nvim')
  use_local('nvim-lualine', 'lualine.nvim')
  use_local('nvim-telescope', 'telescope-fzy-native.nvim')
  use_local('nvim-telescope', 'telescope-project.nvim')
  use_local('nvim-telescope', 'telescope.nvim')
  use_local('nvim-treesitter', 'nvim-treesitter' )
  use_local('nvim-treesitter', 'nvim-treesitter-textobjects')
  use_local('nvim-treesitter', 'playground' )
  use_local('onsails', 'lspkind.nvim')
  use_local('prichrd', 'snippets')
  use_local('prichrd', 'vim-matlab')
  use_local('ray-x', 'lsp_signature.nvim')
  use_local('rust-lang', 'rust.vim')
  use_local('saadparwaiz1', 'cmp_luasnip')
  use_local('tamago324', 'cmp-zsh')
  use_local('theprimeagen', 'git-worktree.nvim')
  use_local('tpope', 'vim-commentary')
  use_local('tpope', 'vim-fugitive')
  use_local('tpope', 'vim-surround')
  use_local('tpope', 'vim-vinegar')
end)
