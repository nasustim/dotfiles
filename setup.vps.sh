#!/bin/sh

ln -fsv "$(pwd)/linux/.bash_profile" "$HOME/.bash_profile"
ln -fsv "$(pwd)/linux/.bashrc" "$HOME/.bashrc"

source "$HOME/.bash_profile"

## Vim
ln -fsv "$(pwd)/.vimrc" "$HOME/.vimrc"