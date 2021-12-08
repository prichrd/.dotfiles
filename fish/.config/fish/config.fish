fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.local/bin
fish_add_path /usr/local/bin

alias vi="nvim"
alias vim="nvim"
alias kgp="kubectl get pods"
alias kl="kubectl logs"
alias zsh_history="cat ~/.zsh_history | fzf"

if status is-interactive
and not set -q TMUX
 exec tmux new-session -A -s scratch
end
