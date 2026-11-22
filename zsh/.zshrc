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

# History: large, shared across sessions, no duplicates
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt share_history extended_history hist_ignore_all_dups hist_ignore_space hist_reduce_blanks

# Completion (brew formulas, Docker Desktop and kubectl)
fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
[ -d "$HOME/.docker/completions" ] && fpath=("$HOME/.docker/completions" $fpath)
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
command -v kubectl >/dev/null && source <(kubectl completion zsh)

# Vi mode: beam cursor in insert, block in normal
bindkey -v
KEYTIMEOUT=1
bindkey -M viins '^?' backward-delete-char '^H' backward-delete-char
_vi_cursor() { [[ $KEYMAP == vicmd ]] && printf '\e[2 q' || printf '\e[6 q'; }
zle-keymap-select() { _vi_cursor; }
zle-line-init() { _vi_cursor; }
zle -N zle-keymap-select
zle -N zle-line-init

# Prompt: robbyrussell look, with git branch and dirty marker
setopt prompt_subst
_git_prompt_info() {
  local ref
  ref=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null) || return
  ref=${ref//\%/%%}
  if [[ -n $(git status --porcelain --ignore-submodules=dirty 2>/dev/null | head -n 1) ]]; then
    echo "%B%F{blue}git:(%F{red}${ref}%F{blue}) %F{yellow}✗%f%b "
  else
    echo "%B%F{blue}git:(%F{red}${ref}%F{blue})%f%b "
  fi
}
PROMPT='%B%(?:%F{green}:%F{red})➜  %F{cyan}%c%f%b $(_git_prompt_info)'

source $(brew --prefix)/Cellar/fzf/$(fzf --version | cut -d ' ' -f 1)/shell/key-bindings.zsh

alias v="nvim"
alias vi="nvim"
alias vim="nvim"

alias k="kubectl"
alias kdp="kubectl describe pods"
alias kgp="kubectl get pods"

alias g="git"

alias ls="gls -h --color=always --group-directories-first"

setopt globdots

if [ -f $HOME/.work/.zshrc ]; then
  source $HOME/.work/.zshrc
fi
