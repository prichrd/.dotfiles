local utils = require('utils')

local M = {}

M.config_treesitter = function(cfg)
  utils.append(cfg.ensure_installed, { 'lua' })
end

M.config_lsp = function(lspconfig, on_attach)
  local has_neodev, neodev = utils.preq('neodev')
  if not has_neodev then
    return
  end

  neodev.setup{}

  lspconfig.sumneko_lua.setup({
    lspconfig = {
      on_attach = on_attach,
    },
  })
end

M.config_dap = function()
  -- No debugger
end

return M
