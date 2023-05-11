local ft_lsp = {
  go = "gopls",
  rust = "rust_analyzer",
  lua = "lua_ls",
}

local lsp_flags = {
  debounce_text_changes = 150,
}

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<C-f>', function() vim.lsp.buf.format { async = true } end, opts)
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', function() require 'telescope.builtin'.lsp_references { show_line = false } end, opts)
  vim.keymap.set('n', 'gi', function() require 'telescope.builtin'.lsp_implementations { show_line = false } end, opts)
  vim.keymap.set('n', 'gd', function() require 'telescope.builtin'.lsp_definitions { show_line = false } end, opts)
end

local M = {}

M.ftypes = function()
  local ftypes = {}
  for k, _ in pairs(ft_lsp) do
    table.insert(ftypes, k)
  end
  return ftypes
end

M.setup = function()
  local lc = require 'lspconfig'
  require 'neodev'.setup()
  for _, v in pairs(ft_lsp) do
    lc[v].setup {
      flags = lsp_flags,
      on_attach = on_attach,
    }
  end
end

return M
