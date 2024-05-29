if vim.env.IS_MAGIC then
  return
end

vim.g.copilot_filetypes = { ['*'] = false, ['lua'] = true, ['go'] = true }
vim.g.copilot_assume_mapped = true
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
