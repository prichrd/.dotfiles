local ft_snippets = {
  go = {
    todo = "// TODO: $0",
  },
  rust = {
    todo = "// TODO: $0",
  },
  lua = {
    todo = "-- TODO: $0",
  },
}

local M = {}

M.ftypes = function()
  ftypes = {}
  for k, _ in pairs(ft_snippets) do
    table.insert(ftypes, k)
  end
  return ftypes
end

M.setup = function()
  local luasnip = require'luasnip'
  local parse_snippet = luasnip.parser.parse_snippet

  luasnip.setup{}
  for lang, snippets in pairs(ft_snippets) do
    local lang_snippets = {}
    for hook, snippet in pairs(snippets) do
      table.insert(lang_snippets, parse_snippet(hook, snippet))
    end
    luasnip.add_snippets(lang, lang_snippets)
  end

  vim.cmd[[
  " press <Tab> to expand or jump in a snippet. These can also be mapped separately
  " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
  imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
  " -1 for jumping backwards.
  inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

  snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
  snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

  " For changing choices in choiceNodes (not strictly necessary for a basic setup).
  imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
  smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
  ]]
end

return M
