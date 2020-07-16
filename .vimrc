" Section: Bootstrap
map <Space> <Leader>
call plug#begin('~/.vim/plugged')

" Section: Visual
set mouse=a
set termguicolors
set number
set cursorline
set list listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'

" Section: Navigation
Plug 'scrooloose/nerdtree'
let NERDTreeWinSize = 30
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1
autocmd FileType nerdtree noremap <buffer> - :NERDTreeClose<CR>
noremap - :NERDTreeFind<CR>
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>w :Ag<CR>

" Section: Editing
set expandtab
set tabstop=2
set shiftwidth=2
set modelineexpr

" Section: Completion
Plug 'valloric/youcompleteme'
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = '<C-n>'
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
Plug 'honza/vim-snippets'

" Section: Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
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
let g:go_fmt_experimental = 1
let g:go_fmt_command = 'goimports'
let g:go_rename_command = 'gopls'
autocmd FileType go set foldmethod=syntax foldlevel=20

" Section: Python
Plug 'davidhalter/jedi-vim'


" Section: PlantUML
Plug 'aklt/plantuml-syntax'

" Section: End
call plug#end()
syntax on
color dracula

" vim:set et sw=2 foldmethod=expr foldexpr=getline(v\:lnum)=~'^\"\ Section\:'?'>1'\:'=':
