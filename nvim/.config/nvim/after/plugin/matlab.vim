let g:matlab_binary_path = "/Applications/MATLAB_R2021b.app/bin/matlab"
let g:matlab_split_vert = 1

autocmd FileType matlab nmap <Leader>r <Plug>(matlab-run)
autocmd FileType matlab nmap <Leader>d <Plug>(matlab-describe)
