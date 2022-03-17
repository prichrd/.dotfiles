export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ZSH_TMUX_AUTOSTART=true

plugins=(git tmux fzf)

alias vim=nvim
alias vi=nvim

export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin/:$HOME/go/bin/:/usr/local/bin"

source $ZSH/oh-my-zsh.sh
