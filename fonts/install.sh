#!/bin/zsh

scriptdir=${0:a:h}
uname="$(uname -s)"
case "${uname}" in
    Linux*)     fontspath="$HOME/.fonts/";;
    Darwin*)    fontspath="$HOME/Library/Fonts/";;
esac
mkdir -p $fontspath
cp -r $scriptdir/*.ttf "$fontspath"
