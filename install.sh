#!/bin/bash

for f in *; do
  if [ -d "$f" ]; then
    echo "Configuring $f"
    stow -D $f
    stow $f
  fi
done

