#!/bin/sh

TYPE="misc"

if [ -L "${HOME}/.cargo/env" ]; then
  echo "skip link .cargo/env"
else
  echo "add symbolic link .cargo/env"
  mkdir "${HOME}/.cargo"
  ln -fsv "${PWD}/${TYPE}/.cargo/env" "${HOME}/.cargo/env"
fi

if [ "$(uname)" == 'Darwin' ]; then
  if [ -L "${HOME}/.Brewfile" ]; then
    echo "skip link .Brewfile"
  else
    echo "add symbolic link .Brewfile"
    ln -fsv "${PWD}/${TYPE}/macos/.Brewfile" "${HOME}/.Brewfile"
  fi

  echo "prepare Brewfile"
  echo "you have to execute '$ brew bundle --file ~/.Brewfile'"
fi
