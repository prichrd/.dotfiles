" vim:foldmethod=marker
map <Space> <Leader>
call plug#begin('~/.vim/plugged')
" Visual {{{
  Plug 'ap/vim-buftabline'
" }}}
" Color scheme {{{
  Plug 'dracula/vim'
" }}}
" NERDTree {{{
  Plug 'scrooloose/nerdtree'
  let NERDTreeWinSize = 30
  let NERDTreeMinimalUI = 1
  let NERDTreeQuitOnOpen = 1
  autocmd FileType nerdtree noremap <buffer> - :NERDTreeClose<CR>
  noremap - :NERDTreeFind<CR>
" }}}
" Golang {{{
  Plug 'fatih/vim-go'
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_build_constraints = 1
  let g:go_fmt_experimental = 1
  let g:go_fmt_command = 'goimports'
  let g:go_rename_command = 'gopls'
" }}}
" Python {{{
  Plug 'python-mode/python-mode'
" }}}
call plug#end()

syntax on
color dracula
set termguicolors
set number
set cursorline
set splitbelow
set expandtab
set wildmenu
set tabstop=2
set shiftwidth=2
set list listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set path+=**
set vb t_vb=
set foldmethod=syntax
