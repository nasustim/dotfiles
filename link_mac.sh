#!/bin/sh

ln -fnsv "$(pwd)/dotfile/.bash_profile" "$HOME/.bash_profile"
ln -fnsv "$(pwd)/dotfile/.bashrc" "$HOME/.bashrc"

## Vim
ln -fnsv "$(pwd)/dotfile/.vimrc" "$HOME/.vimrc"

## Microsoft Visual Studio Code
ln -fnsv "$(pwd)/vscode/setting.json" "$HOME/Library/Application Support/Code/User"
### cpp runner
ln -fnsv "$(pwd)/vscode/vscode.runner.cpp.sh" "$HOME/vscode.runner.cpp.sh"