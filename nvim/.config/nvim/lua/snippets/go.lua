local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local M = {}

M.todo = {
  t{"// TODO(prichard): "},
  i(1),
}

M.print = {
  t{"fmt.Println("},
  i(1),
  t{")"},
}

M.main = {
  t{"func main() {", "\t"},
  i(0),
  t{"", "}"},
}

M.st = {
  t{"type "},
  i(1),
  t{" struct {", "\t"},
  i(0),
  t{"", "}"},
}

return M
