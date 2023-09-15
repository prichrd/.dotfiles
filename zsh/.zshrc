#!/bin/zsh

setopt prompt_subst # Allow commands in prompt
setopt globdots # Shows hidden files in autocomplete
setopt noautocd # Prevent autocd-ing when input is directory name

alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias k="kubectl"
alias ls="ls -h --color --group-directories-first"

eval "$(/opt/homebrew/bin/brew shellenv)"

export DOCKER_DEFAULT_PLATFORM=linux/amd64
export EDITOR="nvim"
export VISUAL="nvim"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.rd/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

autoload -Uz compinit
compinit

source $HOME/.zsh/prompt.zsh
source /opt/homebrew/Cellar/fzf/0.44.1/shell/key-bindings.zsh
source /opt/homebrew/Cellar/fzf/0.44.1/shell/completion.zsh
source <(kubectl completion zsh)

bindkey -e
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

if [ -f $HOME/.work/.zshrc ]; then
  source $HOME/.work/.zshrc
fi
