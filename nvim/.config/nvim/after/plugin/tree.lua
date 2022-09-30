local has_tree, tree = pcall(require, "nvim-tree")
if not has_tree then
  return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

tree.setup{
  -- disable_netrw = true,
  hijack_netrw = true,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  view = {
    float = {
      enable = true,
      open_win_config = {
        relative = 'win',
        width = 1000
      }
    },
    mappings = {
      list = {
        { key = "<CR>", action = "edit_in_place" }
      }
    }
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false
      }
    }
  }
}

local function toggle_replace()
  local view = require"nvim-tree.view"
  if view.is_visible() then
    view.close()
  else
    require"nvim-tree".open_replacing_current_buffer()
  end
end
require"nvim-tree".setup {
    }

vim.api.nvim_set_keymap('n', '-', ':lua require"nvim-tree".open_replacing_current_buffer()<CR>', {})
