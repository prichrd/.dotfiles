local utils = require('utils')

local M = {}

M.config_treesitter = function(cfg)
  utils.append(cfg.ensure_installed, { 'markdown' })
end

M.config_ftconf = function(cfg)
  cfg.markdown = function(bufnr, winid)
    vim.api.nvim_buf_set_option(bufnr, 'textwidth', 80)
    vim.api.nvim_win_set_option(winid, 'colorcolumn', '80')
  end
end

return M
