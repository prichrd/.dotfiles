-- Disable gopls and auto format, pogo.nvim does it.
vim.g.go_gopls_enabled = 0
vim.g.go_fmt_autosave = 0
vim.g.go_imports_autosave = 0

vim.cmd[[
  autocmd FileType go nmap <Leader>b <Plug>(go-build)
  autocmd FileType go nmap <Leader>r <Plug>(go-run)
  autocmd FileType go nmap <Leader>t <Plug>(go-test)
  autocmd Filetype go nmap <Leader>a <Plug>(go-alternate-edit)
  autocmd Filetype go nmap <Leader>s <Plug>(go-fill-struct)
]]
