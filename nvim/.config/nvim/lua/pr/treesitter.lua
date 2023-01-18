local ft = {
  'go',
  'gomod',
  'rust',
  'lua',
}

local M = {}

M.ftypes = function()
  return ft
end

M.setup = function()
  local ts = require'nvim-treesitter.configs'
  ts.setup {
    ensure_installed = ft,
    highlight = {
      enable = true,
    },
    disable = function(_, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
  }
  vim.cmd[[
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    set nofoldenable
  ]]
end

return M

