vim.g.mapleader = [[ ]]

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '[q', '<cmd>cprev<CR>', opts)
vim.keymap.set('n', ']q', '<cmd>cnext<CR>', opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

vim.keymap.set('n', '[b', '<cmd>bprev<CR>', opts)
vim.keymap.set('n', ']b', '<cmd>bnext<CR>', opts)
vim.keymap.set('n', '<Leader>bd', '<cmd>bdelete<CR>', opts)

vim.keymap.set('n', '[t', '<cmd>tabn<CR>', opts)
vim.keymap.set('n', ']t', '<cmd>tabp<CR>', opts)
vim.keymap.set('n', '<Leader>td', '<cmd>tabclose<CR>', opts)
vim.keymap.set('n', '<Leader>tn', '<cmd>tabe<CR>', opts)

vim.keymap.set('n', '<Leader>dq', vim.diagnostic.setloclist, opts)
