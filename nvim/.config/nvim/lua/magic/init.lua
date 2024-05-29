local M = {}

local todo = function()
  print("[magic] no action registered")
end

M.filetypes = {}

M.set_filetypes = function(filetypes)
  M.filetypes = filetypes
end

M.plugins = {}

---@class API
M.api = {
  buffers = {
    prev = function() vim.cmd("bp") end,
    next = function() vim.cmd("bn") end,
    delete = function() vim.cmd("bd") end,
    new = function() vim.cmd("enew") end,
    format = function() vim.lsp.buf.format() end,
    format_async = function() vim.lsp.buf.format({ async = true }) end,
    find = todo,
  },
  bookmarks = {
    add = todo,
    prev = todo,
    next = todo,
    list = todo,
  },
  tabs = {
    prev = function() vim.cmd("tabp") end,
    next = function() vim.cmd("tabn") end,
    delete = function() vim.cmd("tabc") end,
    new = function() vim.cmd("tabe") end,
  },
  diagnostics = {
    prev = function() vim.diagnostic.goto_prev() end,
    next = function() vim.diagnostic.goto_next() end,
    find = todo,
  },
  quickfixes = {
    prev = function() vim.cmd("cprev") end,
    next = function() vim.cmd("cnext") end,
    find = todo,
  },
  locations = {
    prev = function() vim.cmd("lprev") end,
    next = function() vim.cmd("lnext") end,
    find = todo,
  },
  files = {
    find = todo,
    grep = todo,
    explore = todo,
  },
  keymaps = {
    find = todo,
  },
  git = {
    show_blame = todo,
    status = {
      find = todo,
    },
  },
  help_tags = {
    find = todo,
  },
  symbols = {
    goto_declaration = function() vim.lsp.buf.declaration() end,
    goto_definition = function() vim.lsp.buf.definition() end,
    goto_references = function() vim.lsp.buf.references() end,
    goto_implementation = function() vim.lsp.buf.implementation() end,
    show_definition = function() vim.lsp.buf.hover() end,
    toggle_inlay_hints = function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({})) end,
    rename = function() vim.lsp.buf.rename() end,
    find = todo,
  },
  lsp = {
    code_action = function() vim.lsp.buf.code_action() end,
  },
  plugins = {},
}

--- @alias Plugin {name: string, branch: string, main: string, dependencies: string[], opts: any, init: function, config: function, api_overrides: API}

--- @param plugin Plugin The plugin definition.
M.register_plugin = function(plugin)
  table.insert(M.plugins, {
    plugin.name,
    branch = plugin.branch,
    dependencies = plugin.dependencies,
    opts = plugin.opts,
    config = plugin.config,
    main = plugin.main,
    init = plugin.init,
  })
  M.api = vim.tbl_deep_extend("force", {}, M.api, plugin.api_overrides or {})
end

M.setup = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "--single-branch",
      "https://github.com/folke/lazy.nvim.git",
      lazypath,
    })
  end
  vim.opt.runtimepath:prepend(lazypath)
  require('lazy').setup(M.plugins)
end

return M
