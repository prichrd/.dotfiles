local utils = require('utils')

local M = {}

M.config_treesitter = function(cfg)
  utils.append(cfg.ensure_installed, { 'lua' })
end

M.config_lsp = function(lspconfig, on_attach)
  local has_neodev, neodev = utils.preq('neodev')
  if not has_neodev then
    return
  end

  neodev.setup{}

  lspconfig.sumneko_lua.setup({
    lspconfig = {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    },
  })
end

M.config_ftconf = function(cfg)
  cfg.lua = function(bufnr, winid)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>s', '<cmd>source<CR>', opts)
    vim.api.nvim_buf_set_option(bufnr, 'textwidth', 80)
    vim.api.nvim_win_set_option(winid, 'colorcolumn', '80')
  end
end

M.config_luasnip = function(ls)
  ls.add_snippets('lua', {
    ls.parser.parse_snippet("todo", "-- TODO: $0"),
    ls.parser.parse_snippet("note", "-- NOTE: $0"),
    ls.parser.parse_snippet("preq", "local has_${1:package}, $1 = pcall(require, \"$1\")\nif not has_$1 then\n\treturn\nend")
  })
end

return M
