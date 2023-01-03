local M = {}

M.ftypes = function()
  return {'go'}
end

M.setup = function()
  require('dap')
  require('dap-go').setup()

  local opts = { noremap = true, silent = true }
  vim.keymap.set('n', '<Leader>db', require'dap'.toggle_breakpoint, opts)
  vim.keymap.set('n', '<Leader>dc', require'dap'.continue, opts)
  vim.keymap.set('n', '<Leader>di', require'dap'.step_into, opts)
  vim.keymap.set('n', '<Leader>do', require'dap'.step_out, opts)
  vim.keymap.set('n', '<Leader>dn', require'dap'.step_over, opts)
  vim.keymap.set('n', '<Leader>dd', require'dap'.repl.toggle, opts)
  vim.keymap.set('n', '<Leader>dq', require'dap'.terminate, opts)
  vim.keymap.set('n', '<Leader>dr', require'dap'.run_to_cursor, opts)
  vim.keymap.set('n', '<Leader>dr', require'dap'.run_to_cursor, opts)
end

return M
