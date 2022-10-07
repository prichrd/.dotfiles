local has_netrw, netrw = pcall(require, "netrw")
if not has_netrw then
  return
end

netrw.setup{
  enable_icons = true,
}
