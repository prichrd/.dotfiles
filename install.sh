#!/bin/bash

for f in *; do
  if [ -d "$f" ]; then
    echo "Configuring $f"
    if [[ -f "$f/install.sh" ]]; then
      "$f/install.sh"
    else
      stow -D $f
      stow $f
    fi
  fi
done
