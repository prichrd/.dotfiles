local utils = require('utils')

local M = {}

M.config_treesitter = function(cfg)
  utils.append(cfg.ensure_installed, { 'lua' })
end

M.config_lsp = function(lspconfig, on_attach)
  local has_luadev, luadev = utils.preq('lua-dev')
  if not has_luadev then
    return
  end

  lspconfig.sumneko_lua.setup(luadev.setup({
    lspconfig = {
      on_attach = on_attach,
    },
  }))
end

M.config_dap = function()
  -- No debugger
end

return M
