local ft_snippets = {
  go = {
    ["todo"] = "// TODO: $0",
  },
  rust = {
    ["todo"] = "// TODO: $0",
  },
  lua = {
    ["todo"] = "-- TODO: $0",
  },
}

local M = {}

M.ftypes = function()
  local ftypes = {}
  for k, _ in pairs(ft_snippets) do
    table.insert(ftypes, k)
  end
  return ftypes
end

M.setup = function()
  local ls = require('luasnip')
  ls.setup{
    history = false,
  }

  for lang, s in pairs(ft_snippets) do
    local snippets = {}
    for hook, snip in pairs(s) do
      table.insert(snippets, ls.parser.parse_snippet(hook, snip))
    end
    ls.add_snippets(lang, snippets)
  end

  vim.cmd[[
  imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
  inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
  snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
  snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
  imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
  smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
  ]]
end

return M
