case $(tty) in
  (/dev/tty[1-9]) exec startx;;
esac

# MacOS configs
if [[ $(uname) == "Darwin" ]]; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ZSH_TMUX_AUTOSTART=true
plugins=(git tmux fzf kubectl shrink-path)
source $ZSH/oh-my-zsh.sh
PROMPT='%(?:%{$fg[green]%}$:%{$fg[red]%}$) %{$fg[cyan]%}$(shrink_path -f)%{$reset_color%} $(git_prompt_info)'

alias vim=nvim
alias vi=nvim

export EDITOR="nvim"
export VISUAL="nvim"
export PATH="$PATH:$HOME/.local/bin"

setopt globdots # Shows hidden files in autocomplete
setopt noautocd # Prevent autocd-ing when input is directory name

# Source work zshrc if it exists
if [ -f $HOME/.work/.zshrc ]; then
  source $HOME/.work/.zshrc
fi

