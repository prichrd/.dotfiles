--- @alias Location { path: string, line: number, column: number }
--- @alias StepKind "find_file" | "grep"
--- @alias Step { kind: StepKind, query: string, locations: Location[] }

local M = {
  bufnr = -1,
  locations = {},
}


M.run = function()
  local job = vim.fn.jobstart(
    'fd -c never --type file',
    {
      cwd = '.',
      on_exit = function(jobid, data, event)
      end,
      on_stdout = function(jobid, data, event)
        print("data", vim.inspect(data))
      end,
      on_stderr = function(jobid, data, event)
      end
    }
  )
end

M.run()

return M
