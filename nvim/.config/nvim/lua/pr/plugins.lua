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

require 'lazy'.setup({
  {
    'folke/tokyonight.nvim',
    lazy = false,
    init = function()
      require 'tokyonight'.setup { style = "night" }
      vim.cmd.colorscheme('tokyonight')
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    init = function()
      require 'gitsigns'.setup {}
    end,
  },

  {
    'prichrd/netrw.nvim',
    ft = 'netrw',
    init = function() require 'netrw'.setup {
        mappings = {
          ["p"] = function(payload)
            require 'manatee'.set_vwd(payload.dir, true)
          end,
        },
      }
    end,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'tpope/vim-vinegar',
      'prichrd/manatee.nvim',
    },
  },

  {
    'prichrd/refgo.nvim',
    cmd = { 'RefGo', 'RefCopy' },
  },

  {
    'echasnovski/mini.nvim',
    init = function()
      require 'mini.comment'.setup {}
      require 'mini.completion'.setup {}
      require 'mini.cursorword'.setup {}
      require 'mini.tabline'.setup {}
      require 'mini.bufremove'.setup {}
      require 'mini.statusline'.setup {}
      require 'mini.trailspace'.setup {}
      require 'mini.indentscope'.setup {
        draw = {
          delay = 0,
          animation = function() return 0 end,
        },
        symbol = '│',
      }
      require 'mini.surround'.setup {
        mappings = {
          add = 'ca',
          delete = 'ds',
          find = 'cf',
          find_left = 'cF',
          highlight = 'ch',
          replace = 'cs',
          update_n_lines = 'cn',
          suffix_last = 'l',
          suffix_next = 'n',
        },
      }
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'prichrd/manatee.nvim',
      'nvim-lua/plenary.nvim',
    },
    init = function()
      local telescope = require 'telescope'
      local actions = require 'telescope.actions'
      telescope.setup({
        defaults = {
          border = false,
          file_ignore_patterns = { '.git/' },
          layout_strategy = 'bottom_pane',
          layout_config = {
            prompt_position = 'bottom'
          },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.send_to_qflist,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          live_grep = {
            hidden = true,
          },
        },
      })
      telescope.load_extension('manatee')

      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<Leader>ff', require 'telescope'.extensions.manatee.find_files, opts)
      vim.keymap.set('n', '<Leader>fg', require 'telescope'.extensions.manatee.live_grep, opts)
      vim.keymap.set('n', '<Leader>fb', require 'telescope.builtin'.buffers, opts)
      vim.keymap.set('n', '<Leader>fh', require 'telescope.builtin'.help_tags, opts)
      vim.keymap.set('n', '<Leader>fq', require 'telescope.builtin'.quickfix, opts)
      vim.keymap.set('n', '<Leader>fk', require 'telescope.builtin'.keymaps, opts)
      vim.keymap.set('n', '<Leader>gs', require 'telescope.builtin'.git_status, opts)
    end,
  },

  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'leoluz/nvim-dap-go',
      'rcarriga/nvim-dap-ui'
    },
    ft = require 'pr.debug'.ftypes(),
    config = function() require 'pr.debug'.setup() end
  },

  {
    'l3mon4d3/luasnip',
    ft = require 'pr.snippets'.ftypes(),
    config = function() require 'pr.snippets'.setup() end
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'folke/neodev.nvim',
    },
    ft = require 'pr.lsp'.ftypes(),
    config = function() require 'pr.lsp'.setup() end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    ft = require 'pr.treesitter'.ftypes(),
    config = function() require 'pr.treesitter'.setup() end,
  },

  { 'tpope/vim-fugitive' },
  { 'tpope/vim-dadbod' },

}, {
  checker = {
    enabled = true,
  },
  install = {
    colorscheme = {},
  },
  dev = {
    path = "~/Workspace/github.com/prichrd/",
  },
})
