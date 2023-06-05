local ok, null_ls = pcall(require, "null-ls")
if not ok then
	return
end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.revive,
		null_ls.builtins.diagnostics.luacheck,
	},
	on_attach = function()
		local opts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "<C-f>", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
