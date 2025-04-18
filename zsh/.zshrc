#!/bin/zsh

function _x { >&2 echo "\e[90m>> $@\033[0m"; "$@"; }

export EDITOR="nvim"
export VISUAL="nvim"

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.rd/bin:$PATH"
export PATH="$HOME/.cargo/env:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

if [ -d $HOME/.oh-my-zsh ]; then
  export ZSH="$HOME/.oh-my-zsh"
  plugins=(git docker docker-compose fzf kubectl vi-mode tmux)
  ZSH_THEME="robbyrussell"
  VI_MODE_SET_CURSOR=true
  source $ZSH/oh-my-zsh.sh
fi

source $(brew --prefix)/Cellar/fzf/$(fzf --version | cut -d ' ' -f 1)/shell/key-bindings.zsh

alias v="nvim"
alias vi="nvim"
alias vim="nvim"

alias k="kubectl"
alias kd="kubectl describe"
alias kdp="kubectl describe pods"
alias kg="kubectl get"
alias kgp="kubectl get pods"
alias kgn="kubectl get namespaces"
alias kl="kubectl logs"
alias kens="kubens"
alias kctx="kubectx"

alias g="git"
alias gs="git status"
alias gc="git commit"
alias gf="git fetch"
alias gr="git rebase"
alias gw="git worktree"

alias ls="gls -h --color=always --group-directories-first"

setopt globdots

if [ -f $HOME/.work/.zshrc ]; then
  source $HOME/.work/.zshrc
fi
