call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-buftabline'
Plug 'dracula/vim'
Plug 'fatih/vim-go'
Plug 'ludovicchabant/vim-gutentags'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sirver/ultisnips'
Plug 'valloric/youcompleteme'
call plug#end()

syntax on
color dracula

set number relativenumber
set cursorline
set splitbelow
set expandtab
set wildmenu
set mouse=a
set tabstop=2
set shiftwidth=2
set list listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

let NERDTreeWinSize = 30
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1
let g:UltiSnipsExpandTrigger = ";"
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

augroup base
  autocmd BufWritePost * GitGutter
  autocmd FileType nerdtree noremap <buffer> - :NERDTreeClose<CR>
augroup END

augroup golang
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)
  autocmd FileType go let g:go_fmt_command = 'goimports'
  autocmd FileType go let g:syntastic_go_checkers = ['go']
  autocmd FileType go let g:go_rename_command = 'gopls'
  autocmd FileType go let g:go_highlight_types = 1
  autocmd FileType go let g:go_highlight_fields = 1
  autocmd FileType go let g:go_highlight_functions = 1
  autocmd FileType go let g:go_highlight_function_calls = 1
  autocmd FileType go let g:go_highlight_operators = 1
  autocmd FileType go let g:go_highlight_extra_types = 1
  autocmd FileType go let g:go_highlight_build_constraints = 1
augroup END

augroup python
  autocmd FileType py let g:syntastic_python_checkers = ['pylint']
augroup END

noremap - :NERDTreeFind<CR>
map <Space> <Leader>
