vim.g.mapleader = [[ ]]

local magic = require("magic")

-- Next and previous
vim.keymap.set("n", "[b", magic.api.buffers.prev)
vim.keymap.set("n", "]b", magic.api.buffers.next)
vim.keymap.set("n", "[t", magic.api.tabs.prev)
vim.keymap.set("n", "]t", magic.api.tabs.next)
vim.keymap.set('n', '[d', magic.api.diagnostics.prev)
vim.keymap.set('n', ']d', magic.api.diagnostics.next)
vim.keymap.set('n', '[q', magic.api.quickfixes.prev)
vim.keymap.set('n', ']q', magic.api.quickfixes.next)
vim.keymap.set('n', '[l', magic.api.locations.prev)
vim.keymap.set('n', ']l', magic.api.locations.next)

-- Find
vim.keymap.set("n", "<Leader>fb", magic.api.buffers.find)
vim.keymap.set("n", "<Leader>fh", magic.api.help_tags.find)
vim.keymap.set("n", "<Leader>ff", magic.api.files.find)
vim.keymap.set("n", "<Leader>fg", magic.api.files.grep)
vim.keymap.set("n", "<Leader>fq", magic.api.quickfixes.find)
vim.keymap.set("n", "<Leader>fk", magic.api.keymaps.find)
vim.keymap.set("n", "<Leader>fs", magic.api.git.status.find)

-- Explore
vim.keymap.set("n", "-", magic.api.files.explore)
vim.keymap.set("n", "<Leader>hh", magic.api.bookmarks.list)
vim.keymap.set("n", "<Leader>ha", magic.api.bookmarks.add)
vim.keymap.set("n", "]h", magic.api.bookmarks.next)
vim.keymap.set("n", "[h", magic.api.bookmarks.prev)

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LspConfig', {}),
  callback = function(ev)
    vim.api.nvim_buf_set_option(ev.buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', magic.api.symbols.goto_declaration, opts)
    vim.keymap.set('n', 'gd', magic.api.symbols.goto_definition, opts)
    vim.keymap.set('n', 'gr', magic.api.symbols.goto_references, opts)
    vim.keymap.set('n', 'gi', magic.api.symbols.goto_implementation, opts)
    vim.keymap.set('n', 'K', magic.api.symbols.show_definition, opts)
    vim.keymap.set('n', 'L', magic.api.symbols.toggle_inlay_hints, opts)
    vim.keymap.set('n', '<Leader>rn', magic.api.symbols.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<Leader>ca', magic.api.lsp.code_action, opts)
    vim.keymap.set("n", "<C-f>", magic.api.buffers.format_async, opts)
  end
})
