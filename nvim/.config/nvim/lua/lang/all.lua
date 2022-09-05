local langs = {
  require('lang.go'),
  require('lang.lua'),
}

local M = {}

M.config_treesitter = function(cfg)
  for _, v in ipairs(langs) do
    v.config_treesitter(cfg)
  end
end

M.config_lsp = function(lspconfig, on_attach)
  for _, v in ipairs(langs) do
    v.config_lsp(lspconfig, on_attach)
  end
end

M.config_dap = function(dap)
  for _, v in ipairs(langs) do
    v.config_dap(dap)
  end
end

return M
