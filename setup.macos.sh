#!/bin/sh

ln -fsv "$(pwd)/macos/.zshenv" "$HOME/.zshenv"
ln -fsv "$(pwd)/macos/.zshrc" "$HOME/.zshrc"

source "$HOME/.zshenv"

## Vim
ln -fsv "$(pwd)/.vimrc" "$HOME/.vimrc"

## Microsoft Visual Studio Code
ln -fsv "$(pwd)/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
### cpp runner
ln -fsv "$(pwd)/vscode/vscode.runner.cpp.sh" "$HOME/vscode.runner.cpp.sh"