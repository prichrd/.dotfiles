local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '[q', '<cmd>cprev<CR>', opts)
vim.api.nvim_set_keymap('n', ']q', '<cmd>cnext<CR>', opts)
vim.api.nvim_set_keymap('n', '[b', '<cmd>bprev<CR>', opts)
vim.api.nvim_set_keymap('n', ']b', '<cmd>bnext<CR>', opts)
vim.api.nvim_set_keymap('n', '[t', '<cmd>tabn<CR>', opts)
vim.api.nvim_set_keymap('n', ']t', '<cmd>tabp<CR>', opts)

vim.api.nvim_set_keymap('n', '<Leader>bd', '<cmd>bd<CR>', opts)
