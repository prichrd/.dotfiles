local M = {}

M.config_ftconf = function(cfg)
  cfg.qf = function(bufnr, _)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Esc><Esc>', '<cmd>q<CR>', opts)
  end
end

return M
