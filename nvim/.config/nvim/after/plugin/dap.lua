local utils = require('utils')
local has_dap, dap = pcall(require, "dap")
if not has_dap then
  return
end

require('lang.all').config_dap(dap)

local has_virttext, virttext = utils.preq('nvim-dap-virtual-text')
if has_virttext then
  virttext.setup({})
end

local has_dapui, dapui = utils.preq('dapui')
if has_dapui then
  dapui.setup({})
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Leader>db', '<cmd>DapToggleBreakpoint<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>dr', '<cmd>DapContinue<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>dc', '<cmd>DapContinue<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>dt', '<cmd>DapTerminate<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>dn', '<cmd>DapStepOver<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>di', '<cmd>DapStepInto<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>do', '<cmd>DapStepOut<CR>', opts)
