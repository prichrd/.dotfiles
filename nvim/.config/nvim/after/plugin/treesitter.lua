local has_treesitter, treesitter = pcall(require, "nvim-treesitter.configs")
if not has_treesitter then
  return
end

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

treesitter.setup{
  ensure_installed = {
    "bash",
    "c", 
    "cpp", 
    "css",
    "dockerfile",
    "fish",
    "go", 
    "gomod",
    "html",
    "http",
    "javascript",
    "json",
    "lua", 
    "make",
    "python", 
    "query",
    "regex",
    "rust", 
    "toml", 
    "vim",
    "yaml", 
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "<C-k>",
      node_decremental = "<C-j>",
      scope_incremental = "<C-l>",
    },
  },
}
