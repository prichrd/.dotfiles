local g = vim.g
g.matlab_binary_path = "/Applications/MATLAB_R2021b.app/bin/matlab"
g.matlab_split_vert = 1

vim.cmd[[
  autocmd FileType matlab nmap <Leader>r <Plug>(matlab-run)
  autocmd FileType matlab nmap <Leader>d <Plug>(matlab-describe)
]]
