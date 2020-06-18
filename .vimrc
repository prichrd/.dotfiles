set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'airblade/vim-gitgutter'
Plugin 'cjrh/vim-conda'
Plugin 'dracula/vim'
Plugin 'ervandew/supertab'
Plugin 'fatih/vim-go'
Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sirver/ultisnips'
Plugin 'tpope/vim-vinegar'
Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'
Plugin 'honza/vim-snippets'
call vundle#end()
filetype plugin indent on

syntax on
color dracula

set number relativenumber
set cursorline
set showmatch
set splitbelow
set expandtab
set ignorecase
set list
set mouse=a
set tabstop=2
set shiftwidth=2
set completeopt-=preview
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

let g:netrw_liststyle=3
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let NERDTreeMinimalUI = 1
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show = 1
let NERDTreeQuitOnOpen=1


augroup default
  autocmd BufWritePost * GitGutter
  autocmd FileType nerdtree noremap <buffer> - :NERDTreeClose<CR>
augroup END 

augroup go
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

augroup py
  autocmd FileType py let g:syntastic_python_checkers = ['pylint']
augroup END

augroup java
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup END

map <Space> <Leader>
noremap - :NERDTreeFind<CR>
noremap <Leader>ff :FZF<CR>
noremap <Leader>fw :Ag<CR>

noremap <Leader>bl :buffers<CR>
noremap <Leader>bf :Buffers<CR>
noremap <Leader>bn :bnext<CR>
noremap <Leader>bp :bprevious<CR>
noremap <Leader>bw :bwipe<CR>
for i in range(1,9)
  execute "noremap \<Leader>b". i ." :b". i "\<CR>"
endfor
noremap <Leader>ml :marks<CR>
noremap <Leader>mf :Marks<CR>
noremap <Leader>rl :registers<CR>
