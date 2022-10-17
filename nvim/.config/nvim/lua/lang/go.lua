local utils = require('utils')

local M = {}

M.config_treesitter = function(cfg)
  utils.append(cfg.ensure_installed, { 'go', 'gomod' })
end

M.config_lsp = function(lspconfig, on_attach)
  lspconfig.gopls.setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

M.config_dap = function(dap)
  dap.adapters.delve = {
    type = 'server',
    port = '${port}',
    executable = {
      command = 'dlv',
      args = {'dap', '-l', '127.0.0.1:${port}'},
    }
  }

  dap.configurations.go = {
    {
      type = "delve",
      name = "Debug Run",
      request = "launch",
      program = "${file}"
    }, {
      type = "delve",
      name = "Debug Test",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}",
    }
  }
end

M.config_ftconf = function(cfg)
  cfg.go = function(bufnr, winid)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>b', '<Plug>(go-build)', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>r', '<Plug>(go-run)', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>t', '<Plug>(go-test)', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>a', '<Plug>(go-alternate-edit)', opts)
    vim.api.nvim_buf_set_option(bufnr, 'textwidth', 80)
    vim.api.nvim_win_set_option(winid, 'colorcolumn', '80')
  end
end

M.config_luasnip = function(ls)
  ls.add_snippets('go', {
    ls.parser.parse_snippet("todo", "// TODO: $0"),
    ls.parser.parse_snippet("note", "// NOTE: $0"),
    ls.parser.parse_snippet("forr", "for ${1:k, v} := range ${2:list} {\n\t$0\n}" ),
    ls.parser.parse_snippet("fori", "for i := 0; i < ${1:10}; i++ {\n\t$0\n}" ),
    ls.parser.parse_snippet("st", "type $1 struct {\n\t$0\n}" ),
    ls.parser.parse_snippet("int", "type $1 interface {\n\t$0\n}" ),
  })
end

return M
