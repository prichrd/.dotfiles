call plug#begin('~/.vim/plugged')
Plug 'ap/vim-buftabline'
Plug 'dracula/vim'
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
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
set path+=**

let NERDTreeWinSize = 30
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

autocmd FileType nerdtree noremap <buffer> - :NERDTreeClose<CR>
autocmd FileType go nmap <Leader>d <Plug>(go-doc)
autocmd FileType go let g:go_fmt_command = 'goimports'
autocmd FileType go let g:syntastic_go_checkers = ['go']
autocmd FileType go let g:go_rename_command = 'gopls'
autocmd FileType py let g:syntastic_python_checkers = ['pylint']

noremap - :NERDTreeFind<CR>
map <Space> <Leader>
