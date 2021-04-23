local pogo = require 'pogo'

pogo.setup()

vim.cmd[[autocmd BufWritePost *.go PogoFmt]]
vim.cmd[[autocmd FileType go nmap <Leader>i <Plug>(pogo-imports)]]
