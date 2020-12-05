" Section: Bootstrap
map <Space> <Leader>
call plug#begin('~/.vim/plugged')

" Section: Visual
Plug 'dracula/vim'
set termguicolors
set number
set cursorline
set list listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

" Section: Navigation
set mouse=a
set path+=**/*

" Section: Editing
Plug 'tpope/vim-commentary'
set expandtab
set tabstop=2
set shiftwidth=2
set modelineexpr
set noswapfile
Plug 'godlygeek/tabular'

" Section: Completion
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" Section: Databases
Plug 'vim-scripts/dbext.vim'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

" Section: Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
autocmd BufWritePost * GitGutter
 
" Section: Golang
Plug 'fatih/vim-go'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
autocmd FileType go set foldmethod=syntax foldlevel=20
autocmd FileType go nmap <Leader>i <Plug>(go-imports)
autocmd FileType go nmap <Leader>b <Plug>(go-build)
autocmd FileType go nmap <Leader>l <Plug>(go-lint)
autocmd FileType go nmap <Leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>d <Plug>(go-doc)
autocmd Filetype go nmap <Leader>a <Plug>(go-alternate-edit)

" Section: Python
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Section: C
autocmd FileType c nmap <Leader>b :make<CR>

" Section: Markdown
Plug 'tpope/vim-markdown'

" Section: Ctags
Plug 'ludovicchabant/vim-gutentags'

" Section: End
call plug#end()
syntax on
color dracula
" vim:set et sw=2 foldmethod=expr foldexpr=getline(v\:lnum)=~'^\"\ Section\:'?'>1'\:'=':
