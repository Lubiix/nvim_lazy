#!/bin/bash

switch_to() {
    if [[ -z $TMUX ]]; then
        tmux attach-session -t $1
    else
        tmux switch-client -t $1
    fi
}

has_session() {
    tmux list-sessions | grep -q "^$1:"
}

hydrate() {
    if [ -f $2/.tmux-sessionizer ]; then
        tmux send-keys -t $1 "source $2/.tmux-sessionizer" c-M
    elif [ -f $HOME/.tmux-sessionizer ]; then
        tmux send-keys -t $1 "source $HOME/.tmux-sessionizer" c-M
    fi
}


if [[ $# -eq 1 ]]; then
    selected=$1
else
    # If someone wants to make this extensible, i'll accept
    # PR
	  # Détecter l'OS
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
		selected=$(find ~/Developpement ~/Developpement/projet_en_cours ~/Developpement/projet_en_cours/Android ~/Developpement/projet_en_cours/1.GHXAdmin ~/.config -mindepth 1 -maxdepth 1 -type d | fzf)
    elif grep -qi microsoft /proc/version; then
        # WSL (Windows)
        selected=$(find /mnt/j/Developpement ~/.config -mindepth 1 -maxdepth 1 -type d | fzf)
    else
        # Autre OS (fallback)
        selected=$(find ~/Developpement ~/.config -mindepth 1 -maxdepth 1 -type d | fzf)
    fi
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    hydrate $selected_name $selected
    exit 0
fi

if ! has_session $selected_name; then
    tmux new-session -ds $selected_name -c $selected
    hydrate $selected_name $selected
fi

switch_to $selected_name
