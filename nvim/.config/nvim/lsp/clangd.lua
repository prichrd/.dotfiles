---@type vim.lsp.Config
return {
	cmd = { "clangd" },
	root_markers = { "Makefile", ".clangd" },
	filetypes = { "c", "cpp" },
	init_options = {
		clangdFileStatus = true,
		usePlaceholders = true,
		completeUnimported = true,
		semanticHighlighting = true,
	},
	settings = {
		clangd = {},
	},
	capabilities = {
		offsetEncoding = { "utf-16" },
	},
}
