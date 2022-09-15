#!/bin/sh

if [ -L "${HOME}/.gitignore_global" ]; then
  echo "skip link .gitignore_global"
else
  echo "add symbolic link .gitignore_global"
  ln -fsv "${PWD}/git/.gitignore_global" "${HOME}/.gitignore_global"
fi

if [ -L "${HOME}/.gitconfig" ]; then
  echo "skip link .gitconfig"
else
  echo "add symbolic link .gitconfig"
  ln -fsv "${PWD}/git/.gitconfig" "${HOME}/.gitconfig"
fi

if [ ! -e "${PWD}/git/.gitconfig_formal" ]; then
  echo "!!! please make git/.gitconfig_formal"
  echo "abort"
  exit -1
fi

if [ -L "${HOME}/.gitconfig_formal" ]; then
  echo "skip link .gitconfig_formal"
else
  echo "add symbolic link .gitconfig_formal"
  ln -fsv "${PWD}/git/.gitconfig_formal" "${HOME}/.gitconfig_formal"
fi