local has_treesitter, treesitter = pcall(require, "nvim-treesitter.configs")
if not has_treesitter then
  return
end

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

local ts_languages = {
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
  "regex",
  "rust", 
  "toml", 
  "vim",
  "yaml", 
}

treesitter.setup{
  ensure_installed = ts_languages,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
