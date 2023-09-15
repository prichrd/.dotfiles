local fts = { "go", "lua", "typescript", "typescriptreact", "rust", "r", "python" }

return {
	{
		"folke/neodev.nvim",
		ft = "lua",
	},
	{
		"neovim/nvim-lspconfig",
		ft = fts,
		dependencies = {
			"folke/neodev.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")

			local lsp_flags = {
				debounce_text_changes = 150,
			}

			local on_attach = function(client, bufnr)
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

				local opts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<C-f>", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
				vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
			end

			lspconfig["gopls"].setup({
				flags = lsp_flags,
				on_attach = on_attach,
			})

			require("neodev").setup()
			lspconfig["lua_ls"].setup({
				flags = lsp_flags,
				on_attach = on_attach,
			})

			lspconfig["gopls"].setup({
				flags = lsp_flags,
				on_attach = on_attach,
			})

			lspconfig["rust_analyzer"].setup({
				flags = lsp_flags,
				on_attach = on_attach,
			})

			lspconfig["zls"].setup({
				flags = lsp_flags,
				on_attach = on_attach,
			})

			lspconfig["tsserver"].setup({
				flags = lsp_flags,
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
					on_attach(client, bufnr)
				end,
			})
		end,
	},
}
