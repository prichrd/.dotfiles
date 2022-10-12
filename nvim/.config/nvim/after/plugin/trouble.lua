local has_trouble, trouble = pcall(require, "trouble")
if not has_trouble then
  return
end

require("trouble").setup()
