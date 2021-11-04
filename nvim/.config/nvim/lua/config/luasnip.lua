local luasnip = require 'luasnip'
local cmp = require 'cmp'

local s = luasnip.snippet
local sn = luasnip.snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
local parse = luasnip.parser.parse_snippet

luasnip.snippets = {
  all = {},
  go = {
    parse(
      "todo",
      "// TODO(prichard): ${0}"
    ),
    parse(
			"main",
			"func main() {\n\t${0}\n}"
		),
    parse(
			"forr",
			"for ${2:k, v} := range ${1:collection} {\n\t${0}\n}"
		),
    parse(
			"fori",
			"for ${2:i} := 0; ${2} < ${1:count}; ${2}++ {\n\t${0}\n}"
		),
    parse(
			"st",
			"type ${1:Something} struct {\n\t${0}\n}"
		),
    parse(
      "test",
      "func Test${1:Something}(t *testing.T) {\n\t${0}\n}"
    ),
  },
}

vim.cmd[[
  imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>' 

  inoremap <silent> <C-j> <cmd>lua require('luasnip').jump(1)<Cr>
  inoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<Cr>

  snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(1)<Cr>
  snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<Cr>

  imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
  smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]]
