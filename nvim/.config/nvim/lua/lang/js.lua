local utils = require('utils')

local M = {}

M.config_treesitter = function(cfg)
  utils.append(cfg.ensure_installed, { 'javascript' })
end

M.config_lsp = function(lspconfig, on_attach)
end

M.config_dap = function(dap)
end

return M
