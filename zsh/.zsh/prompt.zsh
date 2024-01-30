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

PROMPT='%F{%(?.green.red)%}%*%f %F{cyan}%B$(prompt_path)%b%f%F{magenta}%B$(prompt_vcs)%b%f %B→%b '
