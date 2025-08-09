#!/bin/sh

## download git-prompt
curl -o zsh/.zsh/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -o zsh/.zsh/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o zsh/.zsh/_git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

if [ -L "${HOME}/.zsh" ]; then
  echo "skip link /.zsh"
else
  echo "add symbolic link .zsh"
  ln -fsv "${PWD}/zsh/.zsh" "${HOME}/.zsh"
fi

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