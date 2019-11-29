#!/bin/sh

ln -fsv "$(pwd)/.bash_profile" "$HOME/.bash_profile"
ln -fsv "$(pwd)/.bashrc" "$HOME/.bashrc"

## Vim
ln -fsv "$(pwd)/.vimrc" "$HOME/.vimrc"

## Microsoft Visual Studio Code
ln -fsv "$(pwd)/vscode/setting.json" "$HOME/Library/Application Support/Code/User/setting.json"
### cpp runner
ln -fsv "$(pwd)/vscode/vscode.runner.cpp.sh" "$HOME/vscode.runner.cpp.sh"