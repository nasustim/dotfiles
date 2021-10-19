#!/bin/sh

curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

if [ -L "${HOME}/.zshenv" ]; then
  echo "skip link /.zshenv"
else
  echo "add symbolic link .zshenv"
  ln -fsv "${PWD}/zsh/.zshenv" "${HOME}/.zshenv"
fi

if [ -L "${HOME}/.zshrc" ]; then
  echo "skip link .zshrc"
else
  echo "add symbolic link .zshrc"
  ln -fsv "${PWD}/zsh/.zshrc" "${HOME}/.zshrc"
fi