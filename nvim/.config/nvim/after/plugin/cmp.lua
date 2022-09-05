local utils = require('utils')

local has_cmp, cmp = utils.preq('cmp')
if not has_cmp then
  return
end

local cfg = {
  snippet = {},
  sources = {},
  formatting = {},
  mapping = {
    ['<C-j>'] = cmp.mapping.select_next_item({
      behavior = cmp.SelectBehavior.Insert
    }),
    ['<C-k>'] = cmp.mapping.select_prev_item({
      behavior = cmp.SelectBehavior.Insert
    }),
    ['<C-l>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })
  },
}

--
-- Configure extensions
--
if utils.exists('cmp_nvim_lsp') then
  table.insert(cfg.sources, { name = 'nvim_lsp' })
end

if utils.exists('cmp_path') then
  table.insert(cfg.sources, { name = 'path' })
end

if utils.exists('cmp_buffer') then
  table.insert(cfg.sources, { name = 'buffer' })
end

if utils.exists('cmp_nvim_lua') then
  table.insert(cfg.sources, { name = 'nvim_lua' })
end

if utils.exists('cmp_luasnip', 'luasnip') then
  table.insert(cfg.sources, { name = 'luasnip' })
  cfg.snippet.expand = function(args)
    require('luasnip').lsp_expand(args.body)
  end
end

--
-- Configure formatting
--
if utils.exists('lspkind') then
  cfg.formatting.format = require('lspkind').cmp_format({
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
    })
end

cmp.setup(cfg)
