#!/bin/zsh

setopt prompt_subst           # Allow commands in prompt
setopt globdots               # Shows hidden files in autocomplete
setopt noautocd               # Prevent autocd-ing when input is directory name
setopt hist_ignore_dups       # Ignore commands made one after the other
setopt hist_expire_dups_first # Remove duplicate events from history first
setopt inc_append_history     # Append to history as commands are added, not when shell is exited
unsetopt share_history        # Don't share history between sessions

alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias k="kubectl"
alias kdp="kubectl describe pods"
alias kgp="kubectl get pods"
alias kl="kubectl logs"
alias ls="ls -h --color --group-directories-first"

eval "$(/opt/homebrew/bin/brew shellenv)"

# export DOCKER_DEFAULT_PLATFORM=linux/amd64
export DOCKER_DEFAULT_PLATFORM=linux/arm64
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

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey -e
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

if [ -f $HOME/.work/.zshrc ]; then
  source $HOME/.work/.zshrc
fi
