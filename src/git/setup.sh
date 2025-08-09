#!/bin/sh

if [ -L "${HOME}/.gitignore_global" ]; then
  echo "skip link .gitignore_global"
else
  echo "add symbolic link .gitignore_global"
  ln -fsv "${PWD}/src/git/.gitignore_global" "${HOME}/.gitignore_global"
fi

if [ -L "${HOME}/.gitconfig" ]; then
  echo "skip link .gitconfig"
else
  echo "add symbolic link .gitconfig"
  ln -fsv "${PWD}/src/git/.gitconfig" "${HOME}/.gitconfig"
fi

if [ -L "${HOME}/.gitconfig_alt" ]; then
  echo "skip link .gitconfig_alt"
else
  echo "add symbolic link .gitconfig_alt"
  ln -fsv "${PWD}/src/git/.gitconfig_alt" "${HOME}/.gitconfig_alt"
fi