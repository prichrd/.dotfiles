#!/bin/bash

cd "$(dirname "$0")"
mkdir -p ~/.config

# stow -D only unlinks files that still exist in a package, so links to deleted
# files (or deleted packages) are left dangling. Remove broken links into this repo.
repo="$(basename "$PWD")/"
for top in "" $(ls -A */ | grep -v ':$' | sort -u); do
  depth=$([ -z "$top" ] && echo "-maxdepth 1")
  [ -d "$HOME/$top" ] && [ ! -L "$HOME/$top" ] || continue
  find "$HOME/$top" $depth -type l ! -exec test -e {} \; -print | while read -r l; do
    if [[ "$(readlink "$l")" == *"$repo"* ]]; then
      echo "Pruning $l"
      rm "$l"
      rmdir "$(dirname "$l")" 2>/dev/null
    fi
  done
done

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
