local ft_snippets = {
	go = {
		["case"] = "case ${1:condition}:\n\t$0",
		["else"] = "else{\n\t$0\n}",
		["elseif"] = "else if (${1:true}) {\n\t$0\n}",
		["fn"] = "func $1($2){\n\t$0\n}",
		["fori"] = "for ${1:i} := 0; $1 < ${2:count}; ${1}++ {\n\t$0\n}",
		["forr"] = "for ${1:k, v} := range ${2:arr} {\n\t$0\n}",
		["ife"] = "if err != nil {\n\treturn ${0:nil}, err\n}",
		["if"] = "if ${1:true} {\n\t$0\n}",
		["int"] = "type ${1:Name} interface {\n\t$0\n}",
		["main"] = "package main\n\nfunc main() {\n\t$0\n}",
		["note"] = "// NOTE: $0",
		["ret"] = "return $0",
		["select"] = "select {\ncase ${1:condition}:\n\t$0\n}",
		["st"] = "type ${1:Name} struct {\n\t$0\n}",
		["switch"] = "switch ${1:expression} {\ncase ${2:condition}:\n\t$0\n",
		["test"] = "func Test${1:Name}(t *testing.T) {\n\t$0\n}",
		["todo"] = "// TODO: $0",
		["type"] = "type ${1:Name} ${0:int}",
	},
	rust = {
		["todo"] = "// TODO: $0",
		["note"] = "// NOTE: $0",
	},
	lua = {
		["else"] = "else\n\t$0",
		["elseif"] = "elseif ${1:true} then\n\t$0",
		["fori"] = "for ${1:i}=0,${2:10} do\n\t$0\nend",
		["forr"] = "for ${1:k, v} in pairs(${2:table}) do\n\t$0\nend",
		["fn"] = "function ${1:name}($2)\n\t${0:-- TODO: Implement}\nend",
		["if"] = "if ${1:true} then\n\t$0\nend",
		["lfun"] = "local ${1:var} = function($2)\n\t${0:-- TODO: Implement}\nend",
		["lreq"] = "local ${1:var} = require'${1:module}'",
		["note"] = "-- NOTE: $0",
		["pr"] = "print($0)",
		["pri"] = "print(vim.inspect($0))",
		["req"] = "require'${0:module}'",
		["ret"] = "return $0",
		["todo"] = "-- TODO: $0",
		["while"] = "while ${1:true} do\n\t$0\nend",
	},
  typescript = {
		["todo"] = "// TODO: $0",
  },
	gitcommit = {
		["ci"] = "ci($1): $2\n\n$0",
		["fix"] = "fix($1): $2\n\n$0",
		["docs"] = "docs($1): $2\n\n$0",
		["feat"] = "feat($1): $2\n\n$0",
		["test"] = "test($1): $2\n\n$0",
		["chore"] = "chore($1): $2\n\n$0",
		["refactor"] = "refactor($1): $2\n\n$0",
	},
}

return {
	{
		"l3mon4d3/luasnip",
		ft = function()
			local ft = {}
			for l, _ in pairs(ft_snippets) do
				table.insert(ft, l)
			end
			return ft
		end,
		opts = { history = false },
		config = function()
			local ls = require("luasnip")
			for lang, s in pairs(ft_snippets) do
				local snippets = {}
				for hook, snip in pairs(s) do
					table.insert(snippets, ls.parser.parse_snippet(hook, snip))
				end
				ls.add_snippets(lang, snippets)
			end

			local unlinkgrp = vim.api.nvim_create_augroup("UnlinkSnippetOnModeChange", { clear = true })
			vim.api.nvim_create_autocmd("ModeChanged", {
				group = unlinkgrp,
				pattern = { "*:n" },
				desc = "Forget the current snippet when leaving the insert mode",
				callback = function(evt)
					local luasnip = require("luasnip")
					if
						luasnip.session
						and luasnip.session.current_nodes[evt.buf]
						and not luasnip.session.jump_active
					then
						luasnip.unlink_current()
					end
				end,
			})

			vim.cmd([[
        imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
        inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
        snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
        snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
        imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
        smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
      ]])
		end,
	},
}
