local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")
local mason_nvim_dap = require("mason-nvim-dap")

local M = {}

M.setup = function()
  mason.setup()
  mason_lspconfig.setup({
    ensure_installed = { "gopls", "lua_ls", "rust_analyzer" },
  })
  mason_null_ls.setup({
    ensure_installed = { "jq", "shellcheck", "revive", "stylua", "luacheck", "eslint_d" },
  })
  mason_nvim_dap.setup({
    ensure_installed = { "delve" },
  })
end

return M
