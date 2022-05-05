export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ZSH_TMUX_AUTOSTART=true

plugins=(git tmux fzf kubectl)

alias vim=nvim
alias vi=nvim
alias ws='cd ~/Workspace'

export PATH="$PATH:/usr/local/bin:$HOME/.local/bin:$HOME/.cargo/bin/:$HOME/go/bin/:/Library/TeX/texbin/"
export PATH="$PATH:/usr/local/opt/python/libexec/bin/"

source $ZSH/oh-my-zsh.sh

source ~/.work/.zshrc
