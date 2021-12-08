function! calc#solve() abort
  exe "normal! 0y$A=\<C-r>=\<C-r>\"\<CR>"
endfunction

function! calc#scratch() abort
  below new
  resize 5
  noswapfile hide enew
  setlocal buftype=nofile
  setlocal bufhidden=hide
  file [Calc]
  imap <buffer> = <Esc>:call calc#solve()<CR>
endfunction
