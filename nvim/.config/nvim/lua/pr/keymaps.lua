vim.g.mapleader = [[ ]]

-- Next and previous
vim.keymap.set("n", "[b", ":bp<cr>")
vim.keymap.set("n", "]b", ":bn<cr>")
vim.keymap.set("n", "[t", ":tabp<cr>")
vim.keymap.set("n", "]t", ":tabn<cr>")
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[q", ":cprev<cr>")
vim.keymap.set("n", "]q", ":cnext<cr>")
vim.keymap.set("n", "[l", ":lprev<cr>")
vim.keymap.set("n", "]l", ":lnext<cr>")

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buffer }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "L", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, opts)
		vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<C-f>", function()
			vim.lsp.buf.format({ async = false })
		end, opts)
	end,
})
