fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.local/bin
fish_add_path /usr/local/bin

alias vi="nvim"
alias vim="nvim"

if status is-interactive
and not set -q TMUX
    exec tmux
end
