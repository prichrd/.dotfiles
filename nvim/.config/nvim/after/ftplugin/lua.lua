vim.opt_local.expandtab = false

local snippet = require("core.snippets")
snippet.add("fn", "function ${1:name}($2)\n\t${3:-- content}\nend", { buffer = 0 })
snippet.add("todo", "-- TODO: $0", { buffer = 0 })
