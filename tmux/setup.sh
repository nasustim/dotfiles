#!/bin/sh

if [ -L "${HOME}/.tmux.conf" ]; then
  echo "skip link .tmux.conf"
else
  echo "add symbolic link .tmux.conf"
  ln -fsv "${PWD}/tmux/.tmux.conf" "${HOME}/.tmux.conf"
fi