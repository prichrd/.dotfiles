local vim = vim

-- local jumplist, start = unpack(vim.fn.getjumplist())

-- local jl = {}
-- for _, v in pairs(jumplist) do
--   table.insert(jl, string.format("%s:%d", vim.fn.fnamemodify(vim.api.nvim_buf_get_name(v.bufnr), ":p:."), v.lnum))
-- end

-- vim.opt.winbar = jl[start-1] .. ' | ' .. jl[start] .. ' | ' .. (jl[start+1] and jl[start+1] or '-')

-- CursorMoved & CursorMovedI
vim.api.nvim_create_autocmd("CursorMoved", {
  pattern = { "*" },
  callback = function()
    local jumplist, start = unpack(vim.fn.getjumplist())
    local p = jumplist[start]
    local n = p;
    if #jumplist >= start + 2 then
      n = jumplist[start+2]
    end
    vim.opt.winbar =
        string.format("%s:%d <-> %s:%d", 
          vim.fn.fnamemodify(vim.api.nvim_buf_get_name(p.bufnr), ":p:."), p.lnum,
          vim.fn.fnamemodify(vim.api.nvim_buf_get_name(n.bufnr), ":p:."), n.lnum)
  end,
  group = vim.api.nvim_create_augroup("bongo", { clear = true }),
})
