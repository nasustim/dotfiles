#!/bin/sh

ln -fsv "$(pwd)/.bash_profile" "$HOME/.bash_profile"
ln -fsv "$(pwd)/.bashrc_wsl" "$HOME/.bashrc"

## Vim
ln -fsv "$(pwd)/.vimrc" "$HOME/.vimrc"