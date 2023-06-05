local ok, netrw = pcall(require, "netrw")
if not ok then
	return
end

netrw.setup({})
