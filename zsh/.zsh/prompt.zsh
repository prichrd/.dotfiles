#!/bin/zsh

function prompt_vcs {
  branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [[ $branch == "" ]];
  then
    echo ""
  else
    echo " $branch"
  fi
}

function prompt_path {
  echo "%3~"
}

function prompt_k8s {
  [[ $commands[kubectl] ]] && echo " $(k config current-context)"
}

function prompt_doctl {
  [[ $commands[doctl] ]] && echo " $(doctl auth list | grep current | awk '{print $1}')"
}

PROMPT='%F{%(?.green.red)%}%*%f %F{cyan}%B$(prompt_path)%b%f%F{magenta}%B$(prompt_vcs)%b%f %B→%b '
RPROMPT='%F{blue}$(prompt_k8s)%f%F{magenta}$(prompt_doctl)%f'
