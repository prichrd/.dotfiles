local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
  return
end

local actions = require "telescope.actions"
local fb_actions = require "telescope".extensions.file_browser.actions
local manatee_actions = require "telescope".extensions.manatee.actions

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
      theme = "ivy",
      hidden = true,
    },
    live_grep = {
      theme = "ivy",
      hidden = true,
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
    file_browser = {
      theme = "ivy",
      path = "%:p:h",
      cwd_to_path = true,
      hide_parent_dir = true,
      hijack_netrw = true,
      select_buffer = true,
      grouped = true,
      hidden = true,
      mappings = {
        ["n"] = {
          ["-"] = fb_actions.goto_parent_dir,
          ["%"] = fb_actions.create,
          ["d"] = fb_actions.create,
          ["m"] = fb_actions.move,
          ["R"] = fb_actions.rename,
          ["D"] = fb_actions.remove,
          ["p"] = manatee_actions.set_vwd,
        },
        ["i"] = {},
      },
    },
  },
})

telescope.load_extension('file_browser')
telescope.load_extension('manatee')

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '-', '<cmd>lua require"telescope".extensions.manatee.file_browser{ initial_mode = "normal" }<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>lua require"telescope".extensions.manatee.find_files{}<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>lua require"telescope".extensions.manatee.live_grep{}<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>fq', '<cmd>lua require("telescope.builtin").quickfix()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>fk', '<cmd>lua require("telescope.builtin").keymaps()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>gs', '<cmd>lua require("telescope.builtin").git_status()<CR>', opts)
