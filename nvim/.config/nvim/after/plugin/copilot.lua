vim.g.copilot_assume_mapped = true
vim.keymap.del("i", "<Tab>")
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
