#!/bin/sh

ln -fsv "$(pwd)/.zshenv" "$HOME/.zshenv"
ln -fsv "$(pwd)/.zshrc" "$HOME/.zshrc"

## Vim
ln -fsv "$(pwd)/.vimrc" "$HOME/.vimrc"

## Microsoft Visual Studio Code
ln -fsv "$(pwd)/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
### cpp runner
ln -fsv "$(pwd)/vscode/vscode.runner.cpp.sh" "$HOME/vscode.runner.cpp.sh"