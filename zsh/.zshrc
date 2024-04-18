#!/bin/zsh

setopt prompt_subst           # Allow commands in prompt
setopt globdots               # Shows hidden files in autocomplete
setopt noautocd               # Prevent autocd-ing when input is directory name
setopt hist_ignore_dups       # Ignore commands made one after the other
setopt hist_expire_dups_first # Remove duplicate events from history first
setopt inc_append_history     # Append to history as commands are added, not when shell is exited
setopt extended_history       # Write the history file in the ":start:elapsed;command" format.
setopt hist_ignore_all_dups   # Delete old recorded entry if new entry is a duplicate.
setopt hist_find_no_dups      # Do not display a line previously found.
setopt hist_ignore_space      # Don't record an entry starting with a space.
setopt hist_save_no_dups      # Don't write duplicate entries in the history file.
setopt hist_reduce_blanks     # Remove superfluous blanks before recording entry.

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
alias ls="ls -h --color --group-directories-first"

eval "$(/opt/homebrew/bin/brew shellenv)"

# export DOCKER_DEFAULT_PLATFORM=linux/amd64
export DOCKER_DEFAULT_PLATFORM=linux/arm64
export EDITOR="nvim"
export VISUAL="nvim" # Will bind vim keys

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.rd/bin:$PATH"
export PATH="$HOME/.cargo/env:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

autoload -Uz compinit
compinit

source $HOME/.zsh/prompt.zsh
(( $+commands[fzf] )) && source /opt/homebrew/Cellar/fzf/0.44.1/shell/key-bindings.zsh
(( $+commands[fzf] )) && source /opt/homebrew/Cellar/fzf/0.44.1/shell/completion.zsh
(( $+commands[op] )) && source <(op completion zsh)
(( $+commands[kubectl] )) && source <(kubectl completion zsh)
(( $+commands[docker] )) && source <(docker completion zsh)
(( $+commands[tilt] )) && source <(tilt completion zsh)
(( $+commands[kind] )) && eval "$(kind completion zsh)"; compdef _kind kind

autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
autoload -Uz edit-command-line
zle -N edit-command-line

bindkey -M vicmd 'vv' edit-command-line
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

if [ -f $HOME/.work/.zshrc ]; then
  source $HOME/.work/.zshrc
fi
