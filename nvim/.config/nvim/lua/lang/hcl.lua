local utils = require('utils')

local M = {}

M.config_treesitter = function(cfg)
  utils.append(cfg.ensure_installed, { 'hcl' })
end

M.config_lsp = function(lspconfig, on_attach)
  lspconfig.terraformls.setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

M.config_dap = function(dap)
  dap.adapters.delve = {
    type = 'server',
    port = '${port}',
    executable = {
      command = 'dlv',
      args = {'dap', '-l', '127.0.0.1:${port}'},
    }
  }

  dap.configurations.go = {
    {
      type = "delve",
      name = "Debug Run",
      request = "launch",
      program = "${file}"
    }, {
      type = "delve",
      name = "Debug Test",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}",
    }
  }
end

return M
