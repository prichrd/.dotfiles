export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ZSH_TMUX_AUTOSTART=true

plugins=(git tmux fzf kubectl)

alias vim=nvim
alias vi=nvim

export PATH="$PATH:/usr/local/bin:$HOME/.local/bin:$HOME/.cargo/bin/:$HOME/go/bin/:/Library/TeX/texbin/"
export TERM=xterm-256color-italic
export WORKSPACE="$HOME/Workspace/"

# Shows hidden files in autocomplete
setopt globdots

source $HOME/.zshrc.work
source $ZSH/oh-my-zsh.sh
