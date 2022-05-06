local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
  return
end

local actions = require "telescope.actions"

telescope.setup({
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    file_ignore_patterns = {'.git/*'},
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
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
})

telescope.load_extension('fzy_native')
telescope.load_extension('git_worktree')

vim.cmd[[
  nnoremap <Leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
  nnoremap <Leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
  nnoremap <Leader>fw <cmd>lua require('telescope.builtin').grep_string()<cr>
  nnoremap <Leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
  nnoremap <Leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
  nnoremap <Leader>fq <cmd>lua require('telescope.builtin').quickfix()<cr>
  nnoremap <Leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
  nnoremap <Leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
  nnoremap <Leader>wc <cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>
  nnoremap <Leader>ww <cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>
]]
