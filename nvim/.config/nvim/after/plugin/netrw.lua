local has_netrw, netrw = pcall(require, "netrw")
if not has_netrw then
  return
end

netrw.setup{
  mappings = {
    ["p"] = function(payload)
      require'manatee'.set_vwd(payload.dir, true)
    end,
    ["pp"] = function(payload)
      print(vim.inspect(payload))
    end
  },
}
