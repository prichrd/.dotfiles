local has_cmp, cmp = pcall(require, "cmp")
if not has_cmp then
  return
end

cmp.setup({
  snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, 
    }, {
      { name = 'buffer' },
    }),
  mapping = {
    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })
  },
})
