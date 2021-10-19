#!/bin/sh

if [ -L "${HOME}/.gitignore_global" ]; then
  echo "skip link .gitignore_global"
else
  echo "add symbolic link .gitignore_global"
  ln -fsv "${PWD}/git/.gitignore_global" "${HOME}/.gitignore_global"
fi