return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		cmd = "Mason",
		opts = {
			ensure_installed = { "delve" },
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		cmd = "Mason",
		opts = {
			ensure_installed = { "gopls", "lua_ls", "rust_analyzer", "tsserver", "denols" },
		},
	},
}
