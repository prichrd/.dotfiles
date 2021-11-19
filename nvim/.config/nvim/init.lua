require 'plugins'

local g, opt, cmd = vim.g, vim.opt, vim.cmd

g.mapleader = [[ ]]
g.maplocalleader = [[ ]]

opt.list = true
opt.listchars = 'eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣'
opt.mouse = 'a'
opt.swapfile = false
opt.number = true
opt.relativenumber = true
opt.path = opt.path + '**/*'
opt.shiftwidth = 2
opt.tabstop = 2
opt.termguicolors = true
opt.expandtab = true
opt.shell = 'zsh -l'
opt.foldlevel = 20

vim.cmd [[
  nmap <C-j> :cnext<cr>
  nmap <C-k> :cprevious<cr>
  nmap <C-q> :copen<cr>

  nmap <Leader>w :w<cr>
  let g:gruvbox_invert_selection = 0
]]

cmd[[color gruvbox]]
