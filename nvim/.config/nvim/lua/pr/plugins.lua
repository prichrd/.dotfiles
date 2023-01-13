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
      local gs = require 'gitsigns'
      gs.setup {
        on_attach = function(bufnr)
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map('n', ']h', function()
            if vim.wo.diff then return ']h' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true })
          map('n', '[h', function()
            if vim.wo.diff then return '[h' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true })
          map('n', '<Leader>gh', gs.preview_hunk)
          map('n', '<Leader>gd', gs.diffthis)
          map('n', '<Leader>gb', function() gs.blame_line { full = false } end)
        end
      }
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
    },
  },
  -- { 'fatih/vim-go' },
  { 'tpope/vim-fugitive' },
  {
    'simrat39/symbols-outline.nvim',
    cmd = { 'SymbolsOutline' },
    config = function() require 'symbols-outline'.setup {} end,
  },
  {
    'prichrd/refgo.nvim',
    cmd = { 'RefGo', 'RefCopy' },
  },

  {
    'echasnovski/mini.nvim',
    init = function()
      require 'mini.ai'.setup {}
      require 'mini.align'.setup {}
      require 'mini.comment'.setup {}
      require 'mini.completion'.setup {}
      require 'mini.cursorword'.setup {}
      require 'mini.doc'.setup {}
      require 'mini.jump'.setup {}
      require 'mini.jump2d'.setup {}
      require 'mini.statusline'.setup {}
      require 'mini.trailspace'.setup {}
      require 'mini.indentscope'.setup {
        draw = {
          delay = 0,
          animation = function() return 0 end,
        }
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
          file_ignore_patterns = { '.git/' },
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
      'leoluz/nvim-dap-go'
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
