local treesitter = require 'nvim-treesitter.configs'

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

local ts_languages = {"go", "yaml", "rust", "lua", "python", "c", "cpp"}
treesitter.setup{
  ensure_installed = ts_languages,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
