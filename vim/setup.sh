#!/bin/sh

if [ -L "${HOME}/.vimrc" ]; then
  echo "skip link .vimrc"
else
  echo "add symbolic link .vimrc"
  ln -fsv "${PWD}/vim/.vimrc" "${HOME}/.vimrc"
fi