local magic = require('magic')

magic.set_filetypes({
  "go", "gomod", "lua", "bash", "rust",
})

magic.register_plugin({
  name = "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "prichrd/vwd.nvim",
  },
  init = function()
    require("telescope").load_extension('vwd')
  end,
  opts = {
    defaults = {
      file_ignore_patterns = { ".git/", "vendor/" },
      mappings = {
        i = {
          ["<C-j>"] = function(bufnr) magic.api.plugins.telescope.move_selection_down(bufnr) end,
          ["<C-k>"] = function(bufnr) magic.api.plugins.telescope.move_selection_up(bufnr) end,
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
  },
  api_overrides = {
    buffers = {
      find = function() package.loaded["telescope.builtin"].buffers() end,
    },
    diagnostics = {
      find = function() package.loaded["telescope.builtin"].diagnostics() end,
    },
    quickfixes = {
      find = function() package.loaded["telescope.builtin"].quickfix() end,
    },
    locations = {
      find = function() package.loaded["telescope.builtin"].locations() end,
    },
    files = {
      find = function() package.loaded["telescope"].extensions.vwd.find_files({}) end,
      grep = function() package.loaded["telescope"].extensions.vwd.live_grep({}) end,
    },
    keymaps = {
      find = function() package.loaded["telescope.builtin"].keymaps() end,
    },
    git = {
      status = {
        find = function() package.loaded["telescope.builtin"].git_status() end,
      },
    },
    help_tags = {
      find = function() package.loaded["telescope.builtin"].help_tags() end,
    },
    symbols = {
      find = function() package.loaded["telescope.builtin"].symbols() end,
    },
    plugins = {
      telescope = {
        move_selection_down = function(bufnr) package.loaded["telescope.actions"].move_selection_next(bufnr) end,
        move_selection_up = function(bufnr) package.loaded["telescope.actions"].move_selection_next(bufnr) end,
      },
    },
  },
})

magic.register_plugin({
  name = "folke/tokyonight.nvim",
  opts = { style = "night" },
  init = function()
    vim.cmd.colorscheme("tokyonight")
  end,
})

magic.register_plugin({
  name = "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "prichrd/vwd.nvim",
  },
  opts = {
    view_options = {
      show_hidden = false,
      is_hidden_file = function(name, bufnr)
        return name == ".."
      end,
    },
    keymaps = {
      ["<TAB>"] = function() magic.api.plugins.oil.set_vwd() end,
    },
  },
  api_overrides = {
    files = {
      explore = function() package.loaded["oil"].open() end
    },
    plugins = {
      oil = {
        set_vwd = function()
          package.loaded['vwd'].set_vwd(package.loaded["oil"].get_current_dir(), true)
          print("[oil] current vwd:", require('vwd').get_vwd())
        end,
      },
    },
  }
})

magic.register_plugin({
  name = "tpope/vim-fugitive",
  api_overrides = {
    git = {
      show_blame = function() vim.cmd("G blame") end,
    },
  }
})

magic.register_plugin({
  name = "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  api_overrides = {
    bookmarks = {
      add = function() package.loaded["harpoon"]:list():add() end,
      list = function() package.loaded["harpoon"].ui:toggle_quick_menu(package.loaded["harpoon"]:list()) end,
      next = function() package.loaded["harpoon"]:list():next() end,
      prev = function() package.loaded["harpoon"]:list():prev() end,
    },
  },
})

magic.register_plugin({
  name = "tpope/vim-surround",
})

magic.register_plugin({
  name = "tpope/vim-commentary",
})

magic.register_plugin({
  name = "echasnovski/mini.completion",
  opts = {}
})

magic.register_plugin({
  name = "echasnovski/mini.cursorword",
  opts = {}
})

magic.register_plugin({
  name = "echasnovski/mini.trailspace",
  opts = {}
})

magic.register_plugin({
  name = "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
})

magic.register_plugin({
  name = "github/copilot.vim",
  init = function()
    -- TODO: Configure with filetype
    vim.g.copilot_filetypes = { ['*'] = false, ['lua'] = true, ['go'] = true }
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
  end
})

magic.register_plugin({
  name = "nvim-treesitter/nvim-treesitter",
  dependencies = { "nvim-treesitter/playground" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = magic.filetypes,
      highlight = {
        enable = true,
      },
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      disable = function(_, buf)
        local max_filesize = 100 * 1024   -- 100 KB
        local exists, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if exists and stats and stats.size > max_filesize then
          return true
        end
      end,
      additional_vim_regex_highlighting = false,
    })
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  end,
})

if vim.env.IS_MAGIC then
  magic.setup()
else
  require("pr.setup")
  require("pr.plugins")
end

require("pr.options")
require("pr.keymaps")
