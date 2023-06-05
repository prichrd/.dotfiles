local ok, mason = pcall(require, "mason")
if not ok then
	return
end

local mason_lspconfig = require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")
local mason_nvim_dap = require("mason-nvim-dap")

mason.setup()

mason_lspconfig.setup({
	ensure_installed = { "gopls", "lua_ls", "rust_analyzer", "tsserver", "denols" },
})

mason_null_ls.setup({
	ensure_installed = { "jq", "shellcheck", "revive", "stylua", "luacheck" },
})

mason_nvim_dap.setup({
	ensure_installed = { "delve" },
})
