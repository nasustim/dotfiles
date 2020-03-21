#!/bin/sh

ln -fsv "$(pwd)/macos/.zshenv" "$HOME/.zshenv"
ln -fsv "$(pwd)/macos/.zshrc" "$HOME/.zshrc"

source "$HOME/.zshenv"

## Vim
ln -fsv "$(pwd)/.vimrc" "$HOME/.vimrc"

## Microsoft Visual Studio Code
ln -fsv "$(pwd)/vscode/settings.json" "$HOME/.vscode/settings.json"
### cpp runner
ln -fsv "$(pwd)/vscode/c_cpp_properties.json" "$HOME/.vscode/c_cpp_properties.json"
ln -fsv "$(pwd)/vscode/runner.cpp.sh" "$HOME/.vscode/runner.cpp.sh"