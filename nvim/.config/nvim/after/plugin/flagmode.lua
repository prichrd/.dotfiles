local has_flagmode, flagmode = pcall(require, "flagmode")
if not has_flagmode then
  return
end

flagmode.register('relative_number', {
  activate   = function() vim.opt.relativenumber = true; end,
  deactivate = function() vim.opt.relativenumber = false; end,
})
