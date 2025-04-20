vim.opt.confirm = true
vim.opt.updatetime = 200
vim.opt.pumheight = 10
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars = { tab = "> ", trail = "·", extends = "»", precedes = "«" }
vim.opt.confirm = true
vim.opt.expandtab = true
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.list = true
vim.opt.mouse = "a"
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.relativenumber = true
vim.opt.shell = "zsh"
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true

vim.g.mapleader = vim.keycode("<space>")
vim.g.maplocalleader = vim.keycode("<cr>")

vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
