#!/bin/sh

ln -fsv "$(pwd)/winsl/.bash_profile" "$HOME/.bash_profile"
ln -fsv "$(pwd)/winsl/.bashrc" "$HOME/.bashrc"

source "$HOME/.bash_profile

## Vim
ln -fsv "$(pwd)/.vimrc" "$HOME/.vimrc"