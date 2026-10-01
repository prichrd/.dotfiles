vim.opt_local.expandtab = false
vim.cmd.compiler("go")

local snippet = require("core.snippets")
snippet.add("fn", "func $1($2){\n\t$0\n}", { buffer = 0 })
snippet.add("st", "type ${1:Name} struct {\n\t$0\n}", { buffer = 0 })
snippet.add("int", "type ${1:Name} interface {\n\t$0\n}", { buffer = 0 })
snippet.add("switch", "switch ${1:expression} {\ncase ${2:condition}:\n\t$0\n", { buffer = 0 })
snippet.add("select", "select {\ncase ${1:condition}:\n\t$0\n}", { buffer = 0 })
snippet.add("test", "func Test${1:Name}(t *testing.T) {\n\t$0\n}", { buffer = 0 })
snippet.add("todo", "// TODO: $0", { buffer = 0 })
snippet.add("main", "package main\n\nfunc main() {\n\t$0\n}", { buffer = 0 })
snippet.add("forr", "for ${1:k, v} := range ${2:arr} {\n\t$0\n}", { buffer = 0 })
