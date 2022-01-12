local has_luasnip, ls = pcall(require, "luasnip")
if not has_luasnip then
  return
end

local make = function(tbl)
  local result = {}

  for k, v in pairs(tbl) do
    table.insert(result, ls.s(k, v))
  end

  return result
end

snippets = {};
snippets.all = {};
snippets.go = make(require("snippets.go"));
snippets.rust = make(require("snippets.rust"));
snippets.lua = make(require("snippets.lua"));
snippets.matlab = make(require("snippets.matlab"));

ls.snippets = snippets;

vim.cmd [[
  imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : ''
  inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
  imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
  snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(1)<CR>
  snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
]]
