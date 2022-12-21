local ft_lsp = {
  go = "gopls",
  rust = "rust_analyzer",
}

local lsp_flags = {
  debounce_text_changes = 150,
}

local on_attach = function(client, bufnr)
  local buf_opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<C-f>', function() vim.lsp.buf.format { async = true } end, opts)
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', require'telescope.builtin'.lsp_references, opts)
  vim.keymap.set('n', 'gi', require'telescope.builtin'.lsp_implementations, opts)
  vim.keymap.set('n', 'gd', require'telescope.builtin'.lsp_definitions, opts)
end

local M = {}

M.ftypes = function()
  ftypes = {}
  for k, _ in pairs(ft_lsp) do
    table.insert(ftypes, k)
  end
  return ftypes
end

M.setup = function()
  local lc = require'lspconfig'
  for _, v in pairs(ft_lsp) do
    lc[v].setup{
      flags = lsp_flags,
      on_attach = on_attach,
    }
  end
end

return M
