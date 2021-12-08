local has_lspsignature, lspsignature = pcall(require, "lspsignature")
if not has_lspsignature then
  return
end

lspsignature.setup()
