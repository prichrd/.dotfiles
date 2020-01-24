" Plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'          " Required for vundle to work
Plugin 'dracula/vim'                " Adds dracula color scheme
Plugin 'bling/vim-airline'          " Adds airline at the bottom of buffers
Plugin 'airblade/vim-gitgutter'     " Adds git gutter informations
Plugin 'tpope/vim-fugitive'         " Adds git commands
Plugin 'tpope/vim-dadbod'           " Adds database interface
Plugin 'tpope/vim-surround'         " Adds a way to manipulate surrounding chars
Plugin 'fatih/vim-go'               " Adds Go language support
Plugin 'AndrewRadev/splitjoin.vim'  " Adds Go struct split to multiline
Plugin 'kien/ctrlp.vim'             " Adds fuzzy file search
Plugin 'scrooloose/nerdtree'        " Adds file tree
Plugin 'jistr/vim-nerdtree-tabs'    " Adds file tree for tabs
Plugin 'valloric/youcompleteme'     " Adds autocomplete
Plugin 'vimwiki/vimwiki'            " Adds personal wiki
Plugin 'majutsushi/tagbar'          " Adds tags sidebar
call vundle#end()
filetype plugin indent on

" General configuration
set clipboard=unnamed       " Enables yanking to OS clipboard
set number relativenumber	  " Enables hybrid relative numbers 
set cursorline              " Enables the cursor line
set showmatch	              " Enables bracket match highlight
set mouse=a	                " Enables mouse usage
set tabstop=2               " Enables 2 space display for each <Tab>
set shiftwidth=2            " Enables 2 space display for each <Tab>
set expandtab               " Enables 2 space tab in insert mode

" Plugins configuration
let NERDTreeMinimalUI=1                                                           " Make nerdtree hide help message
let g:tagbar_compact=1                                                            " Make tagbar hide help message
autocmd BufWritePost * GitGutter                                                  " Update GitGutter on every save
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}] " Make vimwiki markdown

" Language specific plugin loading
augroup Golang
  autocmd FileType go TagbarOpen
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  autocmd FileType go let g:go_fmt_command="goimports"
augroup END

" Color scheme configuration
syntax on
color dracula

" Mapping configuration
map <Space> <Leader>
map <Leader>n :NERDTreeTabsToggle<CR>
map <Leader>u :NERDTreeFind<CR>
map <leader>1 1g
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt
map <Up> <nop>
map <Down> <nop>
map <Left> <nop>
map <Right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
