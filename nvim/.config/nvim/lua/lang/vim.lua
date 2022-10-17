local utils = require('utils')

local M = {}

M.config_treesitter = function(cfg)
  utils.append(cfg.ensure_installed, { 'vim' })
end

M.config_ftconf = function(cfg)
  cfg.vim = function(bufnr, winid)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>s', '<cmd>source<CR>', opts)
    vim.api.nvim_buf_set_option(bufnr, 'textwidth', 80)
    vim.api.nvim_win_set_option(winid, 'colorcolumn', '80')
  end
end

return M
