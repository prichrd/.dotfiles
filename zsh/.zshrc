case $(tty) in
  (/dev/tty[1-9]) exec sway;;
esac

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ZSH_TMUX_AUTOSTART=true

plugins=(git tmux fzf kubectl)

alias vim=nvim
alias vi=nvim
alias fd=fdfind

export EDITOR="nvim"
export VISUAL="nvim"
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin/:$HOME/go/bin/:/usr/local/go/bin:$HOME/Tools/lua-language-server/bin"
export WORKSPACE="$HOME/Workspace/"
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland

setopt globdots # Shows hidden files in autocomplete
setopt noautocd # Prevent autocd-ing when input is directory name

source $ZSH/oh-my-zsh.sh

# Source work zshrc if it exists
if [ -f $HOME/Work/.zshrc ]; then
  source $HOME/Work/.zshrc
fi
