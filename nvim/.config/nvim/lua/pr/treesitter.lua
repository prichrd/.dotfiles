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
  }
end

return M

