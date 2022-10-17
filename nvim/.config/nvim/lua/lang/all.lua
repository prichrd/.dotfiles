local langs = {
  require('lang.go'),
  require('lang.hcl'),
  require('lang.js'),
  require('lang.json'),
  require('lang.lua'),
  require('lang.vim'),
  require('lang.qf'),
  require('lang.markdown'),
}

local M = {}

M.config_treesitter = function(cfg)
  for _, v in ipairs(langs) do
    if v.config_treesitter then
      v.config_treesitter(cfg)
    end
  end
end

M.config_lsp = function(lspconfig, on_attach)
  for _, v in ipairs(langs) do
    if v.config_lsp then
      v.config_lsp(lspconfig, on_attach)
    end
  end
end

M.config_dap = function(dap)
  for _, v in ipairs(langs) do
    if v.config_dap then
      v.config_dap(dap)
    end
  end
end

M.config_ftconf = function(cfg)
  for _, v in ipairs(langs) do
    if v.config_ftconf then
      v.config_ftconf(cfg)
    end
  end
end

M.config_luasnip = function(luasnip)
  for _, v in ipairs(langs) do
    if v.config_luasnip then
      v.config_luasnip(luasnip)
    end
  end
end

return M
