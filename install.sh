#!/bin/bash

mkdir -p ~/.config

for f in *; do
  if [ -d "$f" ]; then
    echo "Configuring $f"
    if [[ -f "$f/install.sh" ]]; then
      "$f/install.sh"
    else
      stow -D "$f"
      stow --no-folding "$f"
    fi
  fi
done
