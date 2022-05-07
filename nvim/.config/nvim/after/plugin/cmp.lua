local has_cmp, cmp = pcall(require, "cmp")
if not has_cmp then
  return
end

local has_lspkind, lspkind = pcall(require, "lspkind")
if not has_lspkind then
  return
end

local has_luasnip, luasnip = pcall(require, "luasnip")
if not has_luasnip then
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'buffer' },
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
        gh_issues = "[issues]",
        tn = "[TabNine]",
      },
    },
  },
  mapping = {
    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-l>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })
  },
})
