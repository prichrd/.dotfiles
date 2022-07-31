local has_dap, dap = pcall(require, "dap")
if not has_dap then
  return
end

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}

