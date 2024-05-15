vim.g.mapleader = [[ ]]
vim.keymap.set("n", "[b", ":bp<cr>")
vim.keymap.set("n", "]b", ":bn<cr>")
vim.keymap.set("n", "[t", ":tabp<cr>")
vim.keymap.set("n", "]t", ":tabn<cr>")
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '[q', ":cprev<cr>")
vim.keymap.set('n', ']q', ":cnext<cr>")
