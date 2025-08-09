#!/bin/sh

if [ -L "${HOME}/.tmux.conf" ]; then
  echo "skip link .tmux.conf"
else
  echo "add symbolic link .tmux.conf"
  ln -fsv "${PWD}/src/tmux/.tmux.conf" "${HOME}/.tmux.conf"
fi